import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pastify/games/Akwaaba/umat%20welcome%20level%20100.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

import '../../ad_state.dart';
import '../umat games/umatregistration.dart';

class AkwaabaRegistration extends StatefulWidget {
  @override
  _UmatRegistrationState createState() => _UmatRegistrationState();
}

class _UmatRegistrationState extends State<AkwaabaRegistration> {
  final _controller = TextEditingController();
  final _controllerPhoneNumberUmat = TextEditingController();
  final _controllerResidentUmat = TextEditingController();
  final _controllerClubNameUmat = TextEditingController();

  void _umatChampionsLeagueRegistration() {
    final AkwaabaRegistrationUmat = _controller.text;
    final AkwaabaPhoneNumberUmat = _controllerPhoneNumberUmat.text;
    final AkwaabaResidentUmat = _controllerResidentUmat.text;
    final AkwaabaClubNameUmat = _controllerClubNameUmat.text;

    FirebaseFirestore.instance.collection('Akwaaba Registration').add({
      'User Name': AkwaabaRegistrationUmat,
      'Phone Number': AkwaabaPhoneNumberUmat,
      'Resident': AkwaabaResidentUmat,
      'Club Name': AkwaabaClubNameUmat
    });
  }

  final CollectionReference _akwaabaregistration =
      FirebaseFirestore.instance.collection('UmatAkwaabaB3');


  late BannerAd banner;
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status){
      setState(() {
        banner = BannerAd(
          request:AdRequest(),
          adUnitId: adState.bannerAdUnitId,
          size: AdSize.banner,
          listener: adState.listener,
        )..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: _akwaabaregistration.get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                            'Fill in the forms below to complete registration'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 7.h,
                          width: 100.w,
                          decoration:
                              BoxDecoration(color: Colors.grey[200]),
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            controller: _controller,
                            decoration:
                                const InputDecoration(hintText: 'Players Name'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 7.h,
                          width: 100.w,
                          decoration:
                              BoxDecoration(color: Colors.grey[200]),
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            controller: _controllerPhoneNumberUmat,
                            decoration:
                                const InputDecoration(hintText: 'Phone Number'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 7.h,
                          width: 100.w,
                          decoration:
                              BoxDecoration(color: Colors.grey[200]),
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            controller: _controllerResidentUmat,
                            decoration: const InputDecoration(
                                hintText: 'Hostel/Halls Name/Resident'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 7.h,
                          width: 100.w,
                          decoration:
                              BoxDecoration(color: Colors.grey[200]),
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            controller: _controllerClubNameUmat,
                            decoration:
                                const InputDecoration(hintText: 'Club Name'),
                          ),
                        ),
                      ),
                      const Text(
                          'Please Check whether the team has been registered here!!'),
                      ElevatedButton(
                        child: const Text('REGISTERED TEAMS'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UmatRegisteredTeams()));
                        },
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _umatChampionsLeagueRegistration();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AkwaabaRegistrationDone()));
                          },
                          child: const Text('Done')),
                    ],
                  );
                }

                return const Center(child: const CircularProgressIndicator());
              },
            ),

            if(banner ==null)
              SizedBox(
                height: 50,
              )

            else Container(
              height: 70,
              child: AdWidget(ad: banner,),

            )
          ],
        ),
      ));
    });
  }
}

class AkwaabaRegisteredTeams extends StatefulWidget {
  @override
  State<AkwaabaRegisteredTeams> createState() => _AkwaabaRegisteredTeamsState();
}

class _AkwaabaRegisteredTeamsState extends State<AkwaabaRegisteredTeams> {
  final CollectionReference _akwaabaregisteredteams =
      FirebaseFirestore.instance.collection('akwaabaregisteredteams');

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            title: const Text('Akwaaba Registered Teams'),
          ),
          body: FutureBuilder<QuerySnapshot>(
            future: _akwaabaregisteredteams.get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                    children: snapshot.data!.docs.map(
                  (document) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        height: 10.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '${document['number']}',
                              style: TextStyle(fontSize: 10.sp),
                            ),
                            Image.network('${document['images'][0]}'),
                            Text('${document['team']}'
                                '=>'
                                '${document['name']}'),
                            Text('( ${document['class']} )')
                          ],
                        ),
                      ),
                    );
                  },
                ).toList());
              }

              return const Center(child: const CircularProgressIndicator());
            },
          ));
    });
  }
}

class AkwaabaRegistrationDone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white38,
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 20.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image:
                                const AssetImage(''))),
                  ),
                ),
                Text(
                  'Thanks for registering we will get to you as soon as possible, Good Luck.',
                  style: TextStyle(
                    fontSize: 15.sp,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const UmatAkwaabaCompetitionDetails()));
                    },
                    child: const Text('Match Details'))
              ],
            ),
          ),
        ),
      );
    });
  }
}
