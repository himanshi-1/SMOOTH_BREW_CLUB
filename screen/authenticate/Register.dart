
import 'package:My_Cafeteria/decoration/Constant.dart';
import 'package:My_Cafeteria/decoration/Loading.dart';
import 'package:My_Cafeteria/services/Auth.dart';
import 'package:flutter/material.dart';
class Register extends StatefulWidget {
  Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey=GlobalKey<FormState>();
  String email="";
  String password="";
  String error="";
  AuthServices _auth =AuthServices();
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return loading?Loading():Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text("Register"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Back"),
            onPressed: () {
              widget.toggleView();
            }
          ),
        ],



      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: Form(
          key: _formkey,

          child: Column(

            children: <Widget>[
              TextFormField(
                decoration: TextInputDecoration.copyWith(
                  hintText: 'Email',
                ),
                onChanged:(val){
                  setState(() {
                    return email=val;
                  });
                },
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Email Required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: TextInputDecoration.copyWith(
                  hintText: 'Password',
                ),
                onChanged:(val){
                  setState(() {
                    return password=val;
                  });
                },
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Password Required';
                  }
                  return null;
                },

              ),
              SizedBox(height: 20.0,),
              RaisedButton.icon(
                onPressed:() async{
                  setState(() {
                    return loading= true;
                  });
                  if(_formkey.currentState.validate()){
                    dynamic result = await _auth.emailSignInRegister(email,password);
                    if(result==null){
                       error="invalid user";
                       loading=false;
                    }
                  }
                },
                icon: Icon(Icons.person),
                label: Text("Register"),
              ),
              Text(error),
            ],
          ),
        ),
      ),
    );
  }
}
