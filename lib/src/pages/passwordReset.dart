import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:structurepublic/src/controler/login_controller.dart';
import 'package:structurepublic/src/pages/startView.dart';

import '../../generated/l10n.dart';
import '../controler/user_controller.dart';
import '../elements/BlockButtonWidget.dart';
import '../helpers/app_config.dart' as config;
import '../repository/user_repository.dart' as userRepo;

import 'package:firebase_core/firebase_core.dart';










extension extString on String {
  bool get isValidEmaill {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }


}

class PasswordResetMain extends StatefulWidget {
  @override
  _PasswordResetMain createState() =>  _PasswordResetMain();
}


class _PasswordResetMain extends StateMVC<PasswordResetMain> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool  _passwordVisible;

  // UserController _con;
  LoginController _loginrController;

  _PasswordResetMain() : super( LoginController()) {
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

    return  MaterialApp( locale:Locale('en'),debugShowCheckedModeBanner: false,home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[

                Container(
                  height: 700,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/img/hkl.PNG"),
                        fit: BoxFit.cover,

                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/img/light-2.png')
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/img/light-2.png')
                              )
                          ),
                        ),
                      ),
                      Positioned(
                          right: 40,
                          //  top: 40,
                          width: 80,
                          height: 110,
                          child:  Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/img/light-2.png'),
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
                        padding: EdgeInsets.only(left:30.0,top:270,right: 30),
                        child:
                        Column(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(5),

                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(143, 148, 251, .2),
                                          blurRadius: 20.0,
                                          offset: Offset(0, 10)
                                      )
                                    ]
                                ),

                                child:Form(
                                  key: _formKey,
                                  child:
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Center(
                                          child: Text("Password Reset ", style: TextStyle(color: Colors.red[300], fontSize: 25, fontWeight: FontWeight.bold),),
                                        ),

                                      ),

                                      SizedBox(height: 14,),
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        // decoration: BoxDecoration(
                                        //     border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                        // ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.emailAddress,
                                          controller: _loginrController.emailController,
                                          decoration: InputDecoration(

                                            hintText: 'Enter your Email ',
                                            labelStyle: TextStyle(color: Colors.red),
                                            labelText: "Email",
                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            suffixIcon: Icon(Icons.email,color: Colors.black38,),
                                            fillColor: Colors.white,
                                            enabledBorder:OutlineInputBorder(
                                              borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                              borderRadius: BorderRadius.circular(15.0),
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

                                            if(!value.isValidEmaill)
                                            { return 'Enter the Email correctly';}

                                            return null;
                                          },
                                        ),
                                      ),

                                      SizedBox(height: 14,),
                                      InkWell(child:
                                      Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                                colors: [
                                                  // Color.fromRGBO(143, 148, 251, 1),
                                                  // Color.fromRGBO(143, 148, 251, .6),
                                                  Colors.red[300],
                                                  Colors.red
                                                ]
                                            )
                                        ),
                                        child: Center(
                                          child: Text("Sent Password", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                        onTap: () async {
                                          if (_formKey.currentState.validate()) {

                                            //   _loginrController.signupfirebase();
                                            _loginrController.sendpasswordresetemail();
                                          }

                                        },
                                      )
                                    ],
                                  ),
                                )
                            ),
                            SizedBox(height: 20,),

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
        )
    ));
  }
}