import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/controler/login_controller.dart';
import 'package:structurepublic/src/pages/startView.dart';

import '../../generated/l10n.dart';
import '../controler/user_controller.dart';
import '../elements/BlockButtonWidget.dart';
import '../helpers/app_config.dart' as config;
import '../repository/user_repository.dart' as userRepo;

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'page_Main_View.dart';

class LoginMain extends StatefulWidget {
  @override
  _LoginMain createState() => _LoginMain();
}

class _LoginMain extends StateMVC<LoginMain> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // UserController _con;
  LoginController _loginrController;

  _LoginMain() : super( LoginController()) {
    // _con = controller;
    _loginrController = controller;
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Login To My Account'),
      ),

      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[


                TextFormField(
                  controller: _loginrController.nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Fill Name Input';
                    }

                    return null;
                  },
                ),

                SizedBox(
                  height: 25,
                ),


                TextFormField(
                  controller: _loginrController.phoneController,
                  decoration: InputDecoration(
                    hintText: 'Phone',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Fill Phone Input';
                    }

                    return null;
                  },
                ),

                SizedBox(
                  height: 20,
                ),

                TextFormField(
                  controller: _loginrController.emailController,
                  //_emailcontroller,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Fill Email Input';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 25,
                ),

                TextFormField(
                  controller: _loginrController.passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Fill Password Input';
                    }

                    return null;
                  },
                ),

                RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {

                      _loginrController.loginfirebase();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context) => StartMain() ) );
                    }

                  },
                ),

                RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Signup',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {

                      _loginrController.signupfirebase();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context) => StartMain() ) );

                    }
                  },
                ),
              ],
            )),
      ),
    );
  }
}
