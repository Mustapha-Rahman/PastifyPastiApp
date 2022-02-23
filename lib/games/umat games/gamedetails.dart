import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GameDetails extends StatefulWidget {
  const GameDetails({Key? key}) : super(key: key);

  @override
  _GameDetailsState createState() => _GameDetailsState();
}

class _GameDetailsState extends State<GameDetails> {
  final CollectionReference _umatdetails =
      FirebaseFirestore.instance.collection('Umat Details');

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder<QuerySnapshot>(
            future: _umatdetails.get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: snapshot.data!.docs.map((document) {
                    return Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.sports_football_outlined),
                              Text(
                                'Pastify Champions League',
                                style: TextStyle(fontSize: 17.sp),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 5,
                                width: 70.w,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${document['start']}',
                                style: TextStyle(color: Colors.blue),
                              ),
                              Text(
                                '${document['end']}',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Featured Match'),
                          Container(
                            height: 120,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Text('Pastify Champions League'),
                                Row(
                                  children: [
                                    Text('${document['featuredteam1']} - ${document['featuredteam2']}')
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                        image: DecorationImage(
                                          image: NetworkImage('${document['featuredimage1']}'),
                                          fit: BoxFit.fill,
                                        )
                                      ),
                                    ),
                                    Text('${document['featuredwaiting']}'),
                                    Container(
                                      height: 70,
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red,
                                          image: DecorationImage(
                                            image: NetworkImage('${document['featuredimage1']}'),
                                            fit: BoxFit.fill,
                                          )
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                            child: Row(
                              children: [
                                Text('Team Of The Week', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),)
                              ],
                            ),
                          ),

                          Container(
                            height: 370,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage('${document['image9']}'),
                                              fit: BoxFit.fill
                                            )
                                          ),
                                        ),
                                        Text('${document['name9']}', style: TextStyle(
                                            fontSize: 10.sp
                                        ),)

                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage('${document['image10']}'),
                                                  fit: BoxFit.fill
                                              )
                                          ),


                                        ),
                                        Text('${document['name10']}', style: TextStyle(
                                          fontSize: 10.sp
                                        ),)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage('${document['image11']}'),
                                                  fit: BoxFit.fill
                                              )
                                          ),


                                        ),
                                        Text('${document['name11']}', style: TextStyle(
                                            fontSize: 10.sp
                                        ),)
                                      ],
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage('${document['image6']}'),
                                                  fit: BoxFit.fill
                                              )
                                          ),


                                        ),
                                        Text('${document['name6']}', style: TextStyle(
                                            fontSize: 10.sp
                                        ),)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage('${document['image7']}'),
                                                  fit: BoxFit.fill
                                              )
                                          ),


                                        ),
                                        Text('${document['name7']}', style: TextStyle(
                                            fontSize: 10.sp
                                        ),)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage('${document['image8']}'),
                                                  fit: BoxFit.fill
                                              )
                                          ),


                                        ),
                                        Text('${document['name8']}', style: TextStyle(
                                            fontSize: 10.sp
                                        ),)
                                      ],
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage('${document['image2']}'),
                                                  fit: BoxFit.fill
                                              )
                                          ),


                                        ),
                                        Text('${document['name2']}', style: TextStyle(
                                            fontSize: 10.sp
                                        ),)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage('${document['image3']}'),
                                                  fit: BoxFit.fill
                                              )
                                          ),


                                        ),
                                        Text('${document['name3']}', style: TextStyle(
                                            fontSize: 10.sp
                                        ),)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage('${document['image4']}'),
                                                  fit: BoxFit.fill
                                              )
                                          ),


                                        ),
                                        Text('${document['name4']}', style: TextStyle(
                                            fontSize: 10.sp
                                        ),)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage('${document['image5']}'),
                                                  fit: BoxFit.fill
                                              )
                                          ),


                                        ),
                                        Text('${document['name5']}', style: TextStyle(
                                            fontSize: 10.sp
                                        ),)
                                      ],
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage('${document['image1']}'),
                                                  fit: BoxFit.fill
                                              )
                                          ),


                                        ),
                                        Text('${document['name1']}', style: TextStyle(
                                            fontSize: 10.sp
                                        ),)
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top:20.0, bottom: 8.0),
                            child: Text('League Stats', style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom:10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Goals Scored', style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),),
                                Text('${document['totalgoals']}')
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom:10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Home Wins', style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),),
                                Text('${document['homewins']}')
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom:10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Away Wins', style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),),
                                Text('${document['awaywins']}')
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom:10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Draw', style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),),
                                Text('${document['draw']}')
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom:10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Red Cards', style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),),
                                Text('${document['redcards']}')
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom:10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Yellow Cards', style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),),
                                Text('${document['yellowcards']}')
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                );
              }

              return Container(child: Center(child: CircularProgressIndicator()));
            },
          ),
        ),
      );
    });
  }
}
