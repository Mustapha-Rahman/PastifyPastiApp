

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
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 30.h,
                    width: 40.w,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                          image: const AssetImage(""

                          ),
                          fit: BoxFit.fill,

                        )
                    ),
                  ),


                  GestureDetector(
                    child: Container(
                        height: 9.h,
                        width:100.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.contact_mail, size: 50,),
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
                          height:9.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  height: 6.h,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                      image: DecorationImage(
                                          image: AssetImage('assets/images/gmailgmail.png'),
                                          fit: BoxFit.fill
                                      )
                                  ),
                                ),
                                const Text('pastifycommunity0245@gmail.com'),
                              ],
                            ),
                          )
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: _tiktokURL,
                    child: Container(
                      height: 9.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 100,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                              image: DecorationImage(
                                image: AssetImage('assets/images/download.jfif'),
                                fit: BoxFit.fill
                              )
                            ),
                          ),
                          const Text('TikTok'),
                        ],
                      )
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: GestureDetector(
                      onTap: _whatsappURL,
                      child: Container(
                          height: 9.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 100,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                    image: DecorationImage(
                                        image: AssetImage('assets/images/whatsapp.jpg'),
                                        fit: BoxFit.fill
                                    )
                                ),
                              ),
                              const Text('Whatsapp'),
                            ],
                          )
                      ),
                    ),
                  ),




                ],
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

