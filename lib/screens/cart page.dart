import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pastify/screens/products%20page.dart';
import 'package:sizer/sizer.dart';

import '../constant.dart';
import '../homepagepastify.dart';
import '../services/firebase services.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final FirebaseServices _firebaseServices = FirebaseServices();

  final _controller = TextEditingController();

  void _currentLocation() {
    final location = _controller.text;

    FirebaseFirestore.instance
        .collection('UsercurrentLocation')
        .add({'Location': location});
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder:(context, orientation, deviceType){
        return Scaffold(
          appBar: AppBar(
            title: const Text('Your Cart'),
          ),
          body: Stack(
            children: [
              FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  future: _firebaseServices.usersRef
                      .doc(_firebaseServices.getUserId())
                      .collection('Cart')
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Scaffold(
                        body: Center(
                          child: Text('Error: ${snapshot.error}'),
                        ),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView(
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 12.0,
                        ),
                        children: snapshot.data!.docs.map((document) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductPage(
                                    productId: document.id,
                                  ),
                                ),
                              );
                            },
                            child: FutureBuilder<
                                DocumentSnapshot<Map<String, dynamic>>>(
                              future: _firebaseServices.productsRef
                                  .doc(document.id)
                                  .get(),
                              builder: (context, productSnap) {
                                final _productMap = productSnap.data?.data();

                                if (productSnap.hasError) {
                                  return Center(
                                    child: Text('${productSnap.error}'),
                                  );
                                }

                                if (productSnap.connectionState ==
                                    ConnectionState.done) {
                                  return Column(
                                    children: [
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 16.0,
                                            horizontal: 24.0,
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 90,
                                                    height: 90,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                      child: Image.network(
                                                        "${_productMap!['images'][0]}",
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets.only(
                                                      left: 16.0,
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "${_productMap['name']}",
                                                          style: const TextStyle(
                                                              fontSize: 18.0,
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.w600),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .symmetric(
                                                            vertical: 4.0,
                                                          ),
                                                          child: Text(
                                                            "${_productMap['price']} gh",
                                                            style: const TextStyle(
                                                                fontSize: 16.0,
                                                                color: Colors
                                                                    .redAccent,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                          ),
                                                        ),
                                                        Text(
                                                          "Size - ${document.data()['size']}",
                                                          style: const TextStyle(
                                                              fontSize: 16.0,
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.w600),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }

                                return Container(
                                  child: const Center(child: const CircularProgressIndicator()),
                                );
                              },
                            ),
                          );
                        }).toList(),
                      );
                    }

                    return const Scaffold(
                      body: Center(child: CircularProgressIndicator()),
                    );
                  }),
              Positioned(
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context)=> Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 170.0,
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 8.0,
                                          horizontal: 24.0,
                                        ),
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFF2F2F2),
                                            borderRadius: BorderRadius.circular(12.0)

                                        ),
                                        child: TextField(
                                          textInputAction: TextInputAction.done,
                                          controller: _controller,

                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Place of delivery here!!!',
                                              contentPadding: const EdgeInsets.symmetric(
                                                horizontal: 24.0,
                                                vertical: 18.0,
                                              )
                                          ),
                                          style: Constants.regularDarkText,
                                        ),
                                      ),

                                      GestureDetector(
                                        onTap: (){
                                          _currentLocation();

                                          Navigator.push(context, MaterialPageRoute(
                                              builder: (context)=> const DonePage()
                                          ));
                                        },
                                        child: Container(
                                            height: 50,
                                            width: 90.w,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.black,
                                            ),
                                            child: const Center(
                                              child: const Text(
                                                'Order Now',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              )
                          );



                        },
                        child: Container(
                            height: 50,
                            width: 80.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            child: const Center(
                              child: Text(
                                'Proceed to Order',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
                bottom: 10,
              ),
            ],
          ),
        );
      }
    );
  }
}

/*
class LocationBtn extends StatelessWidget {

  final  _controller =TextEditingController();

  void _currentLocation(){
    final location = _controller.text;


    FirebaseFirestore.instance.collection('currentLocation')
    .add({
      'Location' : location
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50.0,
        bottom: 50,
      ),
      child: Column(
        children: [
          TextField(
            textInputAction: TextInputAction.done,
            controller: _controller,
            decoration: InputDecoration(
                hintText: 'Input your current location for fast delivery',
              prefixIcon: Icon(Icons.my_location_outlined),
            ),


          ),
          Padding(
            padding: const EdgeInsets.only( bottom: 8.0),
            child: ElevatedButton(
                onPressed: (){
                  _currentLocation();

                  Navigator.push(context, MaterialPageRoute(

                      builder: (context)=>DonePage()));

                },
                child: Text('Done')),
          )
        ],
      ),


    );
  }
}
*/

class DonePage extends StatelessWidget {
  const DonePage({Key? key}) : super(key: key);

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
                    image: const DecorationImage(
                        image: AssetImage(''))),
              ),
            ),
          ),
          const Text(
            'Your Products will be delivered to you as soon as Possible Thank You.',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          ElevatedButton(
            child: const Text('Back to Home'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePagePastify()));
            },
          )
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
                        child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                          future: _firebaseServices.productsRef.doc(document.id).get(),
                          builder: (context, productSnap){


                            final _productMap = productSnap.data?.data();

                           if(productSnap.hasError){
                             return Center(
                               child: Text(
                                 '${productSnap.error}'
                               ),
                             );
                           }

                           if(productSnap.connectionState == ConnectionState.done){

                             return Padding(
                               padding: const EdgeInsets.symmetric(
                                 vertical: 16.0,
                                 horizontal: 24.0,
                               ),
                               child: Row(
                                 mainAxisAlignment:
                                 MainAxisAlignment.start,
                                 children: [
                                   Container(
                                     width: 90,
                                     height: 90,
                                     child: ClipRRect(
                                       borderRadius:
                                       BorderRadius.circular(8.0),
                                       child: Image.network(
                                         "${_productMap!['images'][0]}",
                                         fit: BoxFit.cover,
                                       ),
                                     ),
                                   ),
                                   Container(
                                     padding: EdgeInsets.only(
                                       left: 16.0,
                                     ),
                                     child: Column(
                                       mainAxisAlignment:
                                       MainAxisAlignment.start,
                                       crossAxisAlignment:
                                       CrossAxisAlignment.start,
                                       children: [
                                         Text(
                                           "${_productMap['name']}",
                                           style: TextStyle(
                                               fontSize: 18.0,
                                               color: Colors.black,
                                               fontWeight:
                                               FontWeight.w600),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets
                                               .symmetric(
                                             vertical: 4.0,
                                           ),
                                           child: Text(
                                             "\$${_productMap['price']}",
                                             style: TextStyle(
                                                 fontSize: 16.0,
                                                 color: Colors.redAccent,
                                                 fontWeight:
                                                 FontWeight.w600),
                                           ),
                                         ),
                                         Text(
                                           "Size - ${document.data()['size']}",
                                           style: TextStyle(
                                               fontSize: 16.0,
                                               color: Colors.black,
                                               fontWeight:
                                               FontWeight.w600),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                             );


                           }

                           return Container(
                             child: Center(child: CircularProgressIndicator()),

                           );
                          },
                        ),
                      );
 */
