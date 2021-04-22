import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:structurepublic/src/models/route_argument.dart';
import 'package:structurepublic/src/repository/login_repository.dart';

import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../repository/user_repository.dart' as repository;

class VarifyController extends ControllerMVC {


  //User user = new User();
  bool loading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  final auth=FirebaseAuth.instance;
  User user;
  Timer timer;

  VarifyController() {

    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();

  }
  @override
  void initState() {
    super.initState();
    user = auth.currentUser;
    user.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      Checkemail();
    });
  }

  @override
  void dispose()
  {
    super.dispose();
    timer.cancel();
  }


  Future<void> Checkemail()  async{
    user=auth.currentUser;
    await user.reload();
    if(user.emailVerified)
    {
      timer.cancel();
      print("user.emailVerified successufuly");
    }

    if(!user.emailVerified)
    {
      print("user.emailVerified faild");
    }

  }


}
