import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/CouponData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/repository/page_market_repository.dart' as repo;
import 'package:structurepublic/src/repository/page_product_repository.dart'  as repo;
import 'package:structurepublic/src/repository/coupon_repository.dart'  as repo;


import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PageCouponController extends ControllerMVC {
  //User user = new User();
  bool loading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  List<CouponData> listCoupon = [];

  PageCouponController() {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }


  @override
  void initState() {
    super.initState();
    getCoupon();
  }

  getCoupon() async {
    setState((){
      listCoupon.clear();
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await repo.getCoupon(preferences.getString('userID')).then((value) {
      setState(() {
        listCoupon.addAll(value);
        for (int i = 0; i < listCoupon.length; i++) {
          if (listCoupon[i].iscoupon == false){
            listCoupon[i].state="active";
          }
          if (listCoupon[i].iscoupon == true){
            listCoupon[i].state="inactive";
          }
        }
      }

      );
    });



  }
}
