import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/repository/page_market_repository.dart' as repo;


import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PageMarketController extends ControllerMVC {
  //User user = new User();
  bool loading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  List<MarketData> listMarket = [];
  final SectionData sectionData;
  PageMarketController(this.sectionData) {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }


  @override
  void initState() {
    super.initState();
    getMarkets();
  }

getMarkets() async {
    setState((){
      listMarket.clear();
    });
    await repo.getMarket(this.sectionData).then((value) {
      setState((){
print("kkkkkkkkkkkkkkkkkkkk"   + value.length.toString());
        listMarket.addAll(value);

        // for(int i=0;i<listMarket.length;i++)
        // {if(listMarket[i].idSection!=sectionData.id)
        // {listMarket.removeAt(i);}
        // }
      }

      );

      print(listMarket.length.toString() + "444444444444444444444444444444444444444444444");
    });



  }
}
