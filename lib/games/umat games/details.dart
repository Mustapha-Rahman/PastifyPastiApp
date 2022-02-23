import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pastify/games/umat%20games/rewards.dart';
import 'package:pastify/games/umat%20games/standings.dart';

import 'package:sizer/sizer.dart';


import 'gamedetails.dart';
import 'matches.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);






  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return DefaultTabController(
        length: 4,
        child: Scaffold(

          appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab( child: Text('Details')),
                  Tab( child: Text('Match')),
                  Tab( child: Text('Standings')),
                  Tab( child: Text('Rewards')),

                ],
              )
          ),
          body: TabBarView(
              children:  [
                const GameDetails(),
                const MatchesDetails(),
                UmatStandings(),
                UmatReward(),

              ]),
        ),
      );

    });
  }
}

/*
SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                  future: _details.get(),
                  builder: (context, snapshot){
                    if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }

                    if(snapshot.connectionState == ConnectionState.done){
                      return Column(
                        children: [
                          Text('Hello Please welcome to Umat Champions League Season one', style: TextStyle(
                            fontSize: 10.sp
                          ),),

                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=>UmatMatches()
                              ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Container(
                                height: 15.h,
                                width:100.w,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Center(
                                  child: Text('Matches', style: TextStyle(
                                      fontSize: 20.sp
                                  ),),
                                ),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=>UmatStandings()
                              ));
                            },
                            child: Container(
                              height: 15.h,
                              width:100.w,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(
                                child: Text('Standings', style: TextStyle(
                                    fontSize: 20.sp
                                ),),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=>UmatReward()
                              ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Container(
                                height: 15.h,
                                width:100.w,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Center(
                                  child: Text('Awards', style: TextStyle(
                                      fontSize: 20.sp
                                  ),),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }


                    return Center(child: CircularProgressIndicator());

                  }),
            ),
          ),
 */
