import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      backgroundColor: Colors.white,
      body: Center(


          child: Column(
            children: <Widget>[
          SizedBox(
               height: 70.0,
             ),
              Image.asset(
                "images/RPKT.gif",
                height: 125.0,
                width: 125.0,
              ),
//            SizedBox(
//              height: 40.0,
//            ),
//            CircleAvatar(
//              backgroundImage: AssetImage('images/mug.png'),
//            ),
//            SizedBox(
//              height: 10.0,
//            ),
//            SpinKitWave(
//              color: Colors.green,
//              size: 40.0,
//            ),
            ],
          ),

      ),
    );
  }
}
