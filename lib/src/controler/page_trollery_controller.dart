import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/controler/user_controller.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/DemandData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/models/SoldData.dart';
import 'package:structurepublic/src/repository/login_repository.dart';

import 'package:structurepublic/src/repository/page_trollery_repository.dart' as repo;

import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PageTrolleryController extends ControllerMVC {
  //User user = new User();
  bool loading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  int z;
  List<DemandData> listmydam = [];

  // final CategorizeData categorizeData;
  PageTrolleryController() {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }



  @override
  void initState() {
    super.initState();

    getdemand();

  }

  getdemand() async {
    setState((){
      listmydam.clear();
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userid = preferences.getString('userID');
    await repo.gettollery(userid).then((value) {
      setState((){
        listmydam.addAll(value);
        print("Llllllllllllllllllllllllllllllllllllllll");
        print(listmydam.length.toString() + "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
        for(int i=0 ; i  < listmydam.length ; i++){
          listmydam[i].index=i;
        }
      }



      );

    });



  }








}