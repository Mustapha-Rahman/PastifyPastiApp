import 'package:flutter/material.dart';
import 'package:pastify/screens/products%20page.dart';


import '../constant.dart';

class ProductCard extends StatelessWidget {
  final String productId;
  final Function onPressed;
  final String imageUrl;
  final String title;
  final String price;
  ProductCard({ required this.productId, required this.onPressed, required this.imageUrl, required this.title, required this.price});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=> ProductPage(
            productId:productId,
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
                    '$imageUrl',
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
                        title,
                        style: Constants.regularHeading,),

                      Text(
                        price,
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
  }
}



