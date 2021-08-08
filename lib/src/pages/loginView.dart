import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:structurepublic/src/controler/login_controller.dart';
import 'package:structurepublic/src/pages/loginNumber.dart';
import 'package:structurepublic/src/pages/page_welcome.dart';
import 'package:structurepublic/src/pages/signupView.dart';
import 'package:structurepublic/src/pages/startView.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'loginEmail.dart';
import 'page_Main_View.dart';

// class LoginMain extends StatefulWidget {
//   @override
//   _LoginMain createState() => _LoginMain();
// }
//
// class _LoginMain extends StateMVC<LoginMain> {
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   // UserController _con;
//   LoginController _loginrController;
//
//   _LoginMain() : super( LoginController()) {
//     // _con = controller;
//     _loginrController = controller;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     Firebase.initializeApp();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login To My Account'),
//       ),
//
//       body: Container(
//         padding: EdgeInsets.all(16),
//         child: Form(
//             key: _formKey,
//             child: Column(
//               children: <Widget>[
//
//
//                 TextFormField(
//                   obscureText: true,
//                   controller: _loginrController.phoneController,
//                   decoration: InputDecoration(
//                     hintText: 'Phone',
//                   ),
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Please Fill Phone Input';
//                     }
//
//                     return null;
//                   },
//                 ),
//
//                 SizedBox(
//                   height: 20,
//                 ),
//
//                 TextFormField(
//                   controller: _loginrController.emailController,
//                   //_emailcontroller,
//                   decoration: InputDecoration(
//                     hintText: 'Enter your email',
//                     labelText: "Email",
//                     floatingLabelBehavior: FloatingLabelBehavior.always,
//                     suffixIcon: Icon(Icons.email),
//                   ),
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Please Fill Email Input';
//                     }
//                     return null;
//                   },
//                 ),
//
//                 SizedBox(
//                   height: 25,
//                 ),
//
//                 TextFormField(
//                   controller: _loginrController.passwordController,
//                   decoration: InputDecoration(
//                     labelText: "password",
//                     hintText: "Enter your password",
//                     floatingLabelBehavior: FloatingLabelBehavior.always,
//                     suffixIcon: Icon(Icons.lock),
//                   ),
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Please Fill Password Input';
//                     }
//
//                     return null;
//                   },
//                 ),
//
//                 RaisedButton(
//                   color: Colors.blue,
//                   child: Text(
//                     'Login',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onPressed: () async {
//                     if (_formKey.currentState.validate()) {
//
//                       _loginrController.loginfirebase();
//                       Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context) => StartMain() ) );
//                     }
//
//                   },
//                 ),
//
//                 RaisedButton(
//                   color: Colors.blue,
//                   child: Text(
//                     'Signup',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onPressed: () async {
//                     if (_formKey.currentState.validate()) {
//
//                       _loginrController.signupfirebase();
//                       Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context) => StartMain() ) );
//
//                     }
//                   },
//                 ),
//               ],
//             )),
//       ),
//     );
//   }
// }
//
//


class LoginMainPage extends StatefulWidget {
@override
_LoginMainPage createState() =>  _LoginMainPage();
}


class _LoginMainPage extends StateMVC<LoginMainPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool  _passwordVisible;
  @override
  void initState() {
    _passwordVisible = false;
  }
  @override

  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 620,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/img/pp7.PNG'),
                          fit: BoxFit.cover,

                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      // Positioned(
                      //   left: 80,
                      //   width: 200,
                      //   height: 370,
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         image: DecorationImage(
                      //             image: AssetImage('assets/img/pp8.PNG')
                      //         )
                      //     ),
                      //   ),
                      // ),
                      // Positioned(
                      //   left: 20,
                      //   width: 300,
                      //   height: 320,
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         image: DecorationImage(
                      //             image: AssetImage('assets/img/pp10.PNG')
                      //         )
                      //     ),
                      //   ),
                      // ),
                      Positioned(
                        left: 20,
                      //  top: 40,
                        width: 80,
                        height: 110,
                        child:  Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/img/light-22.png',),

                              )
                          ),
                        )),

                      // Positioned(
                      //   child:  Container(
                      //     margin: EdgeInsets.only(top: 50),
                      //     child: Center(
                      //       child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                      //     ),
                      //   )
                      // ),

                      Padding(
                        padding: EdgeInsets.only(left:30.0,top:250,right: 30),
                        child:
                        Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(5),

                              decoration: BoxDecoration(
                                  color:  Colors.black12,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(143, 148, 251, .2),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10)
                                    )
                                  ]
                              ),


                                  child:
                              Column(
                                children: <Widget>[
                                  // Container(
                                  //     margin: EdgeInsets.only(bottom: 10),
                                  //     child: Center(
                                  //       child: Text("Login Number", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                                  //     ),
                                  //
                                  // ),
                                  SizedBox(height: 20,),
                              InkWell(child:
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white
                                        // gradient: LinearGradient(
                                        //     colors: [
                                        //       // Color.fromRGBO(143, 148, 251, 1),
                                        //       // Color.fromRGBO(143, 148, 251, .6),
                                        //      // Colors.white
                                        //     ]
                                        // )
                                    ),
                                    child: Center(
                                      child: Text("Login Email", style: TextStyle(color: Colors.red[200], fontWeight: FontWeight.bold,fontSize: 20),),
                                    ),
                                  ),
                                onTap: () {

                                  //_loginrController.loginfirebase();
                                  Navigator.push(context, MaterialPageRoute(builder: ( context) => LoginEmail() ) );


                                },
                              ),
                                  Container(
                                    height: 40,
                                    // decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(10),
                                    //     gradient: LinearGradient(
                                    //         colors: [
                                    //           Color.fromRGBO(143, 148, 251, 1),
                                    //           Color.fromRGBO(143, 148, 251, .6),
                                    //         ]
                                    //     )
                                    // ),
                                    child: Center(
                                      child: Text("OR", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold,fontSize: 10),),
                                    ),
                                  ),
                              InkWell(child:
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(
                                            colors: [
                                            //  Color.fromRGBO(143, 148, 251, 1),
                                             // Color.fromRGBO(143, 148, 251, .6),
                                              Colors.red[300],
                                             Colors.redAccent
                                            ]
                                        )
                                    ),
                                    child: Center(
                                      child: Text("Login Number", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),),
                                    ),
                                  ),
                                onTap: () {

                                    //_loginrController.loginfirebase();
                                    Navigator.push(context, MaterialPageRoute(builder: ( context) => LoginScreen() ) );


                                },
                              ),
                                  SizedBox(height: 20,),

                                ],
                              ),
                              )
                          ],
                        ),

                        ),








                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}