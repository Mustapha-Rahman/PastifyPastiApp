import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../constant.dart';
import '../services/firebase services.dart';
import '../widget/customactionbar.dart';
import '../widget/imageswipe.dart';
import '../widget/product size.dart';


class ProductPage extends StatefulWidget {
  final String productId;
  ProductPage({ required this.productId});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  FirebaseServices _firebaseServices = FirebaseServices();





  String _selectedProductSize = '0';

  Future _addToCart(){
    return _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection('Cart')
        .doc(widget.productId)
        .set({'size' : _selectedProductSize});
  }

  Future _addToSaved(){
    return _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection('Saved')
        .doc(widget.productId)
        .set({'size' : _selectedProductSize});
  }

  final SnackBar _snackBar = SnackBar(content: Text('Product added to cart'),);



  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return Scaffold(
          body: Stack(
            children: [
              FutureBuilder(
                future: _firebaseServices.productsRef.doc(widget.productId).get(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
                  if(snapshot.hasError){
                    return Scaffold(
                      body: Center(child: Text('Error: ${snapshot.error}'),),
                    );
                  }

                  if(snapshot.connectionState == ConnectionState.done){

                    DocumentSnapshot<Object?> documentData = snapshot.data!;
                    List imageList = documentData['images'];
                    List productSizes = documentData['size'];

                    _selectedProductSize =productSizes[0];

                    return ListView(
                      padding: EdgeInsets.all(0),
                      children: [
                        ImageSwipe(imageList: imageList),

                        Padding(
                          padding: const EdgeInsets.only(
                            top: 24.0,
                            left: 24.0,
                            right: 24.0,
                            bottom: 4.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${documentData['name']}',
                                style: Constants.boldHeading,),


                              Text(
                                '${documentData['numberofproductsleft']}',
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.red
                                ) ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 24),
                          child: Text(
                            '${documentData['price']} gh',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 24),
                          child: Text(
                            '${documentData['desc']}', style: TextStyle(
                            fontSize: 24,
                          ),),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 24),
                          child: Text(
                            'Select Size',
                            style: Constants.regularDarkText,),
                        ),
                        ProductSize(productSizes: productSizes,
                          onSelected: (size) {
                            _selectedProductSize = size;
                          },),

                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Row(

                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await _addToSaved();

                                  Scaffold.of(context).showSnackBar(_snackBar);
                                },
                                child: Container(
                                  width : 65,
                                  height :65,
                                  decoration :BoxDecoration(
                                      color: Color(0xFFDCDCDC),
                                      borderRadius: BorderRadius.circular(12.0)
                                  ),
                                  alignment : Alignment.center,
                                  child: Image(
                                    image: AssetImage('assets/images/tab saved.png'),
                                    height: 30.0,
                                  ),
                                ),
                              ),

                              Expanded(
                                child: GestureDetector(
                                  onTap: () async{
                                    await _addToCart();
                                    Scaffold.of(context).showSnackBar(_snackBar);
                                  },
                                  child: Container(
                                    height: 65,
                                    margin: EdgeInsets.only(
                                      left: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text('Add to cart', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }





                  return Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  );


                },

              ),

              CustomActionBar(
                title: 'Products',
                hasBackArrow: true,
                hasTitle: false,
                hasBackground: false,
              )
            ],
          )
      );
    });
  }
}
