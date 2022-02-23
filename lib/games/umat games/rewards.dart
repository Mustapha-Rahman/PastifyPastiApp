import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'awardsdetails.dart';




class UmatReward extends StatelessWidget {

  final CollectionReference _umatreward =
  FirebaseFirestore.instance.collection('umatRewards');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: FutureBuilder<QuerySnapshot>(
            future: _umatreward.get(),
              builder: (context, snapshot){
                if(snapshot.hasError){
                  return Text('${snapshot.error}');
                }
                if(snapshot.connectionState== ConnectionState.done){
                  return Column(
                    children: snapshot.data!.docs.map((document)
                    {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=> AwardsDetails(id: document.id,)));
                          },
                          child: Container(
                            height: 90,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(13)
                            ),
                            child: Center(child: Text('${document['name']}')),

                          ),
                        ),
                      );
                    }).toList(),
                  );
                }


                return Center(child: CircularProgressIndicator());
              }

          ),
        ),
      ),
    );
  }
}