import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class R1 extends StatelessWidget {
  final CollectionReference _team1 =
      FirebaseFirestore.instance.collection('UmatAkwaabaGames');

  final CollectionReference _club2 =
      FirebaseFirestore.instance.collection('UmatAkwaabaGames2');

  final CollectionReference _club3 =
      FirebaseFirestore.instance.collection('UmatAkwaabaGames3');

  final CollectionReference _club4 =
      FirebaseFirestore.instance.collection('UmatAkwaabaGames4');

  final CollectionReference _club5 =
      FirebaseFirestore.instance.collection('UmatAkwaabaGames5');

  final CollectionReference _club6 =
      FirebaseFirestore.instance.collection('UmatAkwaabaGames6');

  final CollectionReference _club7 =
      FirebaseFirestore.instance.collection('UmatAkwaabaGames7');

  final CollectionReference _club8 =
      FirebaseFirestore.instance.collection('UmatAkwaabaGames8');

  final CollectionReference _club9 =
      FirebaseFirestore.instance.collection('UmatAkwaabaGames9');

  final CollectionReference _club10 =
      FirebaseFirestore.instance.collection('UmatAkwaabaGames10');

  final CollectionReference _club11 =
      FirebaseFirestore.instance.collection('UmatAkwaabaGames11');

  final CollectionReference _club12 =
      FirebaseFirestore.instance.collection('UmatAkwaabaGames12');

  final CollectionReference _club13 =
      FirebaseFirestore.instance.collection('UmatAkwaabaGames13');

  final CollectionReference _club14 =
      FirebaseFirestore.instance.collection('UmatAkwaabaGames14');

  final CollectionReference _club15 =
      FirebaseFirestore.instance.collection('UmatAkwaabaGames15');

  final CollectionReference _club16 =
      FirebaseFirestore.instance.collection('UmatAkwaabaGames16');

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation,deviceType){
      return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      left: 15,
                      right: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FutureBuilder<QuerySnapshot>(
                          future: _team1.get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Scaffold(
                                body: Center(
                                  child: Text('Error: ${snapshot.error}'),
                                ),
                              );
                            }

                            if (snapshot.connectionState == ConnectionState.done) {
                              return Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: snapshot.data!.docs.map((document) {
                                          return Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Image.network(
                                                        '${document['images']}'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text('${document['club']}'),
                                                  ],
                                                ),
                                              ),
                                              Text('${document['time']}'),
                                              Text('${document['score']}'),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

                            return Scaffold(
                              body: Center(
                                child: Text('loading..........'),
                              ),
                            );
                          },
                        ),

                      ],
                    ),
                  ),



                  Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FutureBuilder<QuerySnapshot>(
                          future: _club2.get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Scaffold(
                                body: Center(
                                  child: Text('Error: ${snapshot.error}'),
                                ),
                              );
                            }

                            if (snapshot.connectionState == ConnectionState.done) {
                              return Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: snapshot.data!.docs.map((document) {
                                          return Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Image.network(
                                                        '${document['images']}'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text('${document['club']}'),
                                                  ],
                                                ),
                                              ),
                                              Text('${document['time']}'),


                                              Text('${document['score']}'),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

                            return Scaffold(
                              body: Center(
                                child: Text('loading..........'),
                              ),
                            );
                          },
                        ),

/*
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                            child: Column(
                              mainAxisAlignment:  MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 1'),
                                        ],
                                      ),
                                    ),
                                    Text('0'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 2'),

                                        ],
                                      ),
                                    ),


                                    Text('0'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

 */

/*
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                            child: Column(
                              mainAxisAlignment:  MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 1'),
                                        ],
                                      ),
                                    ),
                                    Text('0'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 2'),

                                        ],
                                      ),
                                    ),


                                    Text('0'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                            child: Column(
                              mainAxisAlignment:  MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 1'),
                                        ],
                                      ),
                                    ),
                                    Text('0'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 2'),

                                        ],
                                      ),
                                    ),


                                    Text('0'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                            child: Column(
                              mainAxisAlignment:  MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 1'),
                                        ],
                                      ),
                                    ),
                                    Text('0'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 2'),

                                        ],
                                      ),
                                    ),


                                    Text('0'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                            child: Column(
                              mainAxisAlignment:  MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 1'),
                                        ],
                                      ),
                                    ),
                                    Text('0'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 2'),

                                        ],
                                      ),
                                    ),


                                    Text('0'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                            child: Column(
                              mainAxisAlignment:  MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 1'),
                                        ],
                                      ),
                                    ),
                                    Text('0'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 2'),

                                        ],
                                      ),
                                    ),


                                    Text('0'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                            child: Column(
                              mainAxisAlignment:  MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 1'),
                                        ],
                                      ),
                                    ),
                                    Text('0'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 2'),

                                        ],
                                      ),
                                    ),


                                    Text('0'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                            child: Column(
                              mainAxisAlignment:  MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 1'),
                                        ],
                                      ),
                                    ),
                                    Text('0'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 2'),

                                        ],
                                      ),
                                    ),


                                    Text('0'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                            child: Column(
                              mainAxisAlignment:  MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 1'),
                                        ],
                                      ),
                                    ),
                                    Text('0'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 2'),

                                        ],
                                      ),
                                    ),


                                    Text('0'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                            child: Column(
                              mainAxisAlignment:  MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 1'),
                                        ],
                                      ),
                                    ),
                                    Text('0'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 2'),

                                        ],
                                      ),
                                    ),


                                    Text('0'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                            child: Column(
                              mainAxisAlignment:  MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 1'),
                                        ],
                                      ),
                                    ),
                                    Text('0'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 2'),

                                        ],
                                      ),
                                    ),


                                    Text('0'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                            child: Column(
                              mainAxisAlignment:  MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 1'),
                                        ],
                                      ),
                                    ),
                                    Text('0'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 2'),

                                        ],
                                      ),
                                    ),


                                    Text('0'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                            child: Column(
                              mainAxisAlignment:  MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 1'),
                                        ],
                                      ),
                                    ),
                                    Text('0'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 2'),

                                        ],
                                      ),
                                    ),


                                    Text('0'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                            child: Column(
                              mainAxisAlignment:  MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 1'),
                                        ],
                                      ),
                                    ),
                                    Text('0'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 2'),

                                        ],
                                      ),
                                    ),


                                    Text('0'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                            child: Column(
                              mainAxisAlignment:  MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 1'),
                                        ],
                                      ),
                                    ),
                                    Text('0'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      child:
                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset('assets/images/pastifylogo.jpg', height: 35,),
                                          Text('Team 2'),

                                        ],
                                      ),
                                    ),


                                    Text('0'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),


                */
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FutureBuilder<QuerySnapshot>(
                          future: _club3.get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Scaffold(
                                body: Center(
                                  child: Text('Error: ${snapshot.error}'),
                                ),
                              );
                            }

                            if (snapshot.connectionState == ConnectionState.done) {
                              return Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: snapshot.data!.docs.map((document) {
                                          return Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Image.network(
                                                        '${document['images']}'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text('${document['club']}'),
                                                  ],
                                                ),
                                              ),
                                              Text('${document['time']}'),
                                              Text('${document['score']}'),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

                            return Scaffold(
                              body: Center(
                                child: Text('loading..........'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FutureBuilder<QuerySnapshot>(
                          future: _club4.get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Scaffold(
                                body: Center(
                                  child: Text('Error: ${snapshot.error}'),
                                ),
                              );
                            }

                            if (snapshot.connectionState == ConnectionState.done) {
                              return Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: snapshot.data!.docs.map((document) {
                                          return Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Image.network(
                                                        '${document['images']}'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text('${document['club']}'),
                                                  ],
                                                ),
                                              ),
                                              Text('${document['time']}'),
                                              Text('${document['score']}'),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

                            return Scaffold(
                              body: Center(
                                child: Text('loading..........'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FutureBuilder<QuerySnapshot>(
                          future: _club5.get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Scaffold(
                                body: Center(
                                  child: Text('Error: ${snapshot.error}'),
                                ),
                              );
                            }

                            if (snapshot.connectionState == ConnectionState.done) {
                              return Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: snapshot.data!.docs.map((document) {
                                          return Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Image.network(
                                                        '${document['images']}'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text('${document['club']}'),
                                                  ],
                                                ),
                                              ),
                                              Text('${document['time']}'),
                                              Text('${document['score']}'),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

                            return Scaffold(
                              body: Center(
                                child: Text('loading..........'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FutureBuilder<QuerySnapshot>(
                          future: _club6.get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Scaffold(
                                body: Center(
                                  child: Text('Error: ${snapshot.error}'),
                                ),
                              );
                            }

                            if (snapshot.connectionState == ConnectionState.done) {
                              return Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: snapshot.data!.docs.map((document) {
                                          return Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Image.network(
                                                        '${document['images']}'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text('${document['club']}'),
                                                  ],
                                                ),
                                              ),
                                              Text('${document['time']}'),
                                              Text('${document['score']}'),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

                            return Scaffold(
                              body: Center(
                                child: Text('loading..........'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FutureBuilder<QuerySnapshot>(
                          future: _club7.get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Scaffold(
                                body: Center(
                                  child: Text('Error: ${snapshot.error}'),
                                ),
                              );
                            }

                            if (snapshot.connectionState == ConnectionState.done) {
                              return Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: snapshot.data!.docs.map((document) {
                                          return Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Image.network(
                                                        '${document['images']}'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text('${document['club']}'),
                                                  ],
                                                ),
                                              ),
                                              Text('${document['time']}'),
                                              Text('${document['score']}'),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

                            return Scaffold(
                              body: Center(
                                child: Text('loading..........'),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FutureBuilder<QuerySnapshot>(
                          future: _club8.get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Scaffold(
                                body: Center(
                                  child: Text('Error: ${snapshot.error}'),
                                ),
                              );
                            }

                            if (snapshot.connectionState == ConnectionState.done) {
                              return Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: snapshot.data!.docs.map((document) {
                                          return Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Image.network(
                                                        '${document['images']}'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text('${document['club']}'),
                                                  ],
                                                ),
                                              ),
                                              Text('${document['time']}'),
                                              Text('${document['score']}'),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

                            return Scaffold(
                              body: Center(
                                child: Text('loading..........'),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FutureBuilder<QuerySnapshot>(
                          future: _club9.get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Scaffold(
                                body: Center(
                                  child: Text('Error: ${snapshot.error}'),
                                ),
                              );
                            }

                            if (snapshot.connectionState == ConnectionState.done) {
                              return Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: snapshot.data!.docs.map((document) {
                                          return Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Image.network(
                                                        '${document['images']}'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text('${document['club']}'),
                                                  ],
                                                ),
                                              ),
                                              Text('${document['time']}'),
                                              Text('${document['score']}'),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

                            return Scaffold(
                              body: Center(
                                child: Text('loading..........'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FutureBuilder<QuerySnapshot>(
                          future: _club10.get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Scaffold(
                                body: Center(
                                  child: Text('Error: ${snapshot.error}'),
                                ),
                              );
                            }

                            if (snapshot.connectionState == ConnectionState.done) {
                              return Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: snapshot.data!.docs.map((document) {
                                          return Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Image.network(
                                                        '${document['images']}'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text('${document['club']}'),
                                                  ],
                                                ),
                                              ),
                                              Text('${document['time']}'),
                                              Text('${document['score']}'),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

                            return Scaffold(
                              body: Center(
                                child: Text('loading..........'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FutureBuilder<QuerySnapshot>(
                          future: _club11.get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Scaffold(
                                body: Center(
                                  child: Text('Error: ${snapshot.error}'),
                                ),
                              );
                            }

                            if (snapshot.connectionState == ConnectionState.done) {
                              return Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: snapshot.data!.docs.map((document) {
                                          return Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Image.network(
                                                        '${document['images']}'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text('${document['club']}'),
                                                  ],
                                                ),
                                              ),
                                              Text('${document['time']}'),
                                              Text('${document['score']}'),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

                            return Scaffold(
                              body: Center(
                                child: Text('loading..........'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FutureBuilder<QuerySnapshot>(
                          future: _club12.get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Scaffold(
                                body: Center(
                                  child: Text('Error: ${snapshot.error}'),
                                ),
                              );
                            }

                            if (snapshot.connectionState == ConnectionState.done) {
                              return Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: snapshot.data!.docs.map((document) {
                                          return Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Image.network(
                                                        '${document['images']}'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text('${document['club']}'),
                                                  ],
                                                ),
                                              ),
                                              Text('${document['time']}'),
                                              Text('${document['score']}'),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

                            return Scaffold(
                              body: Center(
                                child: Text('loading..........'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FutureBuilder<QuerySnapshot>(
                          future: _club13.get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Scaffold(
                                body: Center(
                                  child: Text('Error: ${snapshot.error}'),
                                ),
                              );
                            }

                            if (snapshot.connectionState == ConnectionState.done) {
                              return Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: snapshot.data!.docs.map((document) {
                                          return Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Image.network(
                                                        '${document['images']}'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text('${document['club']}'),
                                                  ],
                                                ),
                                              ),
                                              Text('${document['time']}'),
                                              Text('${document['score']}'),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

                            return Scaffold(
                              body: Center(
                                child: Text('loading..........'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FutureBuilder<QuerySnapshot>(
                          future: _club14.get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Scaffold(
                                body: Center(
                                  child: Text('Error: ${snapshot.error}'),
                                ),
                              );
                            }

                            if (snapshot.connectionState == ConnectionState.done) {
                              return Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: snapshot.data!.docs.map((document) {
                                          return Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Image.network(
                                                        '${document['images']}'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text('${document['club']}'),
                                                  ],
                                                ),
                                              ),
                                              Text('${document['time']}'),
                                              Text('${document['score']}'),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

                            return Scaffold(
                              body: Center(
                                child: Text('loading..........'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FutureBuilder<QuerySnapshot>(
                          future: _club15.get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Scaffold(
                                body: Center(
                                  child: Text('Error: ${snapshot.error}'),
                                ),
                              );
                            }

                            if (snapshot.connectionState == ConnectionState.done) {
                              return Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: snapshot.data!.docs.map((document) {
                                          return Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Image.network(
                                                        '${document['images']}'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text('${document['club']}'),
                                                  ],
                                                ),
                                              ),
                                              Text('${document['time']}'),
                                              Text('${document['score']}'),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

                            return Scaffold(
                              body: Center(
                                child: Text('loading..........'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FutureBuilder<QuerySnapshot>(
                          future: _club16.get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Scaffold(
                                body: Center(
                                  child: Text('Error: ${snapshot.error}'),
                                ),
                              );
                            }

                            if (snapshot.connectionState == ConnectionState.done) {
                              return Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15, bottom: 30),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: snapshot.data!.docs.map((document) {
                                          return Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Image.network(
                                                        '${document['images']}'),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text('${document['club']}'),
                                                  ],
                                                ),
                                              ),
                                              Text('${document['time']}'),
                                              Text('${document['score']}'),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }

                            return Scaffold(
                              body: Center(
                                child: Text('loading..........'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}

class R2 extends StatelessWidget {
  final CollectionReference _clubb1 =
      FirebaseFirestore.instance.collection('UmatAkwaabaB1');

  final CollectionReference _clubb2 =
      FirebaseFirestore.instance.collection('UmatAkwaabaB2');

  final CollectionReference _clubb3 =
      FirebaseFirestore.instance.collection('UmatAkwaabaB3');

  final CollectionReference _clubb4 =
      FirebaseFirestore.instance.collection('UmatAkwaabaB4');

  final CollectionReference _clubb5 =
      FirebaseFirestore.instance.collection('UmatAkwaabaB5');

  final CollectionReference _clubb6 =
      FirebaseFirestore.instance.collection('UmatAkwaabaB6');

  final CollectionReference _clubb7 =
      FirebaseFirestore.instance.collection('UmatAkwaabaB7');

  final CollectionReference _clubb8 =
      FirebaseFirestore.instance.collection('UmatAkwaabaB8');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
                left: 15,
                right: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder<QuerySnapshot>(
                    future: _clubb1.get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Scaffold(
                          body: Center(
                            child: Text('Error: ${snapshot.error}'),
                          ),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: snapshot.data!.docs.map((document) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 30,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.network(
                                                  '${document['images']}'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('${document['club']}'),
                                            ],
                                          ),
                                        ),
                                        Text('${document['time']}'),
                                        Text('${document['score']}'),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return Scaffold(
                        body: Center(
                          child: Text('loading..........'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 3.0, left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder<QuerySnapshot>(
                    future: _clubb2.get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Scaffold(
                          body: Center(
                            child: Text('Error: ${snapshot.error}'),
                          ),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: snapshot.data!.docs.map((document) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 30,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.network(
                                                  '${document['images']}'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('${document['club']}'),
                                            ],
                                          ),
                                        ),
                                        Text('${document['time']}'),
                                        Text('${document['score']}'),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return Scaffold(
                        body: Center(
                          child: Text('loading..........'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder<QuerySnapshot>(
                    future: _clubb3.get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Scaffold(
                          body: Center(
                            child: Text('Error: ${snapshot.error}'),
                          ),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: snapshot.data!.docs.map((document) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 30,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.network(
                                                  '${document['images']}'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('${document['club']}'),
                                            ],
                                          ),
                                        ),
                                        Text('${document['time']}'),
                                        Text('${document['score']}'),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return Scaffold(
                        body: Center(
                          child: Text('loading..........'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(top: 3.0, left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder<QuerySnapshot>(
                    future: _clubb4.get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Scaffold(
                          body: Center(
                            child: Text('Error: ${snapshot.error}'),
                          ),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: snapshot.data!.docs.map((document) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 30,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.network(
                                                  '${document['images']}'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('${document['club']}'),
                                            ],
                                          ),
                                        ),
                                        Text('${document['time']}'),
                                        Text('${document['score']}'),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return Scaffold(
                        body: Center(
                          child: Text('loading..........'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder<QuerySnapshot>(
                    future: _clubb5.get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Scaffold(
                          body: Center(
                            child: Text('Error: ${snapshot.error}'),
                          ),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: snapshot.data!.docs.map((document) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 30,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.network(
                                                  '${document['images']}'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('${document['club']}'),
                                            ],
                                          ),
                                        ),
                                        Text('${document['time']}'),
                                        Text('${document['score']}'),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return Scaffold(
                        body: Center(
                          child: Text('loading..........'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(top: 3.0, left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder<QuerySnapshot>(
                    future: _clubb6.get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Scaffold(
                          body: Center(
                            child: Text('Error: ${snapshot.error}'),
                          ),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: snapshot.data!.docs.map((document) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 30,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.network(
                                                  '${document['images']}'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('${document['club']}'),
                                            ],
                                          ),
                                        ),
                                        Text('${document['time']}'),
                                        Text('${document['score']}'),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return Scaffold(
                        body: Center(
                          child: Text('loading..........'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder<QuerySnapshot>(
                    future: _clubb7.get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Scaffold(
                          body: Center(
                            child: Text('Error: ${snapshot.error}'),
                          ),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: snapshot.data!.docs.map((document) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 30,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.network(
                                                  '${document['images']}'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('${document['club']}'),
                                            ],
                                          ),
                                        ),
                                        Text('${document['time']}'),
                                        Text('${document['score']}'),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return Scaffold(
                        body: Center(
                          child: Text('loading..........'),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0, left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder<QuerySnapshot>(
                    future: _clubb8.get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Scaffold(
                          body: Center(
                            child: Text('Error: ${snapshot.error}'),
                          ),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: snapshot.data!.docs.map((document) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 30,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.network(
                                                  '${document['images']}'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('${document['club']}'),
                                            ],
                                          ),
                                        ),
                                        Text('${document['time']}'),
                                        Text('${document['score']}'),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return Scaffold(
                        body: Center(
                          child: Text('loading..........'),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class R3 extends StatelessWidget {
  final CollectionReference _clubc1 =
      FirebaseFirestore.instance.collection('UmatAkwaabaC1');

  final CollectionReference _clubc2 =
      FirebaseFirestore.instance.collection('UmatAkwaabaC2');

  final CollectionReference _clubc3 =
      FirebaseFirestore.instance.collection('UmatAkwaabaC3');

  final CollectionReference _clubc4 =
      FirebaseFirestore.instance.collection('UmatAkwaabaC4');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
                left: 15,
                right: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder<QuerySnapshot>(
                    future: _clubc1.get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Scaffold(
                          body: Center(
                            child: Text('Error: ${snapshot.error}'),
                          ),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: snapshot.data!.docs.map((document) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 30,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.network(
                                                  '${document['images']}'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('${document['club']}'),
                                            ],
                                          ),
                                        ),
                                        Text('${document['time']}'),
                                        Text('${document['score']}'),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return Scaffold(
                        body: Center(
                          child: Text('loading..........'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 3.0, left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder<QuerySnapshot>(
                    future: _clubc2.get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Scaffold(
                          body: Center(
                            child: Text('Error: ${snapshot.error}'),
                          ),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: snapshot.data!.docs.map((document) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 30,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.network(
                                                  '${document['images']}'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('${document['club']}'),
                                            ],
                                          ),
                                        ),
                                        Text('${document['time']}'),
                                        Text('${document['score']}'),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return Scaffold(
                        body: Center(
                          child: Text('loading..........'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder<QuerySnapshot>(
                    future: _clubc3.get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Scaffold(
                          body: Center(
                            child: Text('Error: ${snapshot.error}'),
                          ),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: snapshot.data!.docs.map((document) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 30,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.network(
                                                  '${document['images']}'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('${document['club']}'),
                                            ],
                                          ),
                                        ),
                                        Text('${document['time']}'),
                                        Text('${document['score']}'),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return Scaffold(
                        body: Center(
                          child: Text('loading..........'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 3.0, left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder<QuerySnapshot>(
                    future: _clubc4.get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Scaffold(
                          body: Center(
                            child: Text('Error: ${snapshot.error}'),
                          ),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: snapshot.data!.docs.map((document) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 30,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.network(
                                                  '${document['images']}'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('${document['club']}'),
                                            ],
                                          ),
                                        ),
                                        Text('${document['time']}'),
                                        Text('${document['score']}'),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return Scaffold(
                        body: Center(
                          child: Text('loading..........'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class SemiFinalsAkwaaba extends StatelessWidget {
  final CollectionReference _clubdd1 =
      FirebaseFirestore.instance.collection('UmatAkwaabaDD1');

  final CollectionReference _clubdd2 =
      FirebaseFirestore.instance.collection('UmatAkwaabaDD2');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
                left: 15,
                right: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder<QuerySnapshot>(
                    future: _clubdd1.get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Scaffold(
                          body: Center(
                            child: Text('Error: ${snapshot.error}'),
                          ),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: snapshot.data!.docs.map((document) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 30,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.network(
                                                  '${document['images']}'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('${document['club']}'),
                                            ],
                                          ),
                                        ),
                                        Text('${document['time']}'),
                                        Text('${document['score']}'),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return Scaffold(
                        body: Center(
                          child: Text('loading..........'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0, left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder<QuerySnapshot>(
                    future: _clubdd2.get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Scaffold(
                          body: Center(
                            child: Text('Error: ${snapshot.error}'),
                          ),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: snapshot.data!.docs.map((document) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 30,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.network(
                                                  '${document['images']}'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('${document['club']}'),
                                            ],
                                          ),
                                        ),
                                        Text('${document['time']}'),
                                        Text('${document['score']}'),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return Scaffold(
                        body: Center(
                          child: Text('loading..........'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class FinalsAkwaaba extends StatelessWidget {
  final CollectionReference _finalsakwaaba =
      FirebaseFirestore.instance.collection('akwaabaseason1finals');

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return Scaffold(

        body: Container(
          height: 100.h,
          width: 100.w,
          child: FutureBuilder<QuerySnapshot>(
              future: _finalsakwaaba.get(),
              builder: (context, snapshot){
                if(snapshot.hasError){
                  return Text('${snapshot.error}');
                }

                if(snapshot.connectionState == ConnectionState.done){
                  return Column(
                    children: snapshot.data!.docs.map((document){
                      return Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.sports_soccer),
                                  Text('Pastify Akwaaba (Season One)')
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top:8.0),
                              child: Row(
                                children: [
                                  Text('${document['team1']} - ${document['team2']}')
                                ],
                              ),
                            ),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 20.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(

                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network('${document['images']}', fit: BoxFit.fill,),
                                ),

                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('${document['waiting']}', style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ))

                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Text('${document['time']}')

                                      ],
                                    ),
                                  ],
                                ),

                                Container(
                                  height:20.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(

                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network('${document['images2']}', fit: BoxFit.fill,),
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 10.h,
                                    width:30.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey,
                                    ),
                                    child: Center(child: Text('H2.40')),
                                  ),


                                  Container(
                                    height:10.h,
                                    width:30.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey,
                                    ),
                                    child: Center(child: Text('x4.90')),
                                  ),

                                  Container(
                                    height:10.h,
                                    width:30.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey,
                                    ),
                                    child: Center(child: Text('A2.40')),
                                  )


                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(
                                  children:[
                                    Row(
                                        children:[
                                          Text('Venue'),
                                        ]
                                    ),

                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:[
                                          Text('Name:'),
                                          Text('${document['venuename']}')
                                        ]
                                    ),

                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:[
                                          Text('Location:'),
                                          Text('${document['venuelocation']}')
                                        ]
                                    ),


                                  ]
                              ),
                            )

                          ],
                        ),
                      );

                    }).toList(),
                  );
                }

                return Center(child: CircularProgressIndicator());
              }
          ),
        ),
      );
    });
  }
}
