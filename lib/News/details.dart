import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NewsDetails extends StatefulWidget {
  String newsId;
  NewsDetails({ required this.newsId});



  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {

  final CollectionReference _news =
  FirebaseFirestore.instance.collection('Pastify News');


  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation,deviceType){
      return Scaffold(
        appBar: AppBar(),


        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FutureBuilder(
            future: _news.doc(widget.newsId).get(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
              if(snapshot.hasError){
                return Text("${snapshot.hasError}");
              }

              if(snapshot.connectionState == ConnectionState.done){
                DocumentSnapshot<Object?> documentData = snapshot.data!;

                return SingleChildScrollView(
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Text('${documentData['title']}', style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Row(
                          children: [
                            Text('Author:'),
                            Text('${documentData['author']}', style: TextStyle(
                                fontSize: 15
                            ),),


                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage('${documentData['image']}'),
                                  fit: BoxFit.fill,
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text('${documentData['description1']}'),
                      ),

                      Text('${documentData['description2']}'),

                    ],
                  ),
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      );
    });
  }
}


class PopularNewsDetails extends StatefulWidget {
  String idpopularnews;
  PopularNewsDetails({required this.idpopularnews});

  @override
  _PopularNewsDetailsState createState() => _PopularNewsDetailsState();
}

class _PopularNewsDetailsState extends State<PopularNewsDetails> {

  final CollectionReference _popular =
  FirebaseFirestore.instance.collection('PastifyNewsPopular');
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation,deviceType){
      return Scaffold(
        appBar: AppBar(),


        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FutureBuilder(
            future: _popular.doc(widget.idpopularnews).get(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
              if(snapshot.hasError){
                return Text("${snapshot.hasError}");
              }

              if(snapshot.connectionState == ConnectionState.done){
                DocumentSnapshot<Object?> documentData = snapshot.data!;

                return SingleChildScrollView(
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Text('${documentData['title']}', style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Row(
                          children: [
                            Text('Author:'),
                            Text('${documentData['author']}', style: TextStyle(
                                fontSize: 15
                            ),),


                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage('${documentData['image']}'),
                                  fit: BoxFit.fill,
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text('${documentData['description1']}'),
                      ),

                      Text('${documentData['description2']}'),

                    ],
                  ),
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      );
    });
  }
}

