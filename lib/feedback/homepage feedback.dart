


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../homepagepastify.dart';

class HomepageFeedBack extends StatelessWidget {

  final  _feedbacks =TextEditingController();

  void _feedback(){
    final feedbacks = _feedbacks.text;


    FirebaseFirestore.instance.collection('feedback')
        .add({
      'FeedBacks' : feedbacks
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 2.0,
        centerTitle: true,
        title: const Text('FeedBack', style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
        ListView(

          children: [
            const SizedBox(height: 10.0,),
            const Text('Please select the type of the feedback',
              style: TextStyle(
                color: Color(0xffc5c5c5),
              ),
            ),
            const SizedBox(height: 25.0,),

            buildCheckItem('Login trouble'),
            buildCheckItem('Personal Profile'),
            buildCheckItem('Other issue'),
            buildCheckItem('Suggestions'),
            const SizedBox(height: 20.0,),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                child: TextField(
                  controller: _feedbacks,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Please briefly describe the issue',
                    hintStyle: TextStyle(
                      fontSize: 13.0,
                      color: Color(0xffc5c5c5),

                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xffe5e5e5)
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0,),

            Center(child:
            ElevatedButton(onPressed: (){
              _feedback();

              Navigator.push(context, MaterialPageRoute(

                  builder: (context)=>DonePageFeedBacks()));

            },

                child:const Text('Send'))),

            const Spacer(),
          ],
        ),
      ),

    );

  }



  buildCheckItem(tittle){
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.blue,),
          const SizedBox(width: 10.0,),

          Text( tittle, style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
          )
        ],
      ),
    );
  }
}



class DonePageFeedBacks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(
              left: 90.0,
              top: 170,
              right: 90.0,
            ),
            child: Center(
              child: Container(
                height: 220,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('')
                    )
                ),
              ),
            ),
          ),

          Text(
            'Your Feedback has been reached, Thank You, We will get to it as soon as possible',
            style: TextStyle(
              fontSize: 25,
            ),
          ),


          ElevatedButton(
            child: Text('Back to Home'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>HomePagePastify())
              );
            },
          )

        ],),
    );
  }
}
