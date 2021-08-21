import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/elements/cardProductDetail.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/pages/marketView.dart';
import 'package:structurepublic/src/pages/pageFavority.dart';
import 'package:structurepublic/src/pages/productDetail.dart';

import 'cardmarketWidget.dart';
import 'package:intl/intl.dart';
class CardFavoriteWidget extends StatelessWidget {
 final ProductData productData;
  CategorizeData categorizeDataa=CategorizeData();

   CardFavoriteWidget( {Key key,this.productData}) : super(key: key);



// تستبدل بكلاس خاص بالمفضلة


  @override
  Widget build(BuildContext context) {

    // return ShapeOfView(
    //   shape: PolygonShape(
    //       numberOfSides: 9
    //   ),
    //   child:Expanded(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Row(children: [
    //           Container(
    //             height: 100,
    //             // width:60,
    //             // margin: EdgeInsets.only(top:12.0,left: 6.0,right: 6.0,bottom: 6.0),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(8.0),
    //               // image: DecorationImage(
    //               // //  image: new ExactAssetImage("image/3.jpg"),
    //               //   //  image:
    //               //   fit: BoxFit.cover,
    //               // ),
    //             ),
    //             child: Image.asset(
    //               "assets/img/3.jpg",
    //               fit: BoxFit.cover,
    //               // width: 125,
    //               // height: 50,
    //             ),
    //           ),
    //         ]),
    //         Row(children: [
    //           Container(
    //             margin: EdgeInsets.only(left: 15),
    //
    //             child: Center(
    //               child: Text(
    //                 "همبرغر بالجبنة",
    //                 style: TextStyle(
    //                   fontSize: 15,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ]),
    //       ],
    //     ),
    //   ) ,
    // );
  //  categorizeData.id = productData.id_categorize;
      return Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                children: [

                  InkWell(
                child:  Container(

                  //    width:110,
                  margin: EdgeInsets.only(left: 6.0,right: 6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),

                  ),
                  child: Image(image:CachedNetworkImageProvider(productData.image),fit: BoxFit.cover,width: 125, height: 100,),
                ),
                onTap: (){
                  categorizeDataa.id = productData.id_categorize;
                  print("bbbbbbbbbbbbbbbbbbb"  + productData.id_categorize);
                  print("aaaaaaaaaaaaaaaaaaaa"  + categorizeDataa.id);
                  // var now = new DateTime.now();
                  // var formatter = new DateFormat('yyyy-MM-dd');
                  // String formattedDate = formatter.format(now);
                  // print("aaaaaaaaaaaaaaaaaaaa"  + formattedDate);


                  Navigator.push(context, MaterialPageRoute(builder: (context) => PageFavority(productData)//ProductDetail(productData,categorizeDataa)
                  ));


                  },
              )
            ]),
            Row(children: [
              Container(
                // margin: EdgeInsets.only(left: 15),

                child: Center(
                  child: Text(
                    productData.nameAr,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor
                    ),
                  ),

                ),
              ),

            ]),
          ],

      );

// return Column(
//   mainAxisSize: MainAxisSize.min,
//
//   children: <Widget>[
//
//     Expanded(
//       child: ListView.builder(
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         itemCount: 15,
//         itemBuilder: (BuildContext context, int index) => ShapeOfView(
//              shape: CircleShape(
//                borderColor: Colors.white, //optional
//                borderWidth: 2, //optional
//              ),
//              child:Card(
//           child: Center(child: Text('Dummy Card Text')),
//         ),
//       )),
//     ),
//   ],
// );


    //  return ShapeOfView(
    //    shape: CircleShape(
    //      borderColor: Colors.white, //optional
    //      borderWidth: 2, //optional
    //    ),
    //       child:
    //
    //   GestureDetector(child: Row(
    //     children: [
    //       Expanded(child: Container(
    //        // padding: EdgeInsets.fromLTRB(7, 7, 7, 0),
    //         height:150,
    //         width:MediaQuery
    //             .of(context)
    //             .size
    //             .width,
    //         child: Card(
    //             elevation: 5,
    //             //  color: Colors.orange,
    //             semanticContainer: true,
    //             clipBehavior: Clip.antiAliasWithSaveLayer,
    //             child: Column(children: [
    //               new SizedBox(
    //                 height: 80,
    //                 width: MediaQuery
    //                     .of(context)
    //                     .size
    //                     .width,
    //               //   child:Image.network('https://dbq8hrmshvuto.cloudfront.net/a2d/f98c8/0803/4c93/9ebe/05596a8ed7a9/normal/516995.jpg',fit: BoxFit.cover,),
    //                    child:Image(image:AssetImage("assets/img/3.jpg"),fit: BoxFit.cover,),
    //
    //               ),
    //               Expanded(child:Center(child:
    //               Text("همبرغر بالجبنة", style: TextStyle(
    //                     fontSize: 10, fontWeight: FontWeight.bold),),
    //                 //  subtitle: Text(productData.description_ar  ?? " "),
    //               )
    //
    //
    //               )
    //
    //
    //             ],
    //
    //             )
    //
    //         ),
    //
    //
    //       )
    //       ),
    //
    //     ]
    // ),
    //   onTap: () {
    //     //  Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetail(productData,categorizeData)) );
    //
    //     // navigetor("");
    //   }
    //   ),
    // );




  }
}


