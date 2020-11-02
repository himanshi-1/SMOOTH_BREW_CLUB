import 'package:My_Cafeteria/model/Coffee.dart';
import 'package:My_Cafeteria/screen/authenticate/Database.dart';
import 'package:My_Cafeteria/screen/home/CoffeeList.dart';
import 'package:My_Cafeteria/screen/home/SettingForm.dart';
import 'package:flutter/material.dart';
import 'package:My_Cafeteria/services/Auth.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void showSetting(){
      showModalBottomSheet(context: context, builder:(context){

          return Container(

              child: SettingForm()
          );

      });
    }
    return StreamProvider<List<Coffee>>.value(
      value: Database().coffee,
    child:Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        title: Text("My Cafeteria"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("SignOut"),
            onPressed: () async{
              await AuthServices().signOut();
            },
          ),
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text(""),
            onPressed: () {
              return showSetting();
            },
          ),
        ],
      ),
      body: CoffeeList(),
    )
    );
  }
}
