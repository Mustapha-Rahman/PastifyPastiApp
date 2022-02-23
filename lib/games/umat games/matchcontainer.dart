
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class R1Container extends StatefulWidget {
  final String r1Id;
  R1Container({ required this.r1Id});

  @override
  _R1ContainerState createState() => _R1ContainerState();
}
class _R1ContainerState extends State<R1Container> {
  final CollectionReference _matches =
  FirebaseFirestore.instance.collection('matchesR1');

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return FutureBuilder(
        future: _matches.doc(widget.r1Id).get(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
          if(snapshot.hasError){
            return Text('${snapshot.error}');
          }

          if(snapshot.connectionState == ConnectionState.done){
            DocumentSnapshot<Object?> documentData = snapshot.data!;
            return Stack(
              children: [
                Container(
                  height: 300,
                  width: 100.w,
                  color: Colors.lightBlueAccent,
                ),

                Positioned(
                  top: 20,
                  left: 20,
                  bottom: 20,
                  right: 20,
                  child: Container(
                    height: 250,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('${documentData['location']}'),

                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                              child: Text('Match Day 1'),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage('${documentData['image1']}'),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                    Text('${documentData['team1']}')
                                  ],
                                ),

                                Column(
                                  children: [
                                    Text('${documentData['waiting']}'),
                                    Text('(${documentData['score1']} - ${documentData['score2']})')
                                  ],
                                ),

                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage('${documentData['image2']}'),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                    Text('${documentData['team2']}')
                                  ],
                                ),
                              ],
                            ),

                            Text('Round 1')
                          ],
                        )

                      ],
                    ),
                  ),
                )
              ],
            );
          }


          return Container(child: Center(child: CircularProgressIndicator()));
        },
      );
    });
  }
}


class R2Container extends StatefulWidget {
  final String r2Id;
  R2Container({ required this.r2Id});

  @override
  _R2ContainerState createState() => _R2ContainerState();
}
class _R2ContainerState extends State<R2Container> {
  final CollectionReference _matchesr2 =
  FirebaseFirestore.instance.collection('matchesR2');

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return FutureBuilder(
        future: _matchesr2.doc(widget.r2Id).get(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
          if(snapshot.hasError){
            return Text('${snapshot.error}');
          }

          if(snapshot.connectionState == ConnectionState.done){
            DocumentSnapshot<Object?> documentData = snapshot.data!;
            return Stack(
              children: [
                Container(
                  height: 300,
                  width: 100.w,
                  color: Colors.lightBlueAccent,
                ),

                Positioned(
                  top: 20,
                  left: 20,
                  bottom: 20,
                  right: 20,
                  child: Container(
                    height: 250,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('${documentData['location']}'),

                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                              child: Text('Match Day 2'),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage('${documentData['image1']}'),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                    Text('${documentData['team1']}')
                                  ],
                                ),

                                Column(
                                  children: [
                                    Text('${documentData['waiting']}'),
                                    Text('(${documentData['score1']} - ${documentData['score2']})')
                                  ],
                                ),

                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage('${documentData['image2']}'),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                    Text('${documentData['team2']}')
                                  ],
                                ),
                              ],
                            ),

                            Text('Round 2')
                          ],
                        )

                      ],
                    ),
                  ),
                )
              ],
            );
          }


          return Container(child: Center(child: CircularProgressIndicator()));
        },
      );
    });
  }
}

class R3Container extends StatefulWidget {
  final String r3Id;
  R3Container({ required this.r3Id});

  @override
  _R3ContainerState createState() => _R3ContainerState();
}
class _R3ContainerState extends State<R3Container> {
  final CollectionReference _matchesr3 =
  FirebaseFirestore.instance.collection('matchesR3');
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return FutureBuilder(
        future: _matchesr3.doc(widget.r3Id).get(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
          if(snapshot.hasError){
            return Text('${snapshot.error}');
          }

          if(snapshot.connectionState == ConnectionState.done){
            DocumentSnapshot<Object?> documentData = snapshot.data!;
            return Stack(
              children: [
                Container(
                  height: 300,
                  width: 100.w,
                  color: Colors.lightBlueAccent,
                ),

                Positioned(
                  top: 20,
                  left: 20,
                  bottom: 20,
                  right: 20,
                  child: Container(
                    height: 250,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('${documentData['location']}'),

                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                              child: Text('Match Day 3'),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage('${documentData['image1']}'),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                    Text('${documentData['team1']}')
                                  ],
                                ),

                                Column(
                                  children: [
                                    Text('${documentData['waiting']}'),
                                    Text('(${documentData['score1']} - ${documentData['score2']})')
                                  ],
                                ),

                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage('${documentData['image2']}'),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                    Text('${documentData['team2']}')
                                  ],
                                ),
                              ],
                            ),

                            Text('Round 3')
                          ],
                        )

                      ],
                    ),
                  ),
                )
              ],
            );
          }


          return Container(child: Center(child: CircularProgressIndicator()));
        },
      );
    });
  }
}



class R4Container extends StatefulWidget {
  final String r4Id;
  R4Container({ required this.r4Id});

  @override
  _R4ContainerState createState() => _R4ContainerState();
}
class _R4ContainerState extends State<R4Container> {
  final CollectionReference _matchesr4 =
  FirebaseFirestore.instance.collection('matchesR4');

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return FutureBuilder(
        future: _matchesr4.doc(widget.r4Id).get(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
          if(snapshot.hasError){
            return Text('${snapshot.error}');
          }

          if(snapshot.connectionState == ConnectionState.done){
            DocumentSnapshot<Object?> documentData = snapshot.data!;
            return Stack(
              children: [
                Container(
                  height: 300,
                  width: 100.w,
                  color: Colors.lightBlueAccent,
                ),

                Positioned(
                  top: 20,
                  left: 20,
                  bottom: 20,
                  right: 20,
                  child: Container(
                    height: 250,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('${documentData['location']}'),

                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                              child: Text('Match Day 4'),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage('${documentData['image1']}'),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                    Text('${documentData['team1']}')
                                  ],
                                ),

                                Column(
                                  children: [
                                    Text('${documentData['waiting']}'),
                                    Text('(${documentData['score1']} - ${documentData['score2']})')
                                  ],
                                ),

                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage('${documentData['image2']}'),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                    Text('${documentData['team2']}')
                                  ],
                                ),
                              ],
                            ),

                            Text('Round 4')
                          ],
                        )

                      ],
                    ),
                  ),
                )
              ],
            );
          }


          return Container(child: Center(child: CircularProgressIndicator()));
        },
      );
    });
  }
}

class R5Container extends StatefulWidget {
  final String r5Id;
  R5Container({ required this.r5Id});

  @override
  _R5ContainerState createState() => _R5ContainerState();
}
class _R5ContainerState extends State<R5Container> {
  final CollectionReference _matchesr5 =
  FirebaseFirestore.instance.collection('matchesR5');

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return FutureBuilder(
        future: _matchesr5.doc(widget.r5Id).get(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
          if(snapshot.hasError){
            return Text('${snapshot.error}');
          }

          if(snapshot.connectionState == ConnectionState.done){
            DocumentSnapshot<Object?> documentData = snapshot.data!;
            return Stack(
              children: [
                Container(
                  height: 300,
                  width: 100.w,
                  color: Colors.lightBlueAccent,
                ),

                Positioned(
                  top: 20,
                  left: 20,
                  bottom: 20,
                  right: 20,
                  child: Container(
                    height: 250,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('${documentData['location']}'),

                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                              child: Text('Match Day 5'),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage('${documentData['image1']}'),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                    Text('${documentData['team1']}')
                                  ],
                                ),

                                Column(
                                  children: [
                                    Text('${documentData['waiting']}'),
                                    Text('(${documentData['score1']} - ${documentData['score2']})')
                                  ],
                                ),

                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage('${documentData['image2']}'),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                    Text('${documentData['team2']}')
                                  ],
                                ),
                              ],
                            ),

                            Text('Round 5')
                          ],
                        )

                      ],
                    ),
                  ),
                )
              ],
            );
          }


          return Container(child: Center(child: CircularProgressIndicator()));
        },
      );
    });
  }
}

class R6Container extends StatefulWidget {
  final String r6Id;
  R6Container({ required this.r6Id});

  @override
  _R6ContainerState createState() => _R6ContainerState();
}
class _R6ContainerState extends State<R6Container> {

  final CollectionReference _matchesr6 =
  FirebaseFirestore.instance.collection('matchesR6');

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return FutureBuilder(
        future: _matchesr6.doc(widget.r6Id).get(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
          if(snapshot.hasError){
            return Text('${snapshot.error}');
          }

          if(snapshot.connectionState == ConnectionState.done){
            DocumentSnapshot<Object?> documentData = snapshot.data!;
            return Stack(
              children: [
                Container(
                  height: 300,
                  width: 100.w,
                  color: Colors.lightBlueAccent,
                ),

                Positioned(
                  top: 20,
                  left: 20,
                  bottom: 20,
                  right: 20,
                  child: Container(
                    height: 250,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('${documentData['location']}'),

                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                              child: Text('Match Day 6'),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage('${documentData['image1']}'),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                    Text('${documentData['team1']}')
                                  ],
                                ),

                                Column(
                                  children: [
                                    Text('${documentData['waiting']}'),
                                    Text('(${documentData['score1']} - ${documentData['score2']})')
                                  ],
                                ),

                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage('${documentData['image2']}'),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                    Text('${documentData['team1']}')
                                  ],
                                ),
                              ],
                            ),

                            Text('Round 6')
                          ],
                        )

                      ],
                    ),
                  ),
                )
              ],
            );
          }


          return Container(child: Center(child: CircularProgressIndicator()));
        },
      );
    });
  }
}




class RoundOf8Container extends StatefulWidget {
  final String round8Id;
  RoundOf8Container({ required this.round8Id});

  @override
  _RoundOf8ContainerState createState() => _RoundOf8ContainerState();
}

class _RoundOf8ContainerState extends State<RoundOf8Container> {
  final CollectionReference _matchesR8 =
  FirebaseFirestore.instance.collection('matches1of8');

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return FutureBuilder(
        future: _matchesR8.doc(widget.round8Id).get(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
          if(snapshot.hasError){
            return Text('${snapshot.error}');
          }

          if(snapshot.connectionState == ConnectionState.done){
            DocumentSnapshot<Object?> documentData = snapshot.data!;
            return Stack(
              children: [
                Container(
                  height: 300,
                  width: 100.w,
                  color: Colors.lightBlueAccent,
                ),

                Positioned(
                  top: 20,
                  left: 20,
                  bottom: 20,
                  right: 20,
                  child: Container(
                    height: 250,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('${documentData['location']}'),

                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                              child: Text('Match Day 7'),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage('${documentData['image1']}'),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                    Text('${documentData['team1']}')
                                  ],
                                ),

                                Column(
                                  children: [
                                    Text('${documentData['waiting']}'),
                                    Text('(${documentData['score1']} - ${documentData['score2']})')
                                  ],
                                ),

                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage('${documentData['image2']}'),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                    Text('${documentData['team2']}')
                                  ],
                                ),
                              ],
                            ),

                            Text('Round Of 8')
                          ],
                        )

                      ],
                    ),
                  ),
                )
              ],
            );
          }


          return Container(child: Center(child: CircularProgressIndicator()));
        },
      );
    });
  }
}

class QuaterFinalsContainer extends StatefulWidget {
  final String quaterfinalsId;
  QuaterFinalsContainer({ required this.quaterfinalsId});

  @override
  _QuaterFinalsState createState() => _QuaterFinalsState();
}

class _QuaterFinalsState extends State<QuaterFinalsContainer> {
  final CollectionReference _quaterfinals =
  FirebaseFirestore.instance.collection('quaterFinals');
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return FutureBuilder(
        future: _quaterfinals.doc(widget.quaterfinalsId).get(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
          if(snapshot.hasError){
            return Text('${snapshot.error}');
          }

          if(snapshot.connectionState == ConnectionState.done){
            DocumentSnapshot<Object?> documentData = snapshot.data!;
            return Stack(
              children: [
                Container(
                  height: 300,
                  width: 100.w,
                  color: Colors.lightBlueAccent,
                ),

                Positioned(
                  top: 20,
                  left: 20,
                  bottom: 20,
                  right: 20,
                  child: Container(
                    height: 250,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('${documentData['location']}'),

                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                              child: Text('Match Day 8'),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage('${documentData['image1']}'),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                    Text('${documentData['team1']}')
                                  ],
                                ),

                                Column(
                                  children: [
                                    Text('${documentData['waiting']}'),
                                    Text('(${documentData['score1']} - ${documentData['score2']})')
                                  ],
                                ),

                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage('${documentData['image2']}'),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                    Text('${documentData['team2']}')
                                  ],
                                ),
                              ],
                            ),

                            Text('Quater Finals')
                          ],
                        )

                      ],
                    ),
                  ),
                )
              ],
            );
          }


          return Container(child: Center(child: CircularProgressIndicator()));
        },
      );
    });
  }
}



class SemiFinalsContainer extends StatefulWidget {
  final String semifinalsId;
  SemiFinalsContainer({ required this.semifinalsId});

  @override
  _SemiFinalsContainerState createState() => _SemiFinalsContainerState();
}

class _SemiFinalsContainerState extends State<SemiFinalsContainer> {
  final CollectionReference _semifinals =
  FirebaseFirestore.instance.collection('semiFinals');

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return FutureBuilder(
        future: _semifinals.doc(widget.semifinalsId).get(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
          if(snapshot.hasError){
            return Text('${snapshot.error}');
          }

          if(snapshot.connectionState == ConnectionState.done){
            DocumentSnapshot<Object?> documentData = snapshot.data!;
            return Stack(
              children: [
                Container(
                  height: 300,
                  width: 100.w,
                  color: Colors.lightBlueAccent,
                ),

                Positioned(
                  top: 20,
                  left: 20,
                  bottom: 20,
                  right: 20,
                  child: Container(
                    height: 250,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('${documentData['location']}'),

                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                              child: Text('Match Day 9'),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage('${documentData['image1']}'),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                    Text('${documentData['team1']}')
                                  ],
                                ),

                                Column(
                                  children: [
                                    Text('${documentData['waiting']}'),
                                    Text('(${documentData['score1']} - ${documentData['score2']})')
                                  ],
                                ),

                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage('${documentData['image2']}'),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                    Text('${documentData['team2']}')
                                  ],
                                ),
                              ],
                            ),

                            Text('Semi Finals')
                          ],
                        )

                      ],
                    ),
                  ),
                )
              ],
            );
          }


          return Container(child: Center(child: CircularProgressIndicator()));
        },
      );
    });
  }
}







