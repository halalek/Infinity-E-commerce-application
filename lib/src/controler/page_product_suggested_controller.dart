import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/controler/user_controller.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/repository/login_repository.dart';
import 'package:structurepublic/src/repository/page_market_repository.dart' as repo;
import 'package:structurepublic/src/repository/page_faviroty_repository.dart'  as repo;


import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PageSuggestedController extends ControllerMVC {
  //User user = new User();
  bool loading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  int z;
  List<ProductData> listProduct = [];
  // final CategorizeData categorizeData;
  PageSuggestedController() {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }



  @override
  void initState() {
    super.initState();
    getProductSug();

  }

  getProductSug() async {
    setState((){
      listProduct.clear();
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userid = preferences.getString('userID');
    await repo.getFavority(userid).then((value) {
      setState((){
        listProduct.addAll(value);
        print("Llllllllllllllllllllllllllllllllllllllll");
        print(listProduct.length.toString() + "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
        for(int i=0 ; i  < listProduct.length ; i++)
          listProduct[i].index=i;
      }


      );
    });



  }

}