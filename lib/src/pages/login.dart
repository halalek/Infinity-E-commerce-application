import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/controler/Login.dart';

import '../../generated/l10n.dart';
import '../controler/user_controller.dart';
import '../elements/BlockButtonWidget.dart';
import '../helpers/app_config.dart' as config;
import '../repository/user_repository.dart' as userRepo;

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Loginmain extends StatefulWidget {
  @override
  _Loginmain createState() => _Loginmain();
}

class _Loginmain extends StateMVC<Loginmain> {
  final _formkey = GlobalKey<FormState>();

  // UserController _con;
  LoginController _loginrController;

  _Loginmain() : super(LoginController()) {
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
            key: _formkey,
            child: Column(
              children: <Widget>[
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
                    // else
                    //    {
                    //      _loginrController.setrmail(_loginrController.emailcontroller);
                    //    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
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
                SizedBox(
                  height: 25,
                ),

                RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      // var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _loginrController.emailcontroller.text, password: _loginrController.passwordcontroller.text);
                      // print( result);
                      //
                      // if(result != null){
                      //
                      //   // var userinfo=FirebaseFirestore.instance.collection('users').doc().set({
                      //   // 'email' : result.user.email
                      //   // });
                      //   //
                      //   print("successfully");
                      // }else{
                      //   print('user not found');
                      // }
                      _loginrController.logfirebase();
                    }
                  },
                ),
                // RaisedButton(
                //   color: Colors.blue,
                //   child: Text('Register New Account',style: TextStyle(color: Colors.white),),
                //   onPressed: () async {
                //     Navigator.push(context, MaterialPageRoute(builder: (context) =>  PostsScreen() ) );
                //   },
                // ),
                // RaisedButton(
                //   color: Colors.blue,
                //   child: Text('Register New Account 2 ',style: TextStyle(color: Colors.white),),
                //   onPressed: () async {
                // //    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen2() ) );
                //   },
                // )
              ],
            )),
      ),
    );
  }
}
