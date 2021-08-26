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

import '../../main.dart';

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
  int count=0;
  @override
  Widget build(BuildContext context) {

    price();
    final globalKey = GlobalKey<ScaffoldState>();

    var _snackBar1 = SnackBar(
      content:  new Center(
        child: Text("تأكد من اتصال بالانترت وحاول مرة أخرى ")
      ),
      backgroundColor: Colors.black26,
      // behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 5),

    );
    // TODO: implement build
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text(   language1=="en" ? "Your Cart" : "سلة المشتريات "),
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
                  //  language1=="en" ? aenglish() :arabic(),
                    //         "ل.س",
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(10),
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[

                          Text(
                            (sum()).toString(),
                           // demandData.priceTotal.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                            ),
                          ),

                          SizedBox(
                            width: 10,
                          ),

                          Text( language1=="en" ? "SYP" :
                          "ل.س",
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


            GestureDetector(child:
            Container(
              //width: 10,
              height: 40,
              child:
              Row(children: [
                Icon(Icons.sentiment_satisfied,color: Theme.of(context).primaryColorDark,),
                SizedBox(width: 10,),
                Text(   language1=="en" ? "Add voucher" : "إدخال كود الحسم ",style: TextStyle(fontSize: 15,color: Theme.of(context).primaryColor)),
              ],),

              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColorDark),
                borderRadius:BorderRadius.circular(20),

              ),
            ),

                onTap: () {
              if(_controller.coupon==0 && d.product.length!=0)
                  {  print(d.product.length);
                  print("ppppppppppppppppppppppppppppppppppp");
                    _onLoadingVeriftyCode(d.product);
                  }

              if(d.product.length==0)
                {
                  _onLoadingErroe();
                  print("`````````````````````````````````");}
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => PageSearch()) );//basic
                //  Navigator.push(context, MaterialPageRoute(builder: (context) => PageSearch()));
                }
            ),
            // Container(
            //   height: 100,
            //   width: MediaQuery.of(context).size.width,
            //   child: TextFormField(
            //     // onChanged: (value) {
            //     //  // filterSearchResults(value);
            //     // },
            //     controller:_controller.discount,
            //     decoration: InputDecoration(
            //       hintText: "Enter the discount code ... ",
            //       suffixIcon: Icon(Icons.sentiment_satisfied),
            //     ),
            //   ),
            // ),
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
                    _onLoadingVerifty();
                   // globalKey.currentState.showSnackBar(_snackBar1);
                 //    if(_controller.discount.text!='')
                 //      {_controller.getCode();}
                 //    if(_controller.discount.text=='')
                 // {clear();
                 //   _controller.getBasket();
                 //   print("UUUUUUUUUUUUUU");}
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



    Widget _onLoadingVerifty() {

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: new Container(
              decoration: new BoxDecoration(
                color: Colors.black12,
                //   borderRadius: new BorderRadius.circular(10.0)
              ),
              width: 1000.0,
              height: 180.0,
              alignment: AlignmentDirectional.center,
              child: new Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 35,),
                  new SizedBox(
                    // height: 200.0,
                      width: 900.0,
                      child: Center(child:new Text(   language1=="en" ? "Do you want to send ? " : "هل تريد تأكيد عملية إرسال الطلب ؟ ",textDirection: TextDirection.rtl,style: TextStyle(fontSize: 20),
                      ),)
                  ),

                  SizedBox(height: 20,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [

                   RaisedButton(
                     onPressed: () {
                       // globalKey.currentState.showSnackBar(_snackBar1);
                       Navigator.pop(context);
                       // if(_controller.discount.text!='')
                       // {
                       //   print("coooooooooooooooooooooooooooooooooode");
                       //   _controller.getCode();
                       //
                       // }

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
                       language1=="en" ? "Yes" : "تأكيد",
                       style: TextStyle(
                           fontSize: 14,
                           letterSpacing: 2.2,
                           color: Colors.white),
                     ),
                   ),
                   OutlineButton(
                     padding: EdgeInsets.symmetric(horizontal: 50),
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(20)),
                     onPressed: () {    Navigator.of(context).pop();},
                     child: Text(   language1=="en" ? "back" : "عودة",
                         style: TextStyle(
                             fontSize: 14,
                             letterSpacing: 2.2,
                             color: Colors.black)),
                   ),
                 ],)
                ],
              ),
            ),
            // new Row(
            //   mainAxisSize: MainAxisSize.max,
            //   children: [
            //     new CircularProgressIndicator(),
            //     SizedBox(width: 5,),
            //     new Text("Loading"),
            //   ],
            // ),
          );
        },
      );
      new Future.delayed(new Duration(seconds: 5), () {
        //  Navigator.pop(context);
        // Navigator.pop(context);
        // if (!loading) {
        //     // Navigator.pop(context); //pop dialog
        // }


      });
    }



    Widget _onLoadingErroe() {

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: new Container(
              decoration: new BoxDecoration(
                color: Colors.black12,
                //   borderRadius: new BorderRadius.circular(10.0)
              ),
              width: 1000.0,
              height: 80.0,
              alignment: AlignmentDirectional.center,
              child: new Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 35,),
                  new SizedBox(
                    // height: 200.0,
                      width: 900.0,
                      child: Center(child:new Text(   language1=="en" ? "Try again" : "حاول مرة أخرى  ",textDirection: TextDirection.rtl,style: TextStyle(fontSize: 20),
                      ),)
                  ),

                  SizedBox(height: 20,),
                ],
              ),
            ),
            // new Row(
            //   mainAxisSize: MainAxisSize.max,
            //   children: [
            //     new CircularProgressIndicator(),
            //     SizedBox(width: 5,),
            //     new Text("Loading"),
            //   ],
            // ),
          );
        },
      );
      new Future.delayed(new Duration(seconds: 5), () {
        //  Navigator.pop(context);
        // Navigator.pop(context);
        // if (!loading) {
        //     // Navigator.pop(context); //pop dialog
        // }


      });
    }

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    Widget _onLoadingVeriftyCode(List<Product>p) {

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: new Container(
              decoration: new BoxDecoration(
                color: Colors.black12,
                //   borderRadius: new BorderRadius.circular(10.0)
              ),
              width: 1000.0,
              height: 220.0,
              alignment: AlignmentDirectional.center,
              child: new Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 35,),


                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      // onChanged: (value) {
                      //  // filterSearchResults(value);
                      // },
                      controller:_controller.discount,
                      decoration: InputDecoration(
                        hintText:    language1=="en" ? "Add voucher" :"أدخل كود  الحسم ",
                        suffixIcon: Icon(Icons.sentiment_satisfied,color:Colors.red[200],),
                          focusedBorder:
                          UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                  Colors.black38)),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black38))
                      ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Fill Code Input';
                          }
                          return null;
                        }
                    ),
                  ),


                  RaisedButton(
                    onPressed: () {


                        // globalKey.currentState.showSnackBar(_snackBar1);
                        Navigator.pop(context);
                        if (_controller.discount.text!= '') {
                          print("coooooooooooooooooooooooooooooooooode");
                          _controller.getCode(p);
                        }

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
                      language1=="en" ? "confirm" :
                      "تحقق",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            // new Row(
            //   mainAxisSize: MainAxisSize.max,
            //   children: [
            //     new CircularProgressIndicator(),
            //     SizedBox(width: 5,),
            //     new Text("Loading"),
            //   ],
            // ),
          );
        },
      );
      new Future.delayed(new Duration(seconds: 5), () {
        //  Navigator.pop(context);
        // Navigator.pop(context);
        // if (!loading) {
        //     // Navigator.pop(context); //pop dialog
        // }


      });
    }





}
