// import 'dart:async';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:mvc_pattern/mvc_pattern.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:structurepublic/src/models/route_argument.dart';
// import 'package:structurepublic/src/repository/login_repository.dart';
//
// import '../../generated/l10n.dart';
// import '../helpers/helper.dart';
// import '../models/user.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../repository/user_repository.dart' as repository;
//
// class VarifyController extends ControllerMVC {
//
//
//   //User user = new User();
//   bool loading = false;
//   GlobalKey<ScaffoldState> scaffoldKey;
//   OverlayEntry loader;
//   final auth=FirebaseAuth.instance;
//   User user;
//   Timer timer;
//
//   VarifyController() {
//
//     loader = Helper.overlayLoader(context);
//     this.scaffoldKey = new GlobalKey<ScaffoldState>();
//
//   }
//   @override
//   void initState() {
//     super.initState();
//     user = auth.currentUser;
//     user.sendEmailVerification();
//     timer = Timer.periodic(Duration(seconds: 5), (timer) {
//       Checkemail();
//     });
//   }
//
//   @override
//   void dispose()
//   {
//     super.dispose();
//     timer.cancel();
//   }
//
//
//   Future<void> Checkemail()  async{
//     user=auth.currentUser;
//     await user.reload();
//     if(user.emailVerified)
//     {
//       timer.cancel();
//       print("user.emailVerified successufuly");
//     }
//
//     if(!user.emailVerified)
//     {
//       print("user.emailVerified faild");
//     }
//
//   }
//
//
// }


import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/repository/pagemain_repository.dart' as repo;
import 'package:structurepublic/src/repository/verfiy_repository.dart';

import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyController extends ControllerMVC {
  //User user = new User();
  bool loading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  List<Userss> listUsers= [];

  VerifyController() {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }


  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    setState((){
      listUsers.clear();
    });
    await getUserFirebase().then((value) {
      setState((){

        listUsers.addAll(value);
       // print("777777777777777777777777"+ listUsers.length.toString());
      });
    });
  }

}

