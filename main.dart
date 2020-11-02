import 'package:My_Cafeteria/screen/authenticate/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:My_Cafeteria/model/User.dart';
import 'package:My_Cafeteria/screen/Wrapper.dart';
import 'package:My_Cafeteria/services/Auth.dart';


void main() {
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthServices().user,
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
          home:Wrapper(),
        ),
     );
   }
}

