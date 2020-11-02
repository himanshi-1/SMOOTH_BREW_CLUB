import 'package:My_Cafeteria/screen/authenticate/Register.dart';
import 'package:flutter/material.dart';
import 'package:My_Cafeteria/screen/authenticate/SignIn.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool signIn=true;
  void toggleView(){
    setState(() {
      return signIn=!signIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(signIn){
      return SignIn(toggleView:toggleView);
    }else{
      return Register(toggleView:toggleView);
    }
  }
}
