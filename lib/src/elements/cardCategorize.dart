import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/controler/page_market_controller.dart';
import 'package:structurepublic/src/controler/page_product_controller.dart';
import 'package:structurepublic/src/elements/cardProduct.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/pages/productsView.dart';


// ignore: must_be_immutable
class CardCategorizeWidget extends StatelessWidget {

   const CardCategorizeWidget({Key key,this.categorizeData}) : super(key: key);


  final CategorizeData categorizeData;


  @override
  Widget build(BuildContext context) {

    // return Container(
    //         padding: EdgeInsets.all(10),
    //         width:140,
    //   //height: 10,
    //   decoration:BoxDecoration(
    //     color: Colors.black12,
    //   ),
    //         child:GestureDetector(
    //          //   child: Text(categorizeData.nameAr,style: TextStyle(),),
    //              child: Text(categorizeData.nameAr,style: TextStyle(),),
    //             onTap: (){
    //                  z=1;
    //               CategorizeDetail(categorizeData,z);
    //               //Navigator.push(context, MaterialPageRoute(builder: (context) =>CategorizeDetail(categorizeData)) );
    //
    //
    //             }
    //         ),
    //
    //       //  decoration: _decoration1,
    //       );

    // return new Card(
    //   elevation: 2.0,
    //
    //   //color: Colors.redAccent,
    //   child: new InkWell(
    //     highlightColor: Colors.white.withAlpha(30),
    //     splashColor: Colors.white.withAlpha(20),
    //     child: new Column(
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         mainAxisSize: MainAxisSize.min,
    //         verticalDirection: VerticalDirection.down,
    //         children: <Widget>[
    //           Container(
    //
    //             child:  Center(
    //               child:  Text(categorizeData.nameAr ,style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold),),
    //             ),
    //             decoration: BoxDecoration(
    //               image: DecorationImage(
    //                 image: new NetworkImage("https://j-point.net/web/files/products/393/images/NBHD_4.jpg"),
    //                 fit: BoxFit.fitWidth,
    //                 alignment: Alignment.topCenter,
    //               ),
    //             ),
    //           ),
    //
    //
    //          // new Image(image: new AssetImage(item.iconUri)),
    //
    //         ]),
    //     onTap: () {
    //       Navigator.push(context, MaterialPageRoute(builder: (context) =>CategorizeDetail(categorizeData)) );
    //       //  _tappedCategoryCell(item.routeName);
    //     },
    //   ),
    // );

    return  Container(
      height: MediaQuery.of(context).size.height,
      width: 200,
      child:
      Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child:  GestureDetector(child: Container(
          child:
          Center(
            child: RaisedButton(
              onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) =>Products(categorizeData)) );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),),
              padding: EdgeInsets.all(0.5),
              color: Colors.white70,
              child: Container(
                  constraints:
                  BoxConstraints(maxWidth: 100.0, minHeight: 40.0,maxHeight: 50),
                  alignment: Alignment.center,
                  child: Text(
                    categorizeData.nameAr,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),

                ),

              // Ink(
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       color: Colors.white70,
              //       style: BorderStyle.solid,
              //       width: 1.0,
              //     ),
              //     borderRadius: BorderRadius.circular(30.0),
              //     color: Colors.orangeAccent,//pink
              //   ),
              //   child: Container(
              //     constraints:
              //     BoxConstraints(maxWidth: 100.0, minHeight: 40.0,maxHeight: 50),
              //     alignment: Alignment.center,
              //     child: Text(
              //       categorizeData.nameAr,
              //       textAlign: TextAlign.center,
              //       style: TextStyle(color: Colors.white, fontSize: 15),
              //     ),
              //
              //   ),
              //
              // ),

            ),
          ),




          decoration: BoxDecoration(
            image: DecorationImage(
              image:  CachedNetworkImageProvider(categorizeData.image),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
          onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>Products(categorizeData)) );

          },
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),

      ),
    );
  }
}
