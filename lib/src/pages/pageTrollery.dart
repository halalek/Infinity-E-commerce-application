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
import 'package:structurepublic/src/controler/page_trollery_controller.dart';
import 'package:structurepublic/src/elements/cardProductDetail.dart';
import 'package:structurepublic/src/elements/cardTrollery.dart';
import 'package:structurepublic/src/elements/cardmarketWidget.dart';
import 'package:structurepublic/src/models/DemandData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/pages/vereible.dart';

//import 'package:structurepublic/src/repository/page_trollery_repository.dart';


//
//   class pageTrollery extends StatefulWidget {
//   //final CategorizeData categorizeData;
//
//
//
//
//
//
//   State<StatefulWidget> createState() {
//   // TODO: implement createState
//   return _pageTrollery();
//   }
//   }
//
//   class _pageTrollery extends StateMVC<pageTrollery> {
//
//   _pageTrollery();
//
//    int n;
//   var _snackBar2 = SnackBar(
//     content: Center(
//
//
//
//               child: Text('يتم إرسال الطلب ',style: TextStyle(fontSize:25), ),
//
//
//
//
//         ),
//     backgroundColor: Colors.black26,
//     behavior: SnackBarBehavior.floating,
//     duration: const Duration(seconds: 5),
//
//   );
//   @override
//   Widget build(BuildContext context) {
//
//     price();
//
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(""),
//         backgroundColor: Theme.of(context).primaryColor,
//       ),
//       body:Container(
//         margin: EdgeInsets.only(top: 30, bottom: 30, right: 15, left: 15),
//
//         child: ListView(
//           children: <Widget>[
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,child :
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//
//                 Column(
//                   children: <Widget>[
//                     Container(
//                       alignment: Alignment.centerRight,
//                       padding: EdgeInsets.all(10),
//                       width: 150,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             "ل.س",
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                          /* RaisedButton(
//                             onPressed: () {
//                               setState(() {
//                                 sum();
//                               });
//
//                             },
//
//                             color: changecolor,
//                             padding: EdgeInsets.symmetric(horizontal: 50),
//                             elevation: 2,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(1)),
//                             child: Text(
//                                (sum()).toString(),
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   letterSpacing: 2.2,
//                                   color: Colors.white),
//                             ),
//                           ),*/
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text( (sum()).toString(),
//                            // demandData.priceTotal.toString(),
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.green,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//
//                     for (int i = 0; i < d.product.length; i=i+2)
//                       cardTrolleryWidget(d.product[i]),
//
//
//                   ],
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//
//                     for (int i = 1; i < d.product.length; i=i+2)
//                       cardTrolleryWidget(d.product[i]),
//
//
//                   ],
//                 ),
//               ],
//             ),),
//             SizedBox(
//               height: 50,
//             ),
//             SizedBox(
//               height: 35,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 OutlineButton(
//                   padding: EdgeInsets.symmetric(horizontal: 50),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20)),
//                   onPressed: () {    Navigator.of(context).pop();},
//                   child: Text("CANCEL",
//                       style: TextStyle(
//                           fontSize: 14,
//                           letterSpacing: 2.2,
//                           color: Colors.black)),
//                 ),
//
//
//                 RaisedButton(
//                   onPressed: () {
//                    clear();
//
//                    print("UUUUUUUUUUUUUU");
//                    print(d);
//                    print("UUUUUUUUUUUUUU");
//                    postDamandNode(d);
//
//                    settollery(d);
//                   // Scaffold.of(context).showSnackBar(_snackBar2);
//                    d = new DemandData();
//                    d.product=[];
//                    tt=[];
//                    total=0;
//                   },
//
//                   color: changecolor,
//                   padding: EdgeInsets.symmetric(horizontal: 50),
//                   elevation: 2,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20)),
//                   child: Text(
//                     "SAVE",
//                     style: TextStyle(
//                         fontSize: 14,
//                         letterSpacing: 2.2,
//                         color: Colors.white),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//
//
//   }
//   void minus() {
//     setState(() {
//       sum();
//     });
//   }
// }




  class pageTrollery extends StatefulWidget {
  State<StatefulWidget> createState() {
  // TODO: implement createState
  return _pageTrollery();
  }
  }

  class _pageTrollery extends StateMVC<pageTrollery> {
    PageTrolleryController _controller;
  _pageTrollery():super(PageTrolleryController(),) {
    _controller = controller;

  }

   int n;
  @override
  Widget build(BuildContext context) {

    price();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("سلة المشتريات "),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body:Container(
        margin: EdgeInsets.only(top: 30, bottom: 30, right: 15, left: 15),

        child: ListView(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,child :
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(10),
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "ل.س",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                         /* RaisedButton(
                            onPressed: () {
                              setState(() {
                                sum();
                              });

                            },

                            color: changecolor,
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1)),
                            child: Text(
                               (sum()).toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.white),
                            ),
                          ),*/
                          SizedBox(
                            width: 10,
                          ),
                          Text( (sum()).toString(),
                           // demandData.priceTotal.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    for (int i = 0; i < d.product.length; i=i+2)
                      cardTrolleryWidget(d.product[i]),


                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    for (int i = 1; i < d.product.length; i=i+2)
                      cardTrolleryWidget(d.product[i]),


                  ],
                ),
              ],
            ),),
            SizedBox(
              height: 70,
            ),

            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: TextField(
                onChanged: (value) {
                 // filterSearchResults(value);
                },
                controller:_controller.discount,
                decoration: InputDecoration(
                  hintText: "Enter the discount code ... ",
                  icon: Icon(Icons.sentiment_satisfied),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {    Navigator.of(context).pop();},
                  child: Text("CANCEL",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.black)),
                ),


                RaisedButton(
                  onPressed: () {
                   clear();
                   _controller.getBasket();
                   print("UUUUUUUUUUUUUU");
                  //  print(d);
                  //  print("UUUUUUUUUUUUUU");
                  //  postDamandNode(d);
                  //
                  //  settollery(d);
                  // // Scaffold.of(context).showSnackBar(_snackBar2);
                  //  d = new DemandData();
                  //  d.product=[];
                  //  tt=[];
                  //  total=0;
                  },

                  color: changecolor,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );


  }
  void minus() {
    setState(() {
     sum();
    });
  }
}
