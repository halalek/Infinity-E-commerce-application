import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:structurepublic/src/controler/categorize_controller.dart';
import 'package:structurepublic/src/controler/page_product_controller.dart';
import 'package:structurepublic/src/elements/cardCategorize.dart';
import 'package:structurepublic/src/elements/cardProduct.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/ProductData.dart';

import 'page_Main_View.dart';

List<ProductData> list = [];

// ignore: must_be_immutable
class Comparison extends StatefulWidget {
  ProductData productData;

  Comparison(this.productData);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Comparison(this.productData);
  }
}

class _Comparison extends StateMVC<Comparison> {
  ProductData productData;

  _Comparison(this.productData) : super() {
    if (productData.nameAr != null) {
      list.add(productData);
    }

    if (list.length > 2)
      list.removeAt(0);
  }

  bool select = false;
  int point = 0;
  int pointt = 0;
  int z = 0;

  // _ProductDetail(this.pointt);
  Decoration _decoration1 = BoxDecoration(
    color: Colors.black12,
  );
  Decoration _decoration = BoxDecoration(
    color: Colors.white24,
    border: Border(
      bottom: BorderSide(width: 1),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

        body: SingleChildScrollView(child:Column(

            //shrinkWrap: true,
            children: [

              Text("",style: TextStyle(fontSize: 30),),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [


            InkWell(
              child: Container(
                height: 60,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: [
                        Colors.red[300],
                        Colors.black12,

                      ]
                  )
                ),
                child: Center(
                  child: Text(
                    "اختر المنتج ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => PageMain()));
                });
              },
            ),

            // InkWell(
            //   child: Container(
            //     height: 60,
            //     width: 100,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       // gradient: LinearGradient(
            //       //     colors: [
            //       //       // Color.fromRGBO(143, 148, 251, 1),
            //       //       // Color.fromRGBO(143, 148, 251, .6),
            //       //       // Colors.red[300],
            //       //       // Color.fromRGBO(160, 0, 0, 1),
            //       //
            //       //     ]
            //       // )
            //     ),
            //     child: Center(
            //       child: Text(
            //         "اختر المنتج ",
            //         style: TextStyle(
            //             color: Colors.black,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 20),
            //       ),
            //     ),
            //   ),
            //   onTap: () {
            //     setState(() {
            //       Navigator.pushReplacement(context,
            //           MaterialPageRoute(builder: (context) => PageMain()));
            //     });
            //   },
            // ),

// if(productData.nameAr!=null)
          ]),




              Text("",style: TextStyle(fontSize: 10),),
          SingleChildScrollView(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [

            if (list.length >= 1)
              CardProductcomp(
                productData: list[0],
              ),
            if (list.length == 2)
              CardProductcomp(
              productData: list[1],
            ),


          ]))
        ])));
  }



}
