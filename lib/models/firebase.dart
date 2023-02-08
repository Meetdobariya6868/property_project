import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSetup(String displayName, String email, String phoneNumber,
    String role, String Image) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  var firebaseUser = await FirebaseAuth.instance.currentUser;
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  users.doc(firebaseUser!.uid).set({
    'name': displayName,
    'userId': uid,
    'email': email,
    'mobileNumber': phoneNumber,
    'role': role,
    'Image': Image
  });
  //users.add({'Name': displayName, 'User Id': uid, 'Email': email, 'Mobile Number':phoneNumber, 'Password': password,'Role':role });
  return;
}

Future<void> user(String displayName, String phoneNumber, String password,
    String role) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  var firebaseUser = await FirebaseAuth.instance.currentUser;
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  users.doc(firebaseUser!.uid).set({
    'name': displayName,
    'userId': uid,
    'mobileNumber': phoneNumber,
    'password': password,
    'role': role
  });
  //users.add({'Name': displayName, 'User Id': uid, 'Email': email, 'Mobile Number':phoneNumber, 'Password': password,'Role':role });
  return;
}
