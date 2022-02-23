import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pastify/games/Akwaaba/umat%20welcome%20level%20100.dart';
import 'package:pastify/games/umat%20games/details.dart';
import 'package:pastify/games/umat%20games/homepage.dart';
import 'package:pastify/games/umat%20games/umatregistration.dart';

import 'package:sizer/sizer.dart';

class HomePageGames extends StatefulWidget {
  const HomePageGames({Key? key}) : super(key: key);

  @override
  _HomePageGamesState createState() => _HomePageGamesState();
}

class _HomePageGamesState extends State<HomePageGames> {
  final CollectionReference _homepagegames =
      FirebaseFirestore.instance.collection('umatStandingsGroup1');

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              height: 100.h,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black87, Colors.white60])
              ),
              child: Column(
                children: [
                  Container(
                    height: 40.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/gamess.png',
                          ),
                          fit: BoxFit.fill,
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Text('Welcome To Pastify Game', style: TextStyle(
                      color: Colors.white
                    ),),
                  ),

                  FutureBuilder<QuerySnapshot>(
                      future: _homepagegames.get(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        if (snapshot.connectionState == ConnectionState.done) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("Close"),
                                              ),
                                            ],
                                            title: Column(
                                              children: [
                                                const Text("eLeague PreSeason"),
                                                Container(
                                                  height: 2,
                                                  width: 100.w,
                                                  color: Colors.black87,
                                                ),
                                              ],
                                            ),
                                            contentPadding:
                                                const EdgeInsets.all(20.0),
                                            content: Container(
                                              height: 100.h,
                                              width: 100.w,
                                              child: ListView(
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const UmatAkwaabaCompetitionDetails()));
                                                      },
                                                      child: const Text(
                                                          "KnockOut Phase")),
                                                  Container(
                                                    height: 2,
                                                    width: 100.w,
                                                    color: Colors.grey,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                    width: 100.w,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        UmatRegistration()));
                                                      },
                                                      child: const Text(
                                                          "Registration")),
                                                  Container(
                                                    height: 2,
                                                    width: 100.w,
                                                    color: Colors.grey,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                    width: 100.w,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const GoalRankingAkwaaba()));
                                                      },
                                                      child: const Text(
                                                          "Goal Ranking")),
                                                  Container(
                                                    height: 2,
                                                    width: 100.w,
                                                    color: Colors.grey,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                    width: 100.w,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const AssistRankingAkaaba()));
                                                      },
                                                      child: const Text(
                                                          "Assist Ranking")),
                                                  Container(
                                                    height: 2,
                                                    width: 100.w,
                                                    color: Colors.grey,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                    width: 100.w,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const RegulationsAkwaaba()));
                                                      },
                                                      child: const Text(
                                                          "Regulations")),
                                                  Container(
                                                    height: 2,
                                                    width: 100.w,
                                                    color: Colors.grey,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ));
                                },
                                child: Container(
                                  height: 13.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: const LinearGradient(colors: [
                                        Colors.pinkAccent,
                                        Colors.blue,
                                      ])),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 10.h,
                                        width: 20.w,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.red,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/gamess.png'))),
                                      ),
                                      Text(
                                        'Umat Champions League Pre Season',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Close"),
                                            ),
                                          ],
                                          title: Column(
                                            children: [
                                              const Text("eLeague Season 1"),
                                              Container(
                                                height: 2,
                                                width: 100.w,
                                                color: Colors.black87,
                                              ),
                                            ],
                                          ),
                                          contentPadding:
                                          const EdgeInsets.all(20.0),
                                          content: Container(
                                            height: 100.h,
                                            width: 100.w,
                                            child: ListView(
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                              const Details()));
                                                    },
                                                    child: const Text(
                                                        "Competition Details")),
                                                Container(
                                                  height: 2,
                                                  width: 100.w,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                  width: 100.w,
                                                ),

                                                GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                  UmatRegistration()));
                                                    },
                                                    child: const Text(
                                                        "Registration")),
                                                Container(
                                                  height: 2,
                                                  width: 100.w,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                  width: 100.w,
                                                ),

                                                GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                              const GoalRankingUmat()));
                                                    },
                                                    child: const Text(
                                                        "Goal Ranking")),
                                                Container(
                                                  height: 2,
                                                  width: 100.w,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                  width: 100.w,
                                                ),

                                                GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                              const AssistRankingUmat()));
                                                    },
                                                    child: const Text(
                                                        "Assist Ranking")),
                                                Container(
                                                  height: 2,
                                                  width: 100.w,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                  width: 100.w,
                                                ),

                                                GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                              const RegulationsAkwaaba()));
                                                    },
                                                    child: const Text(
                                                        "Regulations")),
                                                Container(
                                                  height: 2,
                                                  width: 100.w,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                  width: 100.w,
                                                ),

                                              ],
                                            ),
                                          ),
                                        ));

                                  },
                                  child: Container(
                                    height: 13.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(colors: [
                                          Colors.pinkAccent,
                                          Colors.blue,
                                        ])),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 10.h,
                                          width: 20.w,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.red,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/gamess.png'))),
                                        ),
                                        Text(
                                          'Umat Champions League(Season1)',
                                          style: TextStyle(fontSize: 10.sp),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }

                        return const Center(child: CircularProgressIndicator());
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

class RegulationsAkwaaba extends StatelessWidget {
  const RegulationsAkwaaba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Competitions Regulations"),
      ),
      backgroundColor: Colors.black26,
      body: Container(
        width: 100.w,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ Colors.black38, Colors.white70]
          )
        ),
        child: ListView(
          children: const [
            Text(
              "*Contested by 32 Teams",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "*Single leg Knockout Format",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "*No 3rd Play-Off",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "*Players receive one match suspension after 2 cautions",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "*Automatic One match suspension after red card",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class AssistRankingAkaaba extends StatefulWidget {
  const AssistRankingAkaaba({Key? key}) : super(key: key);

  @override
  State<AssistRankingAkaaba> createState() => _AssistRankingAkaabaState();
}

class _AssistRankingAkaabaState extends State<AssistRankingAkaaba> {
  final CollectionReference _akwaabaassistranking =
      FirebaseFirestore.instance.collection('Akwaabaassist');

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),

          body: Container(
            width: 100.w,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.black87, Colors.white60])
            ),
            child: ListView(
        children: [
            Container(
              height: 100,
              width: 100.w,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
              ),
              child: const Center(child: Text("Assist Ranking (PreSeason 1)")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("Player", style: TextStyle(
                  color: Colors.white
                ),), const Text("Assist")],
              ),
            ),
            Container(
              height: 2,
              width: 100.w,
              color: Colors.black87,
            ),
            FutureBuilder<QuerySnapshot>(
              future: _akwaabaassistranking.get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: snapshot.data!.docs.map((document) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 40,
                          width: 100.w,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${document["number"]}. ${document["name"]}"),
                              Text("${document["assist"]}")
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
        ],
      ),
          ));
    });
  }
}

class GoalRankingAkwaaba extends StatefulWidget {
  const GoalRankingAkwaaba({Key? key}) : super(key: key);

  @override
  State<GoalRankingAkwaaba> createState() => _GoalRankingAkwaabaState();
}

class _GoalRankingAkwaabaState extends State<GoalRankingAkwaaba> {
  final CollectionReference _akwaabagoalranking =
      FirebaseFirestore.instance.collection('AkwaabaGoalRanking');

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            width: 100.w,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.black87, Colors.white60])
            ),
            child: ListView(
              children: [
                Container(
                  height: 100,
                  width: 100.w,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
                  ),
                  child:
                      const Center(child: Text("Goal Ranking (PreSeason 1)")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text("Player", style: TextStyle(
                      color: Colors.white
                    ),), const Text("Goals")],
                  ),
                ),
                Container(
                  height: 2,
                  width: 100.w,
                  color: Colors.black87,
                ),
                FutureBuilder<QuerySnapshot>(
                  future: _akwaabagoalranking.get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        children: snapshot.data!.docs.map((document) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 40,
                              width: 100.w,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "${document["number"]}. ${document["name"]}"),
                                  Text("${document["goals"]}")
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ));
    });
  }
}


class AssistRankingUmat extends StatefulWidget {
  const AssistRankingUmat({Key? key}) : super(key: key);

  @override
  _AssistRankingUmatState createState() => _AssistRankingUmatState();
}

class _AssistRankingUmatState extends State<AssistRankingUmat> {

  final CollectionReference _umatassistranking =
  FirebaseFirestore.instance.collection('Season1Assist');

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),

          body: Container(
            width: 100.w,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.black87, Colors.white60])
            ),
            child: ListView(
              children: [
                Container(
                  height: 100,
                  width: 100.w,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
                  ),
                  child: const Center(child: Text("Assist Ranking (PreSeason 1)")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text("Player", style: TextStyle(
                        color: Colors.white
                    ),), const Text("Assist")],
                  ),
                ),
                Container(
                  height: 2,
                  width: 100.w,
                  color: Colors.black87,
                ),
                FutureBuilder<QuerySnapshot>(
                  future: _umatassistranking.get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        children: snapshot.data!.docs.map((document) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 40,
                              width: 100.w,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${document["number"]}. ${document["name"]}"),
                                  Text("${document["assist"]}")
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ));
    });
  }
}


class GoalRankingUmat extends StatefulWidget {
  const GoalRankingUmat({Key? key}) : super(key: key);

  @override
  _GoalRankingUmatState createState() => _GoalRankingUmatState();
}

class _GoalRankingUmatState extends State<GoalRankingUmat> {
  final CollectionReference _umatgoalsranking =
  FirebaseFirestore.instance.collection('Season1Goals');
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),

          body: Container(
            width: 100.w,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.black87, Colors.white60])
            ),
            child: ListView(
              children: [
                Container(
                  height: 100,
                  width: 100.w,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
                  ),
                  child: const Center(child: Text("Goal Ranking (PreSeason 1)")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text("Player", style: TextStyle(
                        color: Colors.white
                    ),), const Text("Goal")],
                  ),
                ),
                Container(
                  height: 2,
                  width: 100.w,
                  color: Colors.black87,
                ),
                FutureBuilder<QuerySnapshot>(
                  future: _umatgoalsranking.get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        children: snapshot.data!.docs.map((document) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 40,
                              width: 100.w,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${document["number"]}. ${document["name"]}"),
                                  Text("${document["goals"]}")
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ));
    });
  }
}


