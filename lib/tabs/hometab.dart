import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pastify/screens/products%20page.dart';

import '../widget/customactionbar.dart';
import '../widget/product card.dart';



class HomeTab extends StatelessWidget {
  final CollectionReference _productsRef =
  FirebaseFirestore.instance.collection('Product');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [

          FutureBuilder<QuerySnapshot>(

              future: _productsRef.get(),
              builder: (context, snapshot){
                if(snapshot.hasError){
                  return Scaffold(
                    body: Center(child: Text('Error: ${snapshot.error}'),),
                  );
                }


                if(snapshot.connectionState == ConnectionState.done){
                  return ListView(
                    padding: EdgeInsets.only(
                      top: 100,
                      bottom: 12.0,
                    ),
                    children: snapshot.data!.docs.map((document) {

                      return ProductCard(

                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=> ProductPage(productId: document.id,),
                          ),
                          );
                        },
                        imageUrl: '${document['images'][0]}',
                        title: "${document['name']}",
                        price: '${document['price']} gh',
                        productId: document.id,
                      );

                    }).toList(),
                  );

                }


                return Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );

              }
          ),

          CustomActionBar(
            hasBackArrow: false,
            title: 'Home',
            hasTitle: true, hasBackground: true,
          ),


        ],
      ),




    );
  }
}

/*

GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=> ProductPage(
                                  productId: document.id,
                              ),
                          ),
                          );
                        },
                        child: Container(
                          height: 350.0,
                          margin: EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 24.0,
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height:350,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.network(
                                    '${document['images'][0]}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${document['name']}',
                                        style: Constants.regularHeading,),

                                      Text(
                                        '${document['price']} gh',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )

                        ),
                      );
*/

