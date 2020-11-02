import 'package:My_Cafeteria/model/User.dart';
import 'package:My_Cafeteria/screen/authenticate/Database.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthServices{
  final FirebaseAuth _auth= FirebaseAuth.instance;
  User _user(FirebaseUser user){
    return user!=null? User(uid: user.uid): null;
  }
  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_user);
  }
//  Future anonymousSignIn() async{
//    try{
//      AuthResult result =await _auth.signInAnonymously();
//      FirebaseUser user=result.user;
//      return _user(user);
//    }catch(e){
//      print(e.toString());
//      return null;
//    }
//  }
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }

  }
  Future emailSignIn(String email, String password) async{
    try{
      AuthResult result =await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;
      return _user(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  Future emailSignInRegister(String email, String password) async{
    try{
      AuthResult result =await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;
      await Database(uid:user.uid).dataServices('himanshi','1',2);
      return _user(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}