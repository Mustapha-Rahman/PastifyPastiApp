import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AwardsDetails extends StatefulWidget {
  final String id;
  AwardsDetails({ required this.id});

  @override
  State<AwardsDetails> createState() => _AwardsDetailsState();
}

class _AwardsDetailsState extends State<AwardsDetails> {
  final CollectionReference _umatrewards =
  FirebaseFirestore.instance.collection('umatRewards');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FutureBuilder(
              future: _umatrewards.doc(widget.id).get(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
                if(snapshot.hasError){
                  return Center(child: Text('${snapshot.error}'));
                }
                if(snapshot.connectionState == ConnectionState.done){
                  DocumentSnapshot<Object?> documentData = snapshot.data!;

                  return ListView(
                    padding: EdgeInsets.all(0),
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[100]
                        ),
                        child: Column(
                          children: [
                            Image.network('${documentData['images']}', height: 250,),
                            Text('${documentData['name']} Awards'),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                        child: Text('${documentData['name']}  in the KnockOut Stage(Season One) goes to=> ${documentData['winner']}', style: TextStyle(
                          fontSize: 20
                        ),),
                      ),

                      Text('Eligibility: ${documentData['eligibility']}', style: TextStyle(
                        fontSize: 20
                      ),),

                      Center(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 30,
                            color: Colors.grey[200],
                            child: Text('Nominess')),
                      )),

                      Text('${documentData['nominees'][0]}'),
                      Text('${documentData['nominees'][1]}'),
                      Text('${documentData['nominees'][2]}'),
                      Text('${documentData['nominees'][3]}'),


                    ],
                  );
                }


                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        )
    );
  }
}
