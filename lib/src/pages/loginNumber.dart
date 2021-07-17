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














class LoginNumber extends StatefulWidget {
  @override
  _LoginNumber createState() =>  _LoginNumber();
}


class _LoginNumber extends StateMVC<LoginNumber> {
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
                  height: 700,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/12222.png'),
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
                                  image: AssetImage('assets/img/light-11.png')
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
                        padding: EdgeInsets.only(left:30.0,top:220,right: 30),
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
                                          child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                                        ),

                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        // decoration: BoxDecoration(
                                        //     border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                        // ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,

                                          inputFormatters: [new WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),],
                                          decoration: InputDecoration(

                                            hintText: 'Enter your name ',
                                            labelText: "Name",
                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            suffixIcon: Icon(Icons.person),
                                            fillColor: Colors.white,
                                            enabledBorder:OutlineInputBorder(
                                              borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please Fill Name Input';
                                            }
                                            if (value.length > 10 || value.length <4) {
                                              return 'Enter the name correctly';
                                            }



                                            return null;
                                          },
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        // decoration: BoxDecoration(
                                        //     border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                        // ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                          ],
                                          decoration: InputDecoration(

                                            hintText: 'Enter your phone 09...',
                                            labelText: "Phone",

                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            suffixIcon: Icon(Icons.phone),
                                            fillColor: Colors.white,
                                            enabledBorder:OutlineInputBorder(
                                              borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please Fill Phone Input';
                                            }
                                            if (value.length > 10 || value.length <10) {
                                              return 'Enter the number correctly';
                                            }

                                            if (value.substring(0,2) != "09") {
                                              return 'Enter the number correctly';
                                            }

                                            return null;
                                          },
                                        ),
                                      ),

                                      SizedBox(height: 10,),
                                      InkWell(child:
                                      Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(143, 148, 251, 1),
                                                  Color.fromRGBO(143, 148, 251, .6),
                                                ]
                                            )
                                        ),
                                        child: Center(
                                          child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                        onTap: () async {
                                          if (_formKey.currentState.validate()) {

                                            //_loginrController.loginfirebase();
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context) => StartMain() ) );
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

              ],
            ),
          ),
        )
    );
  }
}