import 'dart:async';
// ignore: avoid_web_libraries_in_flutter



import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:structurepublic/src/elements/cardTrollery.dart';
import 'package:structurepublic/src/models/DemandData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/controler/page_trollery_controller.dart';
import 'package:structurepublic/src/controler/user_controller.dart';
import 'package:structurepublic/src/elements/cardmydemand.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/models/SoldData.dart';
import 'package:structurepublic/src/pages/vereible.dart';
import 'package:structurepublic/src/repository/login_repository.dart';
import 'package:structurepublic/src/repository/page_market_repository.dart' as repo;
import 'package:structurepublic/src/repository/page_faviroty_repository.dart' as repo;
import 'package:structurepublic/src/repository/page_faviroty_repository.dart' as repo;
import 'package:structurepublic/src/repository/page_sold_repository.dart' as repo;
import '../../generated/l10n.dart';
import '../../main.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'editprofil.dart';


class Pagemydemand extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Pageusers();
  }
}

class _Pageusers extends StateMVC<Pagemydemand> {
  PageTrolleryController _con2;

  _Pageusers() : super(PageTrolleryController()) {
    _con2 = controller;
    print("kkkkkkk");
    _con2.getDemand();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    if (_con2.loading == false) {

          return Scaffold(
              appBar: AppBar(
              title: Text(language1=="en" ? "my requests " :" الطلبات "),
    backgroundColor: Theme
        .of(context)
        .primaryColorDark,
    ),
    body:Dialog(
            child: new Container(
              decoration: new BoxDecoration(
                color: Colors.red[200],
                //   borderRadius: new BorderRadius.circular(10.0)
              ),
              width: 150.0,
              height: 100.0,
              alignment: AlignmentDirectional.center,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Center(
                    child: new SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: new CircularProgressIndicator(
                          value: null,
                          strokeWidth: 7.0,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red)
                      ),
                    ),
                  ),
                  new Container(
                    margin: const EdgeInsets.only(top: 25.0),
                    child: new Center(
                      child: new Text(
                        "loading.. wait...",
                        style: new TextStyle(color: Colors.white, fontSize: 20),
                      ),
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
    )
          );



      }

    }
  }


class PageDemand extends StatelessWidget {

  List<DemandData> list = [];

  PageDemand(this.list);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text(language1=="en" ? "my requests " :" الطلبات "),
        backgroundColor: Theme
            .of(context)
            .primaryColorDark,
      ),
      body:

      ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) =>
             CardmydemandWidget(
                  list[index],
                ),
                //  child: Text("4444444444444444444444444444444"),
              ),


    );
  }
}

double _rating=2.0;
class PageDemandBasket extends StatefulWidget {

  DemandData demandData;
  PageDemandBasket(this.demandData);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageDemandBasket(this.demandData);
  }
}


class  _PageDemandBasket extends StateMVC<PageDemandBasket> {
  DemandData demandData;

  _PageDemandBasket(this.demandData);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(language1=="en" ? "my requests " :"طلباتي "),
        backgroundColor: Theme
            .of(context)
            .primaryColorDark,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 30, bottom: 30, right: 15, left: 15),

        child: ListView(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, child:
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

                          Text(demandData.priceTotal.toString(),
                            // demandData.priceTotal.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            language1=="en" ? "SYP" :
                            "ل.س",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),



                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    for (int i = 0; i < demandData.product.length; i = i + 2)
                      CardmydemandDetail(demandData.product[i]),
                    // Text("zzzzzzzzzzzzzzzzzzzzzzz")


                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    for (int i = 1; i < demandData.product.length; i = i + 2)
                      CardmydemandDetail(demandData.product[i]),


                  ],
                ),
              ],
            ),),
            SizedBox(
              height: 70,
            ),
            //
            // if(demandData.rating==0)
            // GestureDetector(
            //   child:  Text(
            // ' تقييم الطلب ',
            // style: TextStyle(
            // fontWeight: FontWeight.w300,
            // fontSize: 24.0,
            //
            // ),
            // ),
            //   onTap: () {
            //     _onLoadingDialog();
            //   },
            // ),

            SizedBox(
              height: 35,
            ),
if(demandData.rating!=0)
            RaisedButton(
              onPressed: () {
                _onLoadingVerifty();
              },

              color: Theme
                  .of(context)
                  .primaryColorDark,
              padding: EdgeInsets.symmetric(horizontal: 50),
              elevation: 2,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text(language1=="en" ? "Resend" :
                "إرسال الطلب ",
                style: TextStyle(
                    fontSize: 17,
                    letterSpacing: 2.2,
                    color: Colors.white),
              ),
            ),
            if(demandData.rating==0)
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [



    RaisedButton(
      onPressed: () {
        // clear();
        _onLoadingVerifty();
      },

      color: Theme
          .of(context)
          .primaryColorDark,
      padding: EdgeInsets.symmetric(horizontal: 50),
      elevation: 2,

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        language1=="en" ? "Resend" :
        "إرسال الطلب ",
        style: TextStyle(
            fontSize: 12,
            letterSpacing: 2.2,
            color: Colors.white),
      ),
    ),

    RaisedButton(
      onPressed: () {
        _onLoadingDialog();
      },

      color: Theme
          .of(context)
          .primaryColorDark,
      padding: EdgeInsets.symmetric(horizontal: 50),
      elevation: 2,

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        language1=="en" ? "Rating" :
        "تقييم الطلب",
        style: TextStyle(
            fontSize: 12,
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
                    child: Center(child:new Text(   language1=="en" ? "Do you want to send? " : "هل تريد تأكيد عملية إرسال الطلب ؟ ",textDirection: TextDirection.rtl,style: TextStyle(fontSize: 20,color: Theme.of(context).primaryColor),
                    ),)
                ),

                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    RaisedButton(
                      onPressed: () {
                        // globalKey.currentState.showSnackBar(_snackBar1);
                        getReturnDemand(demandData);
                        print("UUUUUUUUUUUUUU");
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

  Widget _onLoadingDialog() {
    var _ratingController;
    double _userRating = 3.0;
    int _ratingBarMode = 1;
    double _initialRating = 2.0;
    bool _isRTLMode = false;
    bool _isVertical = false;

    // _ratingController = TextEditingController(text: '3.0');
    // _rating = _initialRating;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context)
    {
      return StatefulBuilder(builder: (context, StateSetter setState) {
        return
          Dialog(
            child: new Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.circular(10.0)),
              width: 200.0,
              height: 300.0,
              alignment: AlignmentDirectional.center,
              child: Directionality(
                textDirection: _isRTLMode ? TextDirection.rtl : TextDirection
                    .ltr,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        language1=="en" ? "Please rate the order" :
                        'من فضلك قييم الطلب ',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 24.0,
                            color: Colors.black
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      FlutterRatingBar(
                          initialRating: _rating,
                          // direction: _isVertical ? Axis.vertical : Axis.horizontal,
                          itemCount: 5,

                          allowHalfRating: true,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          fullRatingWidget: Icon(
                            Icons.sentiment_very_satisfied,
                            color: Colors.green,
                          ),
                          halfRatingWidget: Icon(
                            Icons.sentiment_neutral,
                            color: Colors.amber,
                          ),
                          noRatingWidget: Icon(
                            Icons.sentiment_dissatisfied,
                            color: Colors.redAccent,
                          ),

                          // itemBuilder: (context, index) {
                          //   switch (index) {
                          //     case 0:
                          //       return Icon(
                          //         Icons.sentiment_very_dissatisfied,
                          //         color: Colors.red,
                          //       );
                          //     case 1:
                          //       return Icon(
                          //         Icons.sentiment_dissatisfied,
                          //         color: Colors.redAccent,
                          //       );
                          //     case 2:
                          //       return Icon(
                          //         Icons.sentiment_neutral,
                          //         color: Colors.amber,
                          //       );
                          //     case 3:
                          //       return Icon(
                          //         Icons.sentiment_satisfied,
                          //         color: Colors.lightGreen,
                          //       );
                          //     case 4:
                          //       return Icon(
                          //         Icons.sentiment_very_satisfied,
                          //         color: Colors.green,
                          //       );
                          //     default:
                          //       return Container();
                          //   }
                          // },

                          // onRatingUpdate: (rating) {
                          //
                          //  //  setstat(() {
                          //  //    _rating = rating;
                          //  //  }
                          //  // );
                          //
                          //
                          //
                          // },
                          onRatingUpdate: (rating) {
                            setState(() {
                              _rating = rating;
                            //  Navigator.pop(context);
                            //  _onLoadingDialog();
                              //   Navigator.pop(context);
                              //     Navigator.push(context,MaterialPageRoute(builder: (context) =>PageDemandBasket(demandData)));
                            });
                          }

                      ),

                      SizedBox(height: 20.0),
                      Text(
                        'Rating: $_rating',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          InkWell(child:
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      // Colors.green,
                                      Colors.black38,
                                      Colors.redAccent
                                    ]
                                )
                            ),
                            child: Center(
                              child: Text(language1=="en" ? "Send" :"إرسال التقييم ", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),),
                            ),
                          ),
                            onTap: () {
                              setState(() {
                                setRating(demandData, _rating);
                                Navigator.pop(context);
                              });
                            },
                          ),

                          InkWell(child:
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.black38,
                                      Colors.redAccent
                                    ]
                                )
                            ),
                            child: Center(
                              child: Text(language1=="en" ? "back" :"عودة", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),),
                            ),
                          ),
                            onTap: () {
                              Navigator.pop(context);
                              // setState(() {
                              //   //  _con. getProductsSearch();
                              // });


                            },
                          ),
                        ],),
                    ],
                  ),

                ),
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
      });
    });
          // Widget _heading(String text) => Column(
          //   children: [
          //
          //   ],
          // );


  }

}

