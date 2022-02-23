import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pastify/constant.dart';
import 'package:pastify/screens/products%20page.dart';
import 'package:pastify/widget/product%20card.dart';

import '../services/firebase services.dart';
import '../widget/custom input.dart';


class SearchTab extends StatefulWidget {


  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  FocusNode nodeFirst = FocusNode();

  FirebaseServices _firebaseServices = FirebaseServices();

  String _searchString = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [

          if(_searchString.isEmpty)
            Center(
              child: Container(
                  child:
                  Text('Search Results', style: Constants.regularDarkText,
                  )
              ),
            )

          else FutureBuilder<QuerySnapshot>(

              future: _firebaseServices.productsRef.orderBy('search_string')
                  .startAt([_searchString])
                   .endAt(['$_searchString\uf8ff'])
                  .get(),
              builder: (context, snapshot){
                if(snapshot.hasError){
                  return Scaffold(
                    body: Center(child: Text('Error: ${snapshot.error}'),),
                  );
                }


                if(snapshot.connectionState == ConnectionState.done){
                  return ListView(
                    padding: EdgeInsets.only(
                      top: 120,
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


          Padding(
            padding: const EdgeInsets.only(
              top: 42,
            ),
            child: CustomInput(
              onChanged: (String ) {  },
              focusNode: nodeFirst,
              hintText: 'Search Here',
              textInputAction: TextInputAction.search,
              isPasswordField: false,
              onSubmitted: (value ) {
                setState(() {
                    _searchString = value.toLowerCase();
                  });
                  }
              ,),
          ),



        ],
      )
    );
  }
}
