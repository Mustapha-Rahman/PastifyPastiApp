import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'details.dart';

class NewsHomePage extends StatefulWidget {
  const NewsHomePage({Key? key}) : super(key: key);

  @override
  _NewsHomePageState createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage> {


  final CollectionReference _news =
  FirebaseFirestore.instance.collection('Pastify News');


  final CollectionReference _popular =
  FirebaseFirestore.instance.collection('PastifyNewsPopular');

  final CollectionReference _loading =
  FirebaseFirestore.instance.collection('Loading');


  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return Scaffold(


          body: SafeArea(
            child: FutureBuilder<QuerySnapshot>(
              future: _loading.get(),
              builder: (context, snapshot){
                if(snapshot.hasError){
                  return Text('${snapshot.error}');
                }


                if(snapshot.connectionState == ConnectionState.done){
                  return  ListView(
                    children: snapshot.data!.docs.map((document){
                      return Column(
                        children: [

                          Row(
                            children: [

                              Container(
                                height: 50,
                                width: 20.w,
                                decoration: const BoxDecoration(
                                  color: Colors.blueAccent,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/logoo.png'),
                                    fit: BoxFit.fill
                                  )
                                ),
                              ),
                              const Text('Pastify Facts')
                            ],
                          ),

                          const Text('Popular Facts', style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),

                          FutureBuilder<QuerySnapshot>(
                            future: _popular.get(),
                              builder: (context, snapshot){
                                if(snapshot.hasError){
                                  return Text('${snapshot.error}');
                                }

                                if(snapshot.connectionState == ConnectionState.done){
                                  return Row(
                                    children: snapshot.data!.docs.map((document){
                                      return Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (context)=>PopularNewsDetails(idpopularnews: document.id)));
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 35.h,
                                                width: 80.w,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius: BorderRadius.circular(20)
                                                ),
                                              ),

                                              Container(
                                                height: 27.h,
                                                width: 80.w,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    image: DecorationImage(
                                                      image: NetworkImage('${document['image']}'),
                                                      fit: BoxFit.fill
                                                    ),
                                                    borderRadius: BorderRadius.circular(20),
                                                ),
                                              ),

                                              Positioned(
                                                bottom: 5.0,
                                                left: 3.0,
                                                child: Container(
                                                  width: 80.w,
                                                    child: Text('${document['title']}')
                                                ),
                                              ),


                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  );
                                }

                                return const Center(child: CircularProgressIndicator());
                              }
                          ),

                          const Text('Latest Facts'),

                          FutureBuilder<QuerySnapshot>(
                              future: _news.get(),
                              builder: (context, snapshot){
                                if(snapshot.hasError){
                                  return Text('${snapshot.error}');
                                }

                                if(snapshot.connectionState == ConnectionState.done){
                                  return Column(
                                    children: snapshot.data!.docs.map((document){
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (context)=>  NewsDetails(newsId: document.id)
                                            ));
                                          },
                                          child: Container(
                                            height: 100,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 100,
                                                  width: 30.w,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    image: DecorationImage(
                                                      image: NetworkImage('${document['image']}'),
                                                      fit: BoxFit.fill
                                                    )
                                                  ),
                                                ),

                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      height: 60,
                                                        width:60.w ,
                                                        child: Text('${document['title']}')
                                                    ),

                                                    Text('${document['date']}')
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  );
                                }

                                return const Center(child: CircularProgressIndicator());
                              }
                          ),

                        ],
                      );

                    }).toList(),
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          )
      );
    });
  }
}
