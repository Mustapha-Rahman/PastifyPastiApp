import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pastify/screens/landingpage.dart';


import 'package:sizer/sizer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();


  runApp(Pastify(),

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


