import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:structurepublic/src/controler/page_favority_controller.dart';
import 'package:structurepublic/src/controler/page_market_controller.dart';
import 'package:structurepublic/src/elements/cardProductDetail.dart';
import 'package:structurepublic/src/elements/cardmarketWidget.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';

class PageFavority extends StatefulWidget
{
   ProductData productData;
 // final SectionData sectionData;
 PageFavority(this.productData);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   // return _PageMarket(this.sectionData);
     return _PageFavority(productData);
  }
}

class  _PageFavority extends StateMVC<PageFavority>
{
  ProductData productData;
 // final SectionData sectionData;
 // PageMarketController _con2;
  PageFavorityController _con;
  _PageFavority(this.productData) : super(PageFavorityController()) {
    _con = controller;
  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
        body: Builder(
          builder: (context) => ListView(
              children: [
                Container(

                    decoration: BoxDecoration( image:  DecorationImage(image: CachedNetworkImageProvider(productData.image), fit: BoxFit.cover)),
                    child:
                    CarouselSlider(//_con.listProduct.length
                      items: [

                        CardProductDetailWidget(productData),
                        for( int i= 0   ;i <  _con.listProductFav.length  ;i++)
                          if(productData.index !=i)
                            CardProductDetailWidget(_con.listProductFav[i]),
                      ],

                      options: CarouselOptions(
                        height:MediaQuery.of(context).size.height ,
                        enlargeCenterPage: true,
                        // autoPlay: true,
                        aspectRatio: 16 / 9,
                        //autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: false,
                        //  autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8,

                      ),

                      //Slider Container properties


                    )

                )


              ]

          ),

        )

    );
  }
}