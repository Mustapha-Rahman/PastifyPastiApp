import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import 'matchcontainer.dart';


class MatchesDetails extends StatelessWidget {
  const MatchesDetails({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return DefaultTabController(
        length: 5,
        child: Scaffold(

          appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab( child: Text('Group Stages')),
                  Tab( child: Text('Round 16')),
                  Tab( child: Text('Q/Finals')),
                  Tab( child: Text('Semi-Finals')),
                  Tab( child: Text('Finals')),

                ],
              )
          ),
          body: const TabBarView(
              children:  [
                UmatMatches(),
                UmatRoundOf8(),
                QuaterFinals(),
                SemiFinals(),
                Finals(),

              ]),
        ),
      );

    });
  }
}



class UmatMatches extends StatefulWidget {
  const UmatMatches({Key? key}) : super(key: key);



  @override
  State<UmatMatches> createState() => _UmatMatchesState();
}
class _UmatMatchesState extends State<UmatMatches> {
  final CollectionReference _matches =
  FirebaseFirestore.instance.collection('matchesR1');

  final CollectionReference _matchesr2 =
  FirebaseFirestore.instance.collection('matchesR2');

  final CollectionReference _matchesr3 =
  FirebaseFirestore.instance.collection('matchesR3');

  final CollectionReference _matchesr4 =
  FirebaseFirestore.instance.collection('matchesR4');

  final CollectionReference _matchesr5 =
  FirebaseFirestore.instance.collection('matchesR5');

  final CollectionReference _matchesr6 =
  FirebaseFirestore.instance.collection('matchesR6');

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:SingleChildScrollView(
          child: Column(
            children: [
              const Text('Round 1', style: TextStyle(
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
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: snapshot.data!.docs.map((document){
                              return Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: GestureDetector(
                                  onTap: (){
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context)=> R1Container(r1Id: document.id));

                                  },
                                  child: Container(
                                    color: Colors.white12,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text('${document['date']}'),
                                                Text('${document['time']}'),
                                              ],
                                            ),
                                            VerticalDivider(
                                              indent: 20.0,
                                              thickness: 20.0,
                                              color: Colors.blue,
                                              width: 5.w,

                                            ),
                                            Column(
                                              children: [
                                                Text('${document['team1']}'),
                                                Text('${document['team2']}'),
                                              ],
                                            ),
                                          ],
                                        ),

                                        Column(
                                          children: [
                                            Text('${document['score1']}'),
                                            Text('${document['score2']}'),
                                          ],
                                        ),



                                      ],
                                    )
                                  ),
                                ),
                              );

                            }).toList(),
                          ),
                        ),
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  }
              ),

              const Text('Round 2', style: TextStyle(
                  fontSize: 25
              ),),
              FutureBuilder<QuerySnapshot>(
                  future: _matchesr2.get(),
                  builder: (context, snapshot){
                    if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }

                    if(snapshot.connectionState == ConnectionState.done){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: snapshot.data!.docs.map((document){
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: GestureDetector(
                                  onTap: (){
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context)=> R2Container(r2Id: document.id));


                                  },
                                  child: Container(
                                      color: Colors.white12,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Text('${document['date']}'),
                                                  Text('${document['time']}'),
                                                ],
                                              ),
                                              VerticalDivider(
                                                width: 5.w,

                                              ),
                                              Column(
                                                children: [
                                                  Text('${document['team1']}'),
                                                  Text('${document['team2']}'),
                                                ],
                                              ),
                                            ],
                                          ),

                                          Column(
                                            children: [
                                              Text('${document['score1']}'),
                                              Text('${document['score2']}'),
                                            ],
                                          ),



                                        ],
                                      )
                                  ),
                                ),
                              );

                            }).toList(),
                          ),
                        ),
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  }
              ),

              const Text('Round 3', style: TextStyle(
                  fontSize: 25
              ),),
              FutureBuilder<QuerySnapshot>(
                  future: _matchesr3.get(),
                  builder: (context, snapshot){
                    if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }

                    if(snapshot.connectionState == ConnectionState.done){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: snapshot.data!.docs.map((document){
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: GestureDetector(
                                  onTap: (){

                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context)=> R3Container(r3Id: document.id));
                                  },
                                  child: Container(
                                      color: Colors.white12,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Text('${document['date']}'),
                                                  Text('${document['time']}'),
                                                ],
                                              ),
                                              VerticalDivider(
                                                width: 5.w,

                                              ),
                                              Column(
                                                children: [
                                                  Text('${document['team1']}'),
                                                  Text('${document['team2']}'),
                                                ],
                                              ),
                                            ],
                                          ),

                                          Column(
                                            children: [
                                              Text('${document['score1']}'),
                                              Text('${document['score2']}'),
                                            ],
                                          ),



                                        ],
                                      )
                                  ),
                                ),
                              );

                            }).toList(),
                          ),
                        ),
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  }
              ),

              const Text('Round 4', style: TextStyle(
                  fontSize: 25
              ),),
              FutureBuilder<QuerySnapshot>(
                  future: _matchesr4.get(),
                  builder: (context, snapshot){
                    if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }

                    if(snapshot.connectionState == ConnectionState.done){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: snapshot.data!.docs.map((document){
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: GestureDetector(
                                  onTap: (){
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context)=> R4Container(r4Id: document.id));

                                  },
                                  child: Container(
                                      color: Colors.white12,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Text('${document['date']}'),
                                                  Text('${document['time']}'),
                                                ],
                                              ),
                                              VerticalDivider(
                                                width: 5.w,

                                              ),
                                              Column(
                                                children: [
                                                  Text('${document['team1']}'),
                                                  Text('${document['team2']}'),
                                                ],
                                              ),
                                            ],
                                          ),

                                          Column(
                                            children: [
                                              Text('${document['score1']}'),
                                              Text('${document['score2']}'),
                                            ],
                                          ),



                                        ],
                                      )
                                  ),
                                ),
                              );

                            }).toList(),
                          ),
                        ),
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  }
              ),

              const Text('Round 5', style: TextStyle(
                  fontSize: 25
              ),),
              FutureBuilder<QuerySnapshot>(
                  future: _matchesr5.get(),
                  builder: (context, snapshot){
                    if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }

                    if(snapshot.connectionState == ConnectionState.done){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: snapshot.data!.docs.map((document){
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: GestureDetector(
                                  onTap: (){
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context)=>R5Container(r5Id: document.id));

                                  },
                                  child: Container(
                                      color: Colors.white12,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Text('${document['date']}'),
                                                  Text('${document['time']}'),
                                                ],
                                              ),
                                              VerticalDivider(
                                                width: 5.w,

                                              ),
                                              Column(
                                                children: [
                                                  Text('${document['team1']}'),
                                                  Text('${document['team2']}'),
                                                ],
                                              ),
                                            ],
                                          ),

                                          Column(
                                            children: [
                                              Text('${document['score1']}'),
                                              Text('${document['score2']}'),
                                            ],
                                          ),



                                        ],
                                      )
                                  ),
                                ),
                              );

                            }).toList(),
                          ),
                        ),
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  }
              ),

              const Text('Round 6', style: TextStyle(
                  fontSize: 25
              ),),
              FutureBuilder<QuerySnapshot> (
                  future: _matchesr6.get(),
                  builder: (context, snapshot){
                    if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }

                    if(snapshot.connectionState == ConnectionState.done){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: snapshot.data!.docs.map((document){
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: GestureDetector(
                                  onTap: (){

                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context)=>R6Container(r6Id: document.id));

                                  },
                                  child: Container(
                                      color: Colors.white12,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Text('${document['date']}'),
                                                  Text('${document['time']}'),
                                                ],
                                              ),
                                              VerticalDivider(
                                                width: 5.w,

                                              ),
                                              Column(
                                                children: [
                                                  Text('${document['team1']}'),
                                                  Text('${document['team2']}'),
                                                ],
                                              ),
                                            ],
                                          ),

                                          Column(
                                            children: [
                                              Text('${document['score1']}'),
                                              Text('${document['score2']}'),
                                            ],
                                          ),



                                        ],
                                      )
                                  ),
                                ),
                              );

                            }).toList(),
                          ),
                        ),
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  }
              ),
            ],
          ),
        )
    );
  }
}



class UmatRoundOf8 extends StatefulWidget {
  const UmatRoundOf8({Key? key}) : super(key: key);

  @override
  _UmatRoundOf8State createState() => _UmatRoundOf8State();
}
class _UmatRoundOf8State extends State<UmatRoundOf8> {

  final CollectionReference _matchesR8 =
  FirebaseFirestore.instance.collection('matches1of8');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Round 1 of 16', style: TextStyle(
                  fontSize: 25
              ),),
              FutureBuilder<QuerySnapshot>(
                  future: _matchesR8.get(),
                  builder: (context, snapshot){
                    if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }

                    if(snapshot.connectionState == ConnectionState.done){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: snapshot.data!.docs.map((document){
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: GestureDetector(
                                  onTap: (){

                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context)=>RoundOf8Container(round8Id: document.id));

                                  },
                                  child: Container(
                                      color: Colors.white12,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Text('${document['date']}'),
                                                  Text('${document['time']}'),
                                                ],
                                              ),
                                              VerticalDivider(
                                                width: 5.w,

                                              ),
                                              Column(
                                                children: [
                                                  Text('${document['team1']}'),
                                                  Text('${document['team2']}'),
                                                ],
                                              ),
                                            ],
                                          ),

                                          Column(
                                            children: [
                                              Text('${document['score1']}'),
                                              Text('${document['score2']}'),
                                            ],
                                          ),



                                        ],
                                      )
                                  ),
                                ),
                              );

                            }).toList(),
                          ),
                        ),
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  }
              ),




            ],
          ),
        ),
      ),
    );
  }
}



class QuaterFinals extends StatefulWidget {
  const QuaterFinals({Key? key}) : super(key: key);

  @override
  _QuaterFinalsState createState() => _QuaterFinalsState();
}
class _QuaterFinalsState extends State<QuaterFinals> {

  final CollectionReference _quaterfinals =
  FirebaseFirestore.instance.collection('quaterFinals');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              const Text('Quarter Finals', style: TextStyle(
                  fontSize: 25
              ),),
              FutureBuilder<QuerySnapshot>(
                  future: _quaterfinals.get(),
                  builder: (context, snapshot){
                    if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }

                    if(snapshot.connectionState == ConnectionState.done){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: snapshot.data!.docs.map((document){
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: GestureDetector(
                                  onTap: (){
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context)=>QuaterFinalsContainer(quaterfinalsId: document.id));


                                  },
                                  child: Container(
                                      color: Colors.white12,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Text('${document['date']}'),
                                                  Text('${document['time']}'),
                                                ],
                                              ),
                                              VerticalDivider(
                                                width: 5.w,

                                              ),
                                              Column(
                                                children: [
                                                  Text('${document['team1']}'),
                                                  Text('${document['team2']}'),
                                                ],
                                              ),
                                            ],
                                          ),

                                          Column(
                                            children: [
                                              Text('${document['score1']}'),
                                              Text('${document['score2']}'),
                                            ],
                                          ),



                                        ],
                                      )
                                  ),
                                ),
                              );

                            }).toList(),
                          ),
                        ),
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  }
              ),




            ],
          ),
        ),
      ),
    );
  }
}



class SemiFinals extends StatefulWidget {
  const SemiFinals({Key? key}) : super(key: key);

  @override
  _SemiFinalsState createState() => _SemiFinalsState();
}
class _SemiFinalsState extends State<SemiFinals> {
  final CollectionReference _semifinals =
  FirebaseFirestore.instance.collection('semiFinals');

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Semi Finals', style: TextStyle(
                  fontSize: 25
              ),),
              FutureBuilder<QuerySnapshot>(
                  future: _semifinals.get(),
                  builder: (context, snapshot){
                    if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }

                    if(snapshot.connectionState == ConnectionState.done){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: snapshot.data!.docs.map((document){
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: GestureDetector(
                                  onTap: (){
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context)=>SemiFinalsContainer(semifinalsId: document.id));

                                  },
                                  child: Container(
                                      color: Colors.white12,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Text('${document['date']}'),
                                                  Text('${document['time']}'),
                                                ],
                                              ),
                                              VerticalDivider(
                                                width: 5.w,

                                              ),
                                              Column(
                                                children: [
                                                  Text('${document['team1']}'),
                                                  Text('${document['team2']}'),
                                                ],
                                              ),
                                            ],
                                          ),

                                          Column(
                                            children: [
                                              Text('${document['score1']}'),
                                              Text('${document['score2']}'),
                                            ],
                                          ),

                                        ],
                                      )
                                  ),
                                ),
                              );

                            }).toList(),
                          ),
                        ),
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  }
              ),




            ],
          ),
        ),
      ),
    );
  }
}

class Finals extends StatefulWidget {
  const Finals({Key? key}) : super(key: key);

  @override
  _FinalsState createState() => _FinalsState();
}

class _FinalsState extends State<Finals> {

  final CollectionReference _finals =
  FirebaseFirestore.instance.collection('umatSeason1Final');

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return Scaffold(

        body: SafeArea(
          child: Container(
            height: 100.h,
            width: 100.w,
            child: FutureBuilder<QuerySnapshot>(
                future: _finals.get(),
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
                                    const Icon(Icons.sports_soccer),
                                    const Text('Pastify League (Season One)')
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
                                    height: 70,
                                    width: 20.w,
                                    decoration: const BoxDecoration(

                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network('${document['images']}', fit: BoxFit.fill,),
                                  ),

                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('${document['waiting']}', style: const TextStyle(
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
                                    height:70,
                                    width: 20.w,
                                    decoration: const BoxDecoration(

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
                                      height: 45,
                                      width:30.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey,
                                      ),
                                      child: const Center(child: Text('H2.40')),
                                    ),


                                    Container(
                                      height:45,
                                      width:30.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey,
                                      ),
                                      child: const Center(child: Text('x4.90')),
                                    ),

                                    Container(
                                      height:45,
                                      width:30.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey,
                                      ),
                                      child: const Center(child: Text('A2.40')),
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
                                            const Text('Venue'),
                                          ]
                                      ),

                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children:[
                                            const Text('Name:'),
                                            Text('${document['venuename']}')
                                          ]
                                      ),

                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children:[
                                            const Text('Location:'),
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

                  return const Center(child: CircularProgressIndicator());
                }
            ),
          ),
        ),
      );
    });
  }
}




