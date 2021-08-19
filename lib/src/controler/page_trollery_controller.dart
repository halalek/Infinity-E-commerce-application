import 'dart:async';
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/controler/user_controller.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/DemandData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/pages/mydemand.dart';

import 'package:structurepublic/src/repository/page_trollery_repository.dart'
    as repo;
import 'package:structurepublic/src/repository/page_trollery_repository.dart';

import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

DemandData d = new DemandData();

class PageTrolleryController extends ControllerMVC {
  //User user = new User();
  bool loading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  int z;
  List<DemandData> list = [];
  TextEditingController discount = TextEditingController();

  // final CategorizeData categorizeData;
  PageTrolleryController() {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  @override
  Future<void> initState() async {
    super.initState();
    getDemand();
  }

  getDemand() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await repo
        .gettollery(preferences.getString('userID'))
        .then((value) => setState(() {
              list.addAll(value);
            }));
    for (int i = 0; i < list.length; i++) {
      await repo.getmarket(list[i]).then((value) => list[i].marketData= value);
      print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      print(list[i].product[0].nameAr);
      loading=true;
    }
    print(list.length);
    print("wwwwwwwwwwwwwwwwwwwwwwwwwwww");
    Navigator.pop(context);
     Navigator.push(context, MaterialPageRoute(builder: (context) =>PageDemand(list)) );

  }

  getBasket() async {
    // _onLoading();
    // print(d.toJson());

    repo.postDamandNode(d);
    repo.settollery(d);
    print("444444444444444444444444444");

    d = new DemandData();
    d.product = [];
    clear();
    tt = [];
    total = 0;
  }





  // getdemand() async {
  //   await repo.postDamandNode(d);
  //
  // }

  // getdemand() async {
  //   setState((){
  //     listmydam.clear();
  //   });
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var userid = preferences.getString('userID');
  //   await repo.gettollery(userid).then((value) {
  //     setState((){
  //       listmydam.addAll(value);
  //       print("Llllllllllllllllllllllllllllllllllllllll");
  //       print(listmydam.length.toString() + "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
  //       for(int i=0 ; i  < listmydam.length ; i++){
  //         listmydam[i].index=i;
  //       }
  //     }
  //
  //
  //
  //     );
  //
  //   });
  // }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
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
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red)),
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
        );
      },
    );
    new Future.delayed(new Duration(seconds: 30), () {
      if (!loading) {
        Navigator.pop(context); //pop dialog
        //_onLoadingError();
      }
    });
  }
}

void price() {
  for (int i = 0; i < d.product.length; i++) {
    d.product[i].priceTotal = tt[i] * d.product[i].number;
    // d.product[i].priceTotal +=  d.product[i].number;
  }
}

int clear() {
  for (int i = 0; i < d.product.length; i++) {
    if (d.product[i].number == 0) {
      d.product.removeAt(i);
    }
  }
}

int sum() {
  total = 0;
  for (int i = 0; i < d.product.length; i++) {
    d.priceTotal = total + d.product[i].priceTotal;
    total = d.priceTotal;
  }
  return d.priceTotal;
}


setRating(DemandData demandData,double rate) async{
print(demandData.toJson());
  demandData.rating=rate;
  await repo.setRating( demandData);

}
getReturnDemand(DemandData demandData) async {
  // _onLoading();
  print(demandData.toJson());
  demandData.stateAr = "مرسل";
  demandData.stateEn = "send";
  demandData.id= Uuid().generateV4();
  d.timesTampCreat = DateTime
      .now()
      .microsecondsSinceEpoch;
  repo.postDamandNode(demandData);
   repo.settollery(demandData);
  print("444444444444444444444444444");

  // d = new DemandData();
  // d.product = [];
  // clear();
  // tt = [];
  // total = 0;
}