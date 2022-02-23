import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'package:sizer/sizer.dart';

import '../homepagepastify.dart';
import 'loginpage.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text('Error: ${snapshot.error}'),
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, streamSnapshot) {
                  if (streamSnapshot.hasError) {
                    return Scaffold(
                      body: Center(
                        child: Text('Error: ${streamSnapshot.error}'),
                      ),
                    );
                  }

                  if (streamSnapshot.connectionState ==
                      ConnectionState.active) {
                    Object? _user = streamSnapshot.data;

                    if (_user == null) {
                      return LoginPage();
                    } else {
                      return const HomePagePastify(); /*HomePage();*/
                    }
                  }

                  return Scaffold(
                    body: Container(
                      color: Colors.white,
                      child: Center(child: Text('Pastify', style: TextStyle(
                        color: Colors.blue,
                        fontSize: 40.sp
                      ),)),
                    ),
                  );
                },
              );
            }
            return Container(
              color: Colors.white,
            );
          });
    });
  }
}
