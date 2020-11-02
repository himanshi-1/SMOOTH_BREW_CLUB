import 'package:My_Cafeteria/model/Coffee.dart';
import 'package:My_Cafeteria/model/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Database{
  String uid;
  Database({this.uid});
  final CollectionReference coffeeReference=Firestore.instance.collection("Coffee");
  Future dataServices(String name, String sugar, int strength){
    return coffeeReference.document(uid).setData({
      'name':name,
      'sugar':sugar,
      'strength':strength,
    });
  }
  List<Coffee> _coffeeListSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return
        Coffee(name:doc.data['name'],
          sugar:doc.data['sugar'],
          strength:doc.data['strength'],
        );
    }).toList();
  }
  Stream<List<Coffee>> get coffee{
    return coffeeReference.snapshots().map(_coffeeListSnapshot);
  }
  UserData _settingFormSnapshot(DocumentSnapshot snapshot){
    return UserData(uid:uid,name:snapshot.data['name'],sugar:snapshot.data['sugar'],strength:snapshot.data['strength']);
  }
  Stream<UserData> get userData{
    return coffeeReference.document(uid).snapshots().map(_settingFormSnapshot);
  }
}