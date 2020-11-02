import 'package:My_Cafeteria/decoration/Constant.dart';
import 'package:My_Cafeteria/model/User.dart';
import 'package:My_Cafeteria/screen/authenticate/Database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  String _nameValue;
  String _sugarValue;
  int _strengthValue;
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);
    final _formKey=GlobalKey<FormState>();
    return Container(
      padding: EdgeInsets.fromLTRB(20, 6, 20, 6),
      child:StreamBuilder<UserData>(
        stream:Database(uid:user.uid).userData,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            UserData userdata=snapshot.data;
            return Form(
              child: Column(
                children: <Widget>[
                  Text("Change the order"),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration:TextInputDecoration,
                    initialValue: _nameValue?? null,
                    onChanged:(val) {
                      setState(() {
                        return _nameValue = val;
                      }
                      );
                    }
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: Colors.indigo, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: DropdownButtonFormField<int>(
                      decoration: TextInputDecoration,
                      value: _sugarValue ?? 0,
                      items: [0,1,2,3,4]
                          .map((label) => DropdownMenuItem(
                        child: Text('${label.toString()} sugar'),
                        value: label,
                      ))
                          .toList(),
                      hint: Text('Sugar'),
                      onChanged: (val){
                        return _sugarValue=val;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                Slider(
                      value: _strengthValue.toDouble(),
                      min: 100.0,
                      max: 900.0,
                      divisions: 8,
                      activeColor: Colors.brown[_strengthValue],
                      inactiveColor: Colors.brown[_strengthValue],
                      label: 'Set a value',
                      onChanged: (double newValue) {
                        setState(() {
                          _strengthValue = newValue.round();
                        });
                      },
                      semanticFormatterCallback: (double newValue) {
                        return '${newValue.round()}';
                      }
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton.icon(onPressed: () async{
                    if(_formKey.currentState.validate()){
                      await Database(uid: user.uid).dataServices(
                        _nameValue ?? userdata.name,
                         _sugarValue ?? userdata.sugar,
                         _strengthValue ?? userdata.strength
                      );
                    }
                    },
                      icon:Icon(Icons.arrow_upward),
                      label: Text("Update")),
                ],
              ),
            );
          }
        }
      ),
    );
  }
}
