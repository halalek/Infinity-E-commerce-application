import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/controler/page_product_controller.dart';
import 'package:structurepublic/src/controler/page_sold_controller.dart';
import 'package:structurepublic/src/elements/CardSoldDetail.dart';
import 'package:structurepublic/src/elements/cardFavorite.dart';
import 'package:structurepublic/src/elements/cardProductDetail.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SoldData.dart';


class SoldDetail extends StatefulWidget {

  final SoldData soldData;
  const SoldDetail( this.soldData);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SoldDetail(this.soldData);
  }
}

class _SoldDetail extends StateMVC<SoldDetail>  {
  final SoldData soldData;
  PageSoldController _con;



  _SoldDetail(this.soldData) : super(PageSoldController())
  {
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

                    decoration: BoxDecoration( image:  DecorationImage(image:CachedNetworkImageProvider(soldData.image), fit: BoxFit.cover)),
                    child:
                    CarouselSlider(//_con.listProduct.length
                      items: [
                        // RaisedButton(
                        //   child: Text("hjhjhj"),
                        //   onPressed: () {
                        //     setState(() {
                        //       Navigator.pushReplacement(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (BuildContext context) => CardProductDetailWidget(productData)));
                        //     });
                        //
                        //   },
                        // ),

                        CardSoldDetailWidget(soldData),
                        for( int i= 0   ;i <  _con.listSold.length  ;i++)
                          if(soldData.index !=i)
                            CardSoldDetailWidget(_con.listSold[i]),
                      ],

                      // itemCount: _con.listProduct.length,
                      // itemBuilder:(BuildContext context,int i,int u){
                      //   return CardProductDetailWidget( _con.listProduct[i]) ;
                      // },
                      // items: [0,1,2].map((i) {
                      //   return Builder(
                      //     builder: (BuildContext context) {
                      //       return CardProductDetailWidget( _con.listProduct[i]) ;
                      //     },
                      //   );
                      // }).toList(),

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
