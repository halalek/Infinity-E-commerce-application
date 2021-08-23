import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/repository/page_chat_user_repository.dart' as repo;


import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PageChatUserController extends ControllerMVC {
  //User user = new User();
  bool loading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  List<MarketData> listMarket = [];
  ageChatUserController() {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }


  @override
  void initState() {
    super.initState();
    getAdminMarkets();
  }

  getAdminMarkets() async {
    setState((){
      listMarket.clear();
    });
    await repo.getAdminMarket().then((value) {
      setState((){
        print("kkkkkkkkkkkkkkkkkkkk"   + value.length.toString());
        listMarket.addAll(value);

      }

      );

      print(listMarket.length.toString() + "444444444444444444444444444444444444444444444");
    });



  }
}
