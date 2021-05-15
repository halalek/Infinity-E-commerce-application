import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/controler/user_controller.dart';
import 'package:structurepublic/src/controler/varify_controller.dart';
import 'package:structurepublic/src/models/route_argument.dart';
import 'package:structurepublic/src/pages/page_Main_View.dart';
import 'package:structurepublic/src/pages/profil.dart';
import 'package:structurepublic/src/pages/startView.dart';
import 'package:structurepublic/src/pages/verfiyView.dart';
import 'package:structurepublic/src/repository/login_repository.dart';

import 'package:structurepublic/src/repository/login_repository.dart'as repo;
import '../../generated/l10n.dart';
import '../../main.dart';
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
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  LoginrController() {

    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();

  }



//
//       Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard(),),);

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get nameController => _nameController;
 // VarifyController varifyController=new VarifyController();




  Future<void> loginfirebase() async
  {

    await  loginSettings(emailController.text,passwordController.text, nameController.text,phoneController.text).then((value) async{
      if(value== null){
        print("error login");

      }else{
        print("Sucsess login");
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('user', json.encode(value.toJson()));
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: ( BuildContext context)=> StartMain(),),);
       // Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context)=> PageMain(),),);
        print("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
       // varifyController. Checkemail();
        //Navigator.push(context, MaterialPageRoute(builder: (context) => Verfiy() ) );



      }
    });

  }

  Future<void> signupfirebase() async
  {

    await  signupSettings(emailController.text,passwordController.text,nameController.text,phoneController.text).then((value) async {
      if(value == null){
        print("error signup");

      }else{
        print("Sucsess signin");
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('user', json.encode(value.toJson()));
    //    Navigator.pushReplacement( context, MaterialPageRoute(builder: (BuildContext context)=> StartMain(),),);
       // varifyController. Checkemail();
      //  Navigator.push(context, MaterialPageRoute(builder: (context) => Verfiy() ) );

      }
    });
  }










}
