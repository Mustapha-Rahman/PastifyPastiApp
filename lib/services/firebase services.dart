import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {


   FirebaseAuth _firebaseAuth =FirebaseAuth.instance;
   FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

   String getUserId(){
     return  _firebaseAuth.currentUser!.uid;
   }

   final CollectionReference<Map<String, dynamic>> productsRef =
   FirebaseFirestore.instance.collection('Product');

   final CollectionReference<Map<String, dynamic>> usersRef =
   FirebaseFirestore.instance
       .collection('Users');


}