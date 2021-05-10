import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/repository/page_market_repository.dart' as repo;
import 'package:structurepublic/src/repository/page_product_repository.dart'  as repo;
import 'package:structurepublic/src/repository/page_categorize_repository.dart'  as repo;


import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PageCategorizeController extends ControllerMVC {
  //User user = new User();
  bool loading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  List<CategorizeData> listCategorize = [];
  final MarketData marketData;
  PageCategorizeController(this.marketData) {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }


  @override
  void initState() {
    super.initState();
    getCategorizes();
  }

  getCategorizes() async {
    setState((){
      listCategorize.clear();
    });
    await repo.getCategorize(this.marketData).then((value) {
      setState((){
        listCategorize.addAll(value);

      }

      );
    });



  }
}
