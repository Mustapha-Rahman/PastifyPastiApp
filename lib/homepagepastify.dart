import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pastify/games/homepagegames.dart';
import 'package:pastify/vibes/homepage.dart';

import 'package:sizer/sizer.dart';

import 'News/homepage.dart';
import 'contacts.dart';
import 'feedback/homepage feedback.dart';
import 'notification/notification.dart';
import 'screens/homepage.dart';


class HomePagePastify extends StatelessWidget {
  const HomePagePastify({Key? key}) : super(key: key);

  //Device.orientation == Orientation.portrait?

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,

        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white60,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Pastify'),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationPastify()));
                    },
                    child: const Icon(Icons.notifications_active))
              ],
            ),
          ),

        drawer: Drawer(
            child: SafeArea(
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 240.0,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          image: const DecorationImage(
                              image: const AssetImage(
                                'assets/images/logoo.png',
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    leading: const Icon(Icons.feedback_rounded),
                    title: const Text('FeedBack'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomepageFeedBack()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.contact_phone),
                    title: const Text('Contacts Us'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const ContactsUs()));
                    },

                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Log Out'),
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                    },
                  ),
                ],
              ),
            )),
        body: SingleChildScrollView(
          child:Container(
            width: 100.w,
            height: 100.h,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black87, Colors.white60]
              )
            ),
            child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 18.0,
                        horizontal: 30.0,
                      ),
                      child: Text(
                        'Welcome  to Pastify',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 20.0,
                          children: [
                            GestureDetector(
                              child: SizedBox(
                                width: 160.0,
                                height: 180.0,
                                child: Card(
                                  color: Colors.lightBlueAccent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/gamess.png',
                                          height: 120.0,
                                          width: 120.0,
                                        ),
                                        const Text(
                                          'Games',
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const HomePageGames()));
                              },
                            ),
                            GestureDetector(
                              child: SizedBox(
                                width: 160.0,
                                height: 180.0,
                                child: Card(
                                  color: Colors.lightBlueAccent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/Deliveriess.png',
                                          height: 120.0,
                                          width: 120.0,
                                        ),
                                        const Text(
                                          'Deliveries',
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const HomePage()));
                              },
                            ),
                            GestureDetector(
                              child: SizedBox(
                                width: 160.0,
                                height: 180.0,
                                child: Card(
                                  color: Colors.lightBlueAccent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/vibess.png',
                                          height: 120.0,
                                          width: 120.0,
                                        ),
                                        const Text(
                                          'Vibez',
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePageVibes()));
                              },
                            ),
                            GestureDetector(
                              child: SizedBox(
                                width: 160.0,
                                height: 180.0,
                                child: Card(
                                  color: Colors.lightBlueAccent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/Pastify Newss.png',
                                          height: 120.0,
                                          width: 120.0,
                                        ),
                                        const Text(
                                          'Facts',
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NewsHomePage()
                                 ));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      );
    });
  }
}
