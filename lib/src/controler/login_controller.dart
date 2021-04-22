import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:structurepublic/src/controler/varify_controller.dart';
import 'package:structurepublic/src/models/route_argument.dart';
import 'package:structurepublic/src/pages/verfiyView.dart';
import 'package:structurepublic/src/repository/login_repository.dart';

import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../repository/user_repository.dart' as repository;

class LoginController extends ControllerMVC {


  //User user = new User();
  bool loading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  LoginrController() {

    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();

  }




  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
 // VarifyController varifyController=new VarifyController();


  Future<void> loginfirebase() async
  {

    await  logintSettings(emailController.text,passwordController.text).then((value) {
      if(value== null){
        print("error login");

      }else{
        print("Sucsess login");
       // varifyController. Checkemail();
        Navigator.push(context, MaterialPageRoute(builder: (context) => Verfiy() ) );



      }
    });
  }

  Future<void> signupfirebase() async
  {

    await  signuptSettings(emailController.text,passwordController.text).then((value) {
      if(value == null){
        print("error signup");

      }else{
        print("Sucsess signin");
       // varifyController. Checkemail();
        Navigator.push(context, MaterialPageRoute(builder: (context) => Verfiy() ) );

      }
    });
  }




}
