import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Akwaaba/registration.dart';
import 'details.dart';

class UmatRegistration extends StatefulWidget {
  @override
  _UmatRegistrationState createState() => _UmatRegistrationState();
}

class _UmatRegistrationState extends State<UmatRegistration> {
  final _controller = TextEditingController();
  final _controllerPhoneNumberUmat = TextEditingController();
  final _controllerResidentUmat = TextEditingController();
  final _controllerClubNameUmat = TextEditingController();

  void _umatChampionsLeagueRegistration() {
    final registrationUmat = _controller.text;
    final phoneNumberUmat = _controllerPhoneNumberUmat.text;
    final residentUmat = _controllerResidentUmat.text;
    final clubNameUmat = _controllerClubNameUmat.text;

    FirebaseFirestore.instance.collection('Umat Registration').add({
      'User Name': registrationUmat,
      'Phone Number': phoneNumberUmat,
      'Resident': residentUmat,
      'Club Name': clubNameUmat
    });
  }

  final CollectionReference _umatregistration =
      FirebaseFirestore.instance.collection('UmatAkwaabaB1');

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
          body: SafeArea(
            child: FutureBuilder(
        future: _umatregistration.get(),
        builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Column(
                  children: [

                    CircleAvatar(
                      radius: 10.h,
                      backgroundImage: AssetImage("assets/images/koking.jpg"),
                    ),
                    SizedBox(
                      height: 20
                    ),

                    Container(
                      height: 270,
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: Colors.white
                      ),
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 3, right: 3),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.black
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  controller: _controller,
                                  decoration:
                                  const InputDecoration(hintText: 'Players Name'),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8.0, left: 2, right: 2),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.black
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                controller: _controllerPhoneNumberUmat,
                                decoration: const InputDecoration(
                                    hintText: 'Phone Number',
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.black
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                controller: _controllerResidentUmat,
                                decoration: const InputDecoration(
                                    hintText: 'Hostel/Halls Name/Resident',
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 3, right: 3),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.black
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                controller: _controllerClubNameUmat,
                                decoration:
                                const InputDecoration(hintText: 'Club Name'),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),





                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          'Please Check whether the club has been registered here!!', style: TextStyle(),),
                    ),

                    ElevatedButton(
                      child: const Text('REGISTERED TEAMS'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UmatRegisteredTeams()));
                      },
                    ),


                    ElevatedButton(
                        onPressed: () {
                          _umatChampionsLeagueRegistration();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AkwaabaRegistrationDone()));
                        },
                        child: const Text('Submit'))
                  ],
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
        },
      ),
          ));
    });
  }
}

class UmatRegisteredTeams extends StatefulWidget {
  @override
  _UmatRegisteredTeamsState createState() => _UmatRegisteredTeamsState();
}

class _UmatRegisteredTeamsState extends State<UmatRegisteredTeams> {
  final CollectionReference _umatregisteredteams =
      FirebaseFirestore.instance.collection('Season1registered');

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Umat registered teams'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<QuerySnapshot>(
              future: _umatregisteredteams.get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                      children: snapshot.data!.docs.map(
                    (document) {
                      return GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              enableDrag: true,
                              context: context,
                              builder: (context) => RegisteredPlayerDetails(
                                  idRegistered: document.id));
                        },
                        child: Container(
                          height: 70,
                          width: 100.w,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Text(
                                  '${document['number']}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                      child: Image.network(
                                    '${document['images']}',
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: Text('${document['team']}'
                                      '=>'
                                      '${document['name']}'),
                                ),
                                Text('( ${document['class']} )')
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList());
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        );
      },
    );
  }
}

class RegisteredPlayerDetails extends StatefulWidget {
  String idRegistered;

  RegisteredPlayerDetails({required this.idRegistered});

  @override
  _RegisteredPlayerDetailsState createState() =>
      _RegisteredPlayerDetailsState();
}

class _RegisteredPlayerDetailsState extends State<RegisteredPlayerDetails> {
  final CollectionReference _umatregisteredteams =
      FirebaseFirestore.instance.collection('Season1registered');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FutureBuilder(
            future: _umatregisteredteams.doc(widget.idRegistered).get(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('${snapshot.error}'));
              }
              if (snapshot.connectionState == ConnectionState.done) {
                DocumentSnapshot<Object?> documentData = snapshot.data!;

                return Column(
                  children: [
                    Center(
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  '${documentData['playerpicture']}'),
                              fit: BoxFit.fill,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Name of Player:',
                              style: TextStyle(fontSize: 10.sp),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                '${documentData['name']}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Coarse:',
                              style: TextStyle(fontSize: 10.sp),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                '${documentData['coarse']}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Nationality:',
                              style: TextStyle(fontSize: 10.sp),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                '${documentData['Nationality']}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Team:',
                              style: TextStyle(fontSize: 10.sp),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                '${documentData['team']}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Players Age:',
                              style: TextStyle(fontSize: 10.sp),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                '${documentData['age']}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'School:',
                              style: TextStyle(fontSize: 10.sp),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                '${documentData['school']}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Class:',
                              style: TextStyle(fontSize: 10.sp),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                '${documentData['class']}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    ));
  }
}

class RegistrationDone extends StatelessWidget {
  const RegistrationDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        body: Container(
          color: Colors.white38,
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: AssetImage(''))),
                ),
              ),
              const Text(
                'Thanks for registering we will get to you as soon as possible, Good Luck.',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              ElevatedButton(
                child: const Text('Go to Competition Details'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Details()));
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
