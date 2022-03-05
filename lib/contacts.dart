

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';


const String _tiktok = 'https://vm.tiktok.com/ZM87e8g8J/';
const String _gmail = 'gmail.com';
const String _whatsapp = 'https://wa.me/+233551597865';



class ContactsUs extends StatelessWidget {
  const ContactsUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context,orientation, deviceType){
      return Scaffold(
          backgroundColor: Colors.white,

          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 10.h,
                      backgroundImage: AssetImage("assets/images/logoo.png"),


                    ),


                    GestureDetector(
                      child: Container(
                          height: 70,
                          width:100.w,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                child: Icon(Icons.phone, size: 30,),
                              ),
                              const Text('Contact Us On +233 551597865'),
                            ],
                          )
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.00),
                      child: GestureDetector(
                        onTap: _gmailURL,
                        child: Container(
                            height:70,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                 CircleAvatar(
                                   radius: 30,
                                   backgroundImage: AssetImage('assets/images/gmailgmail.png'),
                                 ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:8.0),
                                    child: const Text('mustaphaabdulrahman0245@gmail.com'),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: _tiktokURL,
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/images/download.jfif'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: const Text('TikTok'),
                            ),
                          ],
                        )
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: GestureDetector(
                        onTap: _whatsappURL,
                        child: Container(
                            height: 70,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage('assets/images/whatsapp.jpg'),

                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("Whatsapp"),
                                )
                              ],
                            )
                        ),
                      ),
                    ),




                  ],
                ),
              ),
            ),
          )
      );
    });
  }

  void _tiktokURL() async {
    if (!await launch(_tiktok)) throw 'Could not launch $_tiktok';
  }

  void _gmailURL() async {
    if (!await launch(_gmail)) throw 'Could not launch $_gmail';
  }

  void _whatsappURL() async {
    if (!await launch(_whatsapp)) throw 'Could not launch $_whatsapp';
  }
}

