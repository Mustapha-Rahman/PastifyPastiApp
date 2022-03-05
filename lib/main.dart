
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pastify/ad_state.dart';

import 'package:pastify/screens/landingpage.dart';
import 'package:provider/provider.dart';


import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);




  runApp(
  Provider.value(
      value: adState,
    builder: (context, child)=>Pastify(),
  ),

  );
}

class Pastify extends StatefulWidget {
  const Pastify({Key? key}) : super(key: key);

  @override
  State<Pastify> createState() => _PastifyState();
}

class _PastifyState extends State<Pastify> {




  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return MaterialApp(

          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
          ),



          home:LandingPage()
      );
    });
  }
}

//UrlLauncherPlugin.registerWith(registrar);
//import 'package:url_launcher_web/url_launcher_web.dart';


