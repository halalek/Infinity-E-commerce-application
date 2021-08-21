import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:structurepublic/src/controler/login_controller.dart';
import 'package:structurepublic/src/controler/varify_controller.dart';
import 'package:structurepublic/src/pages/page_welcome.dart';
import 'package:structurepublic/src/pages/passwordReset.dart';
import 'package:structurepublic/src/pages/signupView.dart';
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
//
// class LoginMain extends StatefulWidget {
//   @override
//   _LoginMain createState() => _LoginMain();
// }
//
// class _LoginMain extends StateMVC<LoginMain> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   // UserController _con;
//   LoginController _loginrController;
//
//   _LoginMain() : super(LoginController()) {
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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login To My Account'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16),
//         child: Form(
//             key: _formKey,
//             child: Column(
//               children: <Widget>[
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
//                 SizedBox(
//                   height: 20,
//                 ),
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
//                 SizedBox(
//                   height: 25,
//                 ),
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
//                 RaisedButton(
//                   color: Colors.blue,
//                   child: Text(
//                     'Login',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onPressed: () async {
//                     if (_formKey.currentState.validate()) {
//                       _loginrController.loginfirebase();
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) => StartMain()));
//                     }
//                   },
//                 ),
//                 RaisedButton(
//                   color: Colors.blue,
//                   child: Text(
//                     'Signup',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onPressed: () async {
//                     if (_formKey.currentState.validate()) {
//                       _loginrController.signupfirebase();
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) => StartMain()));
//                     }
//                   },
//                 ),
//               ],
//             )),
//       ),
//     );
//   }
// }

// class FadeAnimation extends StatelessWidget {
//   final double delay;
//   final Widget child;
//
//   FadeAnimation(this.delay, this.child);
//
//   @override
//   Widget build(BuildContext context) {
//     // final tween = MultiTrackTween([
//     //   Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
//     //   Track("translateY").add(
//     //       Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
//     //       curve: Curves.easeOut)
//     // ]);
//
//     return ControlledAnimation(
//       delay: Duration(milliseconds: (500 * delay).round()),
//       //duration: tween.duration,
//       //tween: tween,
//       child: child,
//       builderWithChild: (context, child, animation) => Opacity(
//         opacity: animation["opacity"],
//         child: Transform.translate(
//             offset: Offset(0, animation["translateY"]),
//             child: child
//         ),
//       ),
//     );
//   }
// }

class LoginEmail extends StatefulWidget {
  @override
  _LoginEmail createState() => _LoginEmail();
}

class _LoginEmail extends StateMVC<LoginEmail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordVisible;

  // UserController _con;
  LoginController _loginrController;

  _LoginEmail() : super(LoginController()) {
    // _con = controller;
    _loginrController = controller;
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp( locale:Locale('en'),home:
      Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 640,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/img/hkl.PNG'),
                    fit: BoxFit.cover,
                  )),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/img/light-2.png'))),
                        ),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/img/light-2.png'))),
                        ),
                      ),
                      Positioned(
                          right: 40,
                          //  top: 40,
                          width: 80,
                          height: 110,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/img/light-2.png'),
                            )),
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
                        padding:
                            EdgeInsets.only(left: 30.0, top: 220, right: 30),
                        child: Column(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(143, 148, 251, .2),
                                          blurRadius: 20.0,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Center(
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                                color: Colors.red[300],
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        // decoration: BoxDecoration(
                                        //     border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                        // ),
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller:
                                              _loginrController.emailController,
                                          // inputFormatters: <TextInputFormatter>[
                                          //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                          // ],
                                          decoration: InputDecoration(
                                              hintText: 'Enter your Email',
                                              labelText: "Email",
                                              labelStyle:
                                                  TextStyle(color: Colors.red),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              suffixIcon: Icon(Icons.email,
                                                  color: Colors.black38),
                                              fillColor: Colors.white,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.black,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.black38)),
                                              border: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black38))
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please Fill Email Input';
                                            }
                                            if (!value.isValidEmail) {
                                              return 'Enter the Email correctly';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          obscureText: !_passwordVisible,
                                          controller: _loginrController
                                              .passwordController,
                                          decoration: InputDecoration(
                                              labelText: "password",
                                              labelStyle:
                                                  TextStyle(color: Colors.red),
                                              hintText: "Enter your password",
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  // Based on passwordVisible state choose the icon
                                                  _passwordVisible
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: Colors.black38,
                                                ),
                                                onPressed: () {
                                                  // Update the state i.e. toogle the state of passwordVisible variable
                                                  setState(() {
                                                    _passwordVisible =
                                                        !_passwordVisible;
                                                  });
                                                },
                                              ),
                                              fillColor: Colors.white,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.black,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.black38)),
                                              border: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black38))
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please Fill Password Input';
                                            }
                                            if (value.length < 8 ||
                                                value.length > 15) {
                                              return 'password must contain between 8 and 15 characters';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              gradient: LinearGradient(colors: [
                                                // Color.fromRGBO(143, 148, 251, 1),
                                                // Color.fromRGBO(143, 148, 251, .6),
                                                Colors.red[300],
                                                Colors.red
                                              ])),
                                          child: Center(
                                            child: Text(
                                              "Login",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        onTap: () async {
                                          if (_formKey.currentState
                                              .validate()) {
                                            // new VarifyController(_loginrController).Checkemaill();
                                            _loginrController.loginfirebase();

                                            // _loginrController.Checkemaill() ;
                                          }

                                          //_loginrController.loginfirebase();
                                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context) => StartMain() ) );
                                          //SignupMain
                                        },
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "   Don't have an account?   ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                InkWell(
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                        color: Colors.red[400],
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    //_loginrController.loginfirebase();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignupMain()));
                                    //SignupMain
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Text(
                                  "   Forgot your Password ?  ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                                InkWell(
                                  child: Text(
                                    "Remember me",
                                    style: TextStyle(
                                        color: Colors.red[400],
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    //_loginrController.loginfirebase();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PasswordResetMain()));
                                    //SignupMain
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.all(30.0),
                //   child: Column(
                //     children: <Widget>[
                //        Container(
                //         padding: EdgeInsets.all(5),
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //             boxShadow: [
                //               BoxShadow(
                //                   color: Color.fromRGBO(143, 148, 251, .2),
                //                   blurRadius: 20.0,
                //                   offset: Offset(0, 10)
                //               )
                //             ]
                //         ),
                //         child: Column(
                //           children: <Widget>[
                //             Container(
                //               padding: EdgeInsets.all(8.0),
                //               decoration: BoxDecoration(
                //                   border: Border(bottom: BorderSide(color: Colors.grey[100]))
                //               ),
                //               child: TextFormField(
                //                 decoration: InputDecoration(
                //                   labelText: "Resevior Name",
                //                   fillColor: Colors.white,
                //                   enabledBorder:OutlineInputBorder(
                //                     borderSide: const BorderSide(color: Colors.black, width: 2.0),
                //                     borderRadius: BorderRadius.circular(25.0),
                //                   ),),
                //               ),
                //             ),
                //             Container(
                //               padding: EdgeInsets.all(8.0),
                //               child: TextField(
                //                 decoration: InputDecoration(
                //                     border: InputBorder.none,
                //                     hintText: "Password",
                //                     hintStyle: TextStyle(color: Colors.grey[400])
                //                 ),
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //       SizedBox(height: 30,),
                //       Container(
                //         height: 50,
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //             gradient: LinearGradient(
                //                 colors: [
                //                   Color.fromRGBO(143, 148, 251, 1),
                //                   Color.fromRGBO(143, 148, 251, .6),
                //                 ]
                //             )
                //         ),
                //         child: Center(
                //           child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                //         ),
                //       ),
                //       SizedBox(height: 70,),
                //       Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        )));
  }
}
