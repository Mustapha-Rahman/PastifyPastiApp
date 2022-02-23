import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pastify/games/umat%20games/umatregistration.dart';

import 'package:sizer/sizer.dart';


import 'details.dart';


class HomePageUmatGames extends StatefulWidget {
  const HomePageUmatGames({Key? key}) : super(key: key);

  @override
  State<HomePageUmatGames> createState() => _HomePageUmatGamesState();
}

class _HomePageUmatGamesState extends State<HomePageUmatGames> {

  final CollectionReference _umatleague =
  FirebaseFirestore.instance.collection('UmatAkwaabaB1');
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return Scaffold(

        body: SafeArea(
          child: Padding(

            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 100.h,
              child: Column(
                children: [
                  Container(
                    height: 45.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: const AssetImage('assets/images/1.png', ),
                        fit: BoxFit.fill,
                      )
                    ),
                  ),

                  const Text('Welcome To Umat Champions League Season 1'),

                  FutureBuilder<QuerySnapshot>(
                      future: _umatleague.get(),

                      builder: (context, snapshot){
                        if(snapshot.hasError){
                          return Text('${snapshot.error}');
                        }

                        if(snapshot.connectionState == ConnectionState.done){
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Details()));
                                  },

                                  child: Container(
                                    height: 14.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        color: Colors.blue
                                        ,
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              image: DecorationImage(
                                                image:  AssetImage('assets/images/1.png',),
                                                fit: BoxFit.fill,
                                              )
                                            ),

                                          ),
                                        ),

                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Text('Umat Competition Details'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: GestureDetector(
                                  onTap: (){


                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context)=>UmatRegistration()
                                    ));




                                  },
                                  child: Container(
                                    height: 14.h,
                                    width:100.w,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Container(
                                            height: 15.h,
                                            width:15.w,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              image: const DecorationImage(
                                                image: AssetImage('assets/images/1.png',),
                                                fit: BoxFit.fill,
                                              )
                                            ),

                                          ),
                                        ),

                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: const Text('Registration'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        }

                        return const Center(child: const CircularProgressIndicator());
                      }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}



