import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfirebaseapp/main.dart';
import 'package:flutterfirebaseapp/modal/user.dart';

class DatabaseServices {
  final String uid;

  DatabaseServices({this.uid});

  //Collection references
  CollectionReference _collectionReference =
      Firestore.instance.collection('users');

  //
  Future updateUserData(String sugars, String name, int strength) async {
    return await _collectionReference
        .document(uid)
        .setData({'sugars': sugars, 'name': name, 'strength': strength});
  }

  //user list from snapshot
  List<User> usersList(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return User(
          name: doc.data['name'] ?? '',
          sugars: doc.data['sugars'] ?? '',
          strength: doc.data['strength'] ?? 0);
    }).toList();
  }

  //Fetch the user data
  Stream<List<User>> get users {
    return _collectionReference.snapshots().map(usersList);
  }
}
