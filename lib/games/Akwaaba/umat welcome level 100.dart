import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'rounds.dart';


class UmatAkwaabaCompetitionDetails extends StatefulWidget {
  const UmatAkwaabaCompetitionDetails({Key? key}) : super(key: key);


  @override
  State<UmatAkwaabaCompetitionDetails> createState() => _UmatAkwaabaCompetitionDetailsState();
}

class _UmatAkwaabaCompetitionDetailsState extends State<UmatAkwaabaCompetitionDetails> {

  final CollectionReference _akwaaba =
  FirebaseFirestore.instance.collection('umatStandingsGroup1');

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.grey,
              title: const Text('KnockOut Stage'),
              bottom: const TabBar(
                tabs: [
                  Tab( child: Text('R1')),
                  Tab( child: Text('1/8')),
                  Tab( child: Text('1/4')),
                  Tab( child: Text('Semi Finals')),
                  Tab( child: Text('Finals')),
                ],
              )

          ),


          body: FutureBuilder(
            future: _akwaaba.get(),
            builder: (context, snapshot){
              if(snapshot.hasError){
                return Text('${snapshot.error}');
              }

              if(snapshot.connectionState == ConnectionState.done){
                return TabBarView(
                    children:  [
                      R1(),
                      R2(),
                      R3(),
                      SemiFinalsAkwaaba(),
                      FinalsAkwaaba(),

                    ]);
              }

              return const Center(child: const CircularProgressIndicator());
            },

          ),
      ),
    );
  }
}











