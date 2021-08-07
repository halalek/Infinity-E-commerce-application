import 'dart:async';
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
import 'package:structurepublic/src/repository/login_repository.dart';
import 'package:structurepublic/src/repository/page_market_repository.dart' as repo;
import 'package:structurepublic/src/repository/page_faviroty_repository.dart'  as repo;
import 'package:structurepublic/src/repository/page_faviroty_repository.dart'  as repo;
import 'package:structurepublic/src/repository/page_sold_repository.dart' as repo;
import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'editprofil.dart';


class Pagemydemand extends StatefulWidget
{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Pageusers();
  }
}

class  _Pageusers extends StateMVC<Pagemydemand> {
  PageTrolleryController _con2;

  _Pageusers() : super(PageTrolleryController()) {
    _con2 = controller;
    print("kkkkkkk") ;
  }

  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(


      home: Scaffold(
        appBar: AppBar(
          title: Text("MY Demand"),
          backgroundColor: Theme
              .of(context)
              .primaryColor,

        ),

        /* body: ListView.builder(

          itemCount: _con2.listuser.length,

          itemBuilder: (BuildContext context, int index) => Carduser(user: _con2.listuser[index],),)*/
        body: ListView.builder(
          // shrinkWrap: true,
          itemCount:_con2.listmydam.length,

          itemBuilder: (context, i) {
            print(";;;;;;;;;;;;;;;;;;;;;;;;sggggggah") ;
            print(_con2.listmydam.length) ;
            print("heeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffff") ;
            return CardmydemandWidget(_con2.listmydam[i]);
          },
        ),
      ),
    );
  }
}