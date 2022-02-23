import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../constant.dart';
import '../screens/cart page.dart';
import '../services/firebase services.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasBackArrow;
  final bool hasTitle;
  final bool hasBackground;
   CustomActionBar({
     required this.title,
     required this.hasBackArrow,
     required this.hasTitle,
     required this.hasBackground});

  FirebaseServices _firebaseServices = FirebaseServices();

  final CollectionReference _usersRef = FirebaseFirestore
      .instance
      .collection('Users');

  @override
  Widget build(BuildContext context){

  bool _hasBackArrow = hasBackArrow;
  bool _hasTitle = hasTitle;
  bool _hasBackground = hasBackground;

  return Container(
      decoration: BoxDecoration(
        gradient:  _hasBackground ?LinearGradient(
          colors: [
            Colors.white,
            Colors.white.withOpacity(0),
          ],
          begin: Alignment(0,0),
          end: Alignment(0,1),
        ) : null
      ),
      padding: EdgeInsets.only(
        top: 56,
        left: 24,
        right: 24,
        bottom: 42,
      ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            if(_hasBackArrow)
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  width: 42.0,
                  height: 42.0,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: Image(
                    image: AssetImage('assets/images/back arrow.png'),
                    width: 16,
                    height: 16,
                  ),
                ),
              ),

            if(_hasTitle)
            Text(
              title, style: Constants.boldHeading,),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>CartPage(),
                ));
              },
              child: Container(
                width: 42.0,
                height: 42.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0)
                ),
                alignment: Alignment.center,

                child: StreamBuilder<QuerySnapshot>(
                  stream: _usersRef.doc(_firebaseServices.getUserId()).collection('Cart').snapshots(),
                  builder: (context, snapshot) {

                    int  _totalItems = 0;
                    if(snapshot.connectionState == ConnectionState.active){
                      List _documents = snapshot.data!.docs;
                      _totalItems = _documents.length;



                    }

                    return Text(
                      '$_totalItems',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    );


                  },
                )
              ),
            )
          ],
        ),
      );
  }
}
