//ca-app-pub-7039001693169695/3968089037
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


import 'package:pastify/screens/landingpage.dart';


import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(
    Pastify(),
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


