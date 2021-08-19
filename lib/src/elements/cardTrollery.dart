import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/controler/page_market_controller.dart';
import 'package:structurepublic/src/controler/page_trollery_controller.dart';
import 'package:structurepublic/src/models/DemandData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/pages/categorizeView.dart';
import 'package:structurepublic/src/pages/pageTrollery.dart';


import 'cardProductDetail.dart';


int ii=0;

final List<int>t=[];

  // PageMarketController ggg=new  PageMarketController();
  class cardTrolleryWidget extends StatefulWidget {
  const cardTrolleryWidget(this.product);

  final Product product;

  @override
  _cardTrolleryWidgetState createState() {
  return _cardTrolleryWidgetState(this.product);

  }
  }

  class _cardTrolleryWidgetState extends StateMVC<cardTrolleryWidget> {
  _cardTrolleryWidgetState(this.product);


  final Product product;


  @override
  Widget build(BuildContext context) {

   price();
   print("\n::::::::::::::\n");



return Container(
      width: 160,

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        color: Colors.white70,
        margin: EdgeInsets.all(4),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          margin: EdgeInsets.only(left: 10,right: 10),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),

                Container(
                  alignment: Alignment.topLeft,

                  child: Text(

                    (product.priceTotal).toString(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.black26,
                ),
                SizedBox(
                  height: 5,
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  backgroundImage: CachedNetworkImageProvider(
                    product.image,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  product.nameAr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20,color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
               Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child:
                  Row(
                  //mainAxisAlignment: MainAxisAlignment.end,
                //  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     MaterialButton(
                      onPressed :addd,
                       minWidth: 10.0,
                       child: new Icon(Icons.add, color: Colors.black,),
                      // backgroundColor: Colors.white,
                    ),

                     Text( product.number.toString(),
                       style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),

                   MaterialButton(
                     minWidth: 10.0,
                      onPressed :minus,
                      child: new Icon(
                          const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                          color: Colors.black,),
                      //   backgroundColor: Colors.white,
                    ),
                  ],
                ),
          //),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.grey,
                ),

                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void addd() {
    setState(() {
      product.number++;
      price();
     sum();
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed('/d');
    });
  }

  void minus() {
    setState(() {
      if (product.number != 0)
        product.number--;
     price();
      sum();
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed('/d');
    });
  }


}













