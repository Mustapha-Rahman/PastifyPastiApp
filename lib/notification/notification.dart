import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotificationPastify extends StatelessWidget {

  final CollectionReference _notification =
  FirebaseFirestore.instance.collection('NotificationPastify');


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Stack(
          children: [


            FutureBuilder<QuerySnapshot>(
                future: _notification.get(),
                builder: (context,  snapshot){

                  if(snapshot.hasError){
                    return Scaffold(
                      body: Center(child: Text('Error: ${snapshot.error}'),),
                    );
                  }


                  if(snapshot.connectionState == ConnectionState.done){
                    return Scaffold(
                      backgroundColor: Colors.grey,

                      appBar: AppBar(

                        title: Center(child: Text('Notification',)),
                      ),
                      body: ListView(

                        children: snapshot.data!.docs.map((document){
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0, left: 20, right: 15),
                                child: Container(
                                  height: 70,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '${document['notification']}.', style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black
                                    ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),

                      ),

                    );




                  }


                  return Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  );


                }
            ),










          ],
        ),

      ),
    );
  }
}
