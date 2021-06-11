import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/models/SoldData.dart';
import 'package:structurepublic/src/repository/page_market_repository.dart' as repo;

import 'package:structurepublic/src/repository/page_sold_repository.dart' as repo;
import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PageSoldController extends ControllerMVC {
  //User user = new User();
  bool loading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  List<SoldData> listSold = [];
  PageSoldController() {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }


  @override
  void initState() {
    super.initState();
    getSold();
  }

  getSold() async {
    setState((){
      listSold .clear();
    });
    await repo.getSold().then((value) {
      setState((){
        listSold.addAll(value);
        for(int i=0 ; i  < listSold.length ; i++)
          listSold[i].index=i;
      }
      );
    });



  }
}
