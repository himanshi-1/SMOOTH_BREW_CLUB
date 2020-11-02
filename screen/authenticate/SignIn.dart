
import 'package:My_Cafeteria/decoration/Constant.dart';
import 'package:My_Cafeteria/decoration/Loading.dart';
import 'package:flutter/material.dart';
import 'package:My_Cafeteria/services/Auth.dart';
class SignIn extends StatefulWidget {
  Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthServices _auth =  AuthServices();
  final _formkey=GlobalKey<FormState>();
  String email="";
  String password="";
  String error="";
  bool loading=false;
  @override
  Widget build(BuildContext context) {

    return loading? Loading():Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        backgroundColor:Colors.teal[500],
        title: Text("My Cafeteria"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Register"),
            onPressed: () {
               widget.toggleView();
            },
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
                 hintText:'Email'
               ),
               onChanged:(val){
                 setState(() {
                   return email=val;
                 });
               },
               validator: (value) {
                 if (value.isEmpty) {
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
               validator: (value) {
                 if (value.isEmpty) {
                   return 'Password Required';
                 }
                 return null;
               },
             ),
             SizedBox(height: 20.0,),
             RaisedButton.icon(
               icon: Icon(Icons.person),
               label: Text("Sign In"),
               onPressed: () async{
                 setState(() {
                   return loading= true;
                 });
    if(_formkey.currentState.validate()){
                 dynamic result = await _auth.emailSignIn(email,password);
                 if(result==null) {
                   error="Invalid Credential";
                   loading=false;
                 }
    }

               },
             ),
             Text(error),
           ],
          ),
        ),
      ),
    );
  }
}

