import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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



class Products extends StatefulWidget
{
  final CategorizeData categorizeData;



  int c=0;

  @override
  Products(this.categorizeData,);
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Products(this.categorizeData);
  }
}

class  _Products extends StateMVC<Products>
{
  final CategorizeData categorizeData;
  PageProductController _con ;



  _Products(this.categorizeData) : super(PageProductController(categorizeData)){_con = controller;}
  PageProductController _get(){return _con;}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:
      ListView.builder(
        shrinkWrap: true,
        itemCount: _con.listProduct.length,
        itemBuilder: (context, i) {
          return CardProductWidget(categorizeData: categorizeData,productData: _con.listProduct[i]);
        },
      ) ,
    );
  }

}



