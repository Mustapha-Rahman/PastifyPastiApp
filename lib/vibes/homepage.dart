
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePageVibes extends StatefulWidget {
  @override
  State<HomePageVibes> createState() => _HomePageVibesState();
}

class _HomePageVibesState extends State<HomePageVibes> {

  final Query<Map<String, dynamic>> _vibes =
      FirebaseFirestore.instance
          .collection('Add Vibes').orderBy('time', descending: true);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          title: Center(
              child: Text(
                'Pastify Vibez \n Vibes will disappeared in 24hours',
                style: TextStyle(
                    fontSize: 10.sp
                ),
              )),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.message),
          onPressed: () {
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20)
                )
              ),
                context: context,
                builder: (context)=>const AddVibes()
            );
          },
        ),
        body: Stack(
          children: [
            FutureBuilder<QuerySnapshot>(
                future: _vibes.get(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Scaffold(
                      body: Center(
                        child: Text('Error: ${snapshot.error}'),
                      ),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    return Scaffold(
                      backgroundColor: Colors.black38,
                      appBar: AppBar(
                        backgroundColor: Colors.grey,
                        title: Align(
                          alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageVibes()));
                              },
                                child: const Icon(Icons.refresh))),
                      ),
                      body: ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: snapshot.data!.docs.map((document) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 45.0, left: 20, right: 15),
                                child: GestureDetector(
                                  onTap:(){
                                //    Navigator.push(context, MaterialPageRoute(
                                  //      builder: (context)=> RepliesPage(idReplies: document.id)));

                                  },
                                  child: Container(
                                    height: 190,
                                    width:100.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black45,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: ListView(
                                        children: [

                                          Align(

                                              child: Text('${document['time']}', style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 10.sp
                                              ),),
                                            alignment: Alignment.topRight,
                                          ),
                                          Container(
                                            width: 80.w,
                                            child: Text(
                                              '${document['Vibes']}.',
                                              style: TextStyle(
                                                  fontSize: 16.sp, color: Colors.white),
                                            ),
                                          ),





                                        ],
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

                  return const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  );
                }),
          ],
        ),
      );
    });
  }
}

class AddVibes extends StatefulWidget {
  const AddVibes({Key? key}) : super(key: key);

  @override
  _AddVibesState createState() => _AddVibesState();
}

class _AddVibesState extends State<AddVibes> {





  final _postvibe = TextEditingController();


  void _postVibe() {
    final vibes = _postvibe.text;

    final Time =DateTime.now().toString();

//    Time = DateFormat('kk:mm').format(now);



    FirebaseFirestore.instance
        .collection('Add Vibes')
        .add({'Vibes': vibes, 'time': Time});

  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return ListView(
        children: [


          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        children: const [
                          Text('Lets Discuss about the diverse things with', style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          Text(' anonymous people')
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Column(
                children: [
                  Container(
                    height: 40.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        gradient:const LinearGradient(
                            colors: [Colors.pinkAccent, Colors.blue]
                        ),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextField(
                      maxLines: 8,
                      controller: _postvibe,
                      textInputAction: TextInputAction.done,
                      maxLength: 400,
                      decoration:
                      const InputDecoration(hintText: 'Enter Vibes Here'),
                    ),
                  ),

                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          _postVibe();

                        });

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePageVibes()));
                      }, child: const Text("Send"))
                ],
              )
            ],
          ),

        ],
      );
    });
  }
}

