import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UmatStandings extends StatefulWidget {


  @override
  State<UmatStandings> createState() => _UmatMatchesState();
}

class _UmatMatchesState extends State<UmatStandings> {
  final CollectionReference _matches =
  FirebaseFirestore.instance.collection('umatStandings');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(
          child: Column(
            children: [
              Text('Groups', style: TextStyle(
                  fontSize: 25
              ),),
              FutureBuilder<QuerySnapshot>(
                  future: _matches.get(),
                  builder: (context, snapshot){
                    if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }

                    if(snapshot.connectionState == ConnectionState.done){
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: snapshot.data!.docs.map((document){
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Container(
                                  height: 250,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('${document['group']}'),
                                            Container(
                                              height: 30,
                                              width: 160,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('P'),
                                                  Text('D'),
                                                  Text('L'),
                                                  Text('W'),
                                                  Text('Pts')
                                                ],
                                              ),

                                            )
                                          ],
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('${document['team']}'),
                                            Container(
                                              height: 30,
                                              width: 160,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('${document['p']}'),
                                                  Text('${document['d']}'),
                                                  Text('${document['l']}'),
                                                  Text('${document['w']}'),
                                                  Text('${document['pts']}')
                                                ],
                                              ),

                                            )
                                          ],
                                        ),


                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('${document['team2']}'),
                                            Container(
                                              height: 30,
                                              width: 160,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('${document['p2']}'),
                                                  Text('${document['d2']}'),
                                                  Text('${document['l2']}'),
                                                  Text('${document['w2']}'),
                                                  Text('${document['pts2']}')
                                                ],
                                              ),

                                            )
                                          ],
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('${document['team3']}'),
                                            Container(
                                              height: 30,
                                              width: 160,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('${document['p3']}'),
                                                  Text('${document['d3']}'),
                                                  Text('${document['l3']}'),
                                                  Text('${document['w3']}'),
                                                  Text('${document['pts3']}')
                                                ],
                                              ),

                                            )
                                          ],
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('${document['team4']}'),
                                            Container(
                                              height: 30,
                                              width: 160,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('${document['p4']}'),
                                                  Text('${document['d4']}'),
                                                  Text('${document['l4']}'),
                                                  Text('${document['w4']}'),
                                                  Text('${document['pts4']}')
                                                ],
                                              ),

                                            )
                                          ],
                                        ),




                                      ],
                                    ),
                                  ),

                                ),
                              );

                            }).toList(),
                          ),
                        ),
                      );
                    }

                    return Center(child: CircularProgressIndicator());
                  }
              ),
            ],
          ),
        )
    );
  }
}
