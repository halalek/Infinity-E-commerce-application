import 'package:flutter/cupertino.dart';
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




import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";










class LoginNumber extends StatefulWidget {
  @override
  _LoginNumber createState() =>  _LoginNumber();
}


class _LoginNumber extends StateMVC<LoginNumber> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool  _passwordVisible;


  LoginController _loginrController ;

  _LoginNumber() : super( LoginController()) {
    // _con = controller;
    _loginrController = controller;
  }

  @override
  void initState() {
    _passwordVisible = false;
  }
  @override

  Widget build(BuildContext context) {

    return MaterialApp( locale:Locale('en'),  debugShowCheckedModeBanner: false,home: Scaffold(
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
                                          controller:_loginrController.phoneController ,
                                          //keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                          ],
                                          decoration: InputDecoration(

                                            hintText: 'Enter your phone 9...',
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
                                            if (value.length > 9 || value.length <9) {
                                              return 'Enter the number correctly';
                                            }

                                            if (value.substring(0,1) != "9") {
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

                                        //    _loginrController.loginNumber();
                                           // Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context) => StartMain() ) );
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
    ));
  }
}



























enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends StateMVC<LoginScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationId;




  LoginController _loginrController ;

  _LoginScreenState() : super( LoginController()) {
    // _con = controller;
    _loginrController = controller;}




  // void signInWithPhoneAuthCredential(
  //     PhoneAuthCredential phoneAuthCredential) async {
  //   setState(() {
  //     showLoading = true;
  //   });
  //
  //   try {
  //     final authCredential =
  //     await _auth.signInWithCredential(phoneAuthCredential);
  //
  //     setState(() {
  //       showLoading = false;
  //     });
  //
  //     if(authCredential?.user != null){
  //       Navigator.pop(context);
  //       Navigator.pop(context);
  //       Navigator.pop(context);
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> StartMain()));
  //     }
  //
  //   } on FirebaseAuthException catch (e) {
  //     setState(() {
  //       showLoading = false;
  //     });
  //
  //     _scaffoldKey.currentState
  //         .showSnackBar(SnackBar(content: Text(e.message)));
  //   }
  // }
  getMobileFormWidget()
{return     Padding(
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
                    child: Text("Login", style: TextStyle(color: Colors.red[300], fontSize: 40, fontWeight: FontWeight.bold),),
                  ),

                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  // decoration: BoxDecoration(
                  //     border: Border(bottom: BorderSide(color: Colors.grey[100]))
                  // ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
controller: _loginrController.nameController,
                    inputFormatters: [ WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),],
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.red),
                      hintText: 'Enter your name ',
                      labelText: "Name",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: Icon(Icons.person,color: Colors.black38,),
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
                    controller:phoneController ,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: InputDecoration(

                      hintText: 'Enter your phone 9...',
                      labelText: "Phone",
                      labelStyle: TextStyle(color: Colors.red),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: Icon(Icons.phone,color: Colors.black38),
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
                        return 'Please Fill Phone Input';
                      }
                      if (value.length > 9 || value.length <9) {//999999999999999999999999
                        return 'Enter the number correctly';
                      }

                      if (value.substring(0,1) != "9") {
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
                            // Color.fromRGBO(143, 148, 251, 1),
                            // Color.fromRGBO(143, 148, 251, .6),
                            Colors.red[300],
                            Colors.redAccent
                          ]
                      )
                  ),
                  child: Center(
                    child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                ),
                  onTap: () async {
                    if (_formKey.currentState.validate()) {

                      setState(() {
                        _loginrController.showLoading = true;

                      });


                      await _auth.verifyPhoneNumber(
                        phoneNumber: ("+963"+phoneController.text),
                        verificationCompleted: (phoneAuthCredential) async {
                          setState(() {
                            _loginrController.showLoading = false;
                          });
                          //signInWithPhoneAuthCredential(phoneAuthCredential);
                        },
                        verificationFailed: (verificationFailed) async {
                          setState(() {
                            _loginrController.showLoading = false;
                          });
                          // _scaffoldKey.currentState.showSnackBar(
                          //     SnackBar(content: Text(verificationFailed.message)));
                        },
                        codeSent: (verificationId, resendingToken) async {
                          setState(() {
                            _loginrController.showLoading = false;
                            currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                            this.verificationId = verificationId;
                          });
                        },
                        codeAutoRetrievalTimeout: (verificationId) async {},

                        // _loginrController.loginNumber();
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context) => StartMain() ) );
                      );}

                  },
                )
              ],
            ),
          )
      ),
      SizedBox(height: 20,),

    ],
  ),

);
}
  // getMobileFormWidget(context) {
  //   return Column(
  //     children: [
  //       Spacer(),
  //       TextField(
  //         controller: phoneController,
  //         decoration: InputDecoration(
  //           hintText: "Phone Number",
  //         ),
  //       ),
  //       SizedBox(
  //         height: 16,
  //       ),
  //       FlatButton(
  //         onPressed: () async {
  //           setState(() {
  //             showLoading = true;
  //           });
  //
  //
  //           await _auth.verifyPhoneNumber(
  //             phoneNumber: ("+963"+phoneController.text),
  //             verificationCompleted: (phoneAuthCredential) async {
  //               setState(() {
  //                 showLoading = false;
  //               });
  //               //signInWithPhoneAuthCredential(phoneAuthCredential);
  //             },
  //             verificationFailed: (verificationFailed) async {
  //               setState(() {
  //                 showLoading = false;
  //               });
  //               _scaffoldKey.currentState.showSnackBar(
  //                   SnackBar(content: Text(verificationFailed.message)));
  //             },
  //             codeSent: (verificationId, resendingToken) async {
  //               setState(() {
  //                 showLoading = false;
  //                 currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
  //                 this.verificationId = verificationId;
  //               });
  //             },
  //             codeAutoRetrievalTimeout: (verificationId) async {},
  //           );
  //         },
  //         child: Text("SEND"),
  //         color: Colors.blue,
  //         textColor: Colors.white,
  //       ),
  //       Spacer(),
  //     ],
  //   );
  // }

  getOtpFormWidget(context) {
    return Column(
      children: [
        SizedBox(child: Text(" ",style: TextStyle(fontSize:250 ),),),
        TextField(
          keyboardType: TextInputType.number,
          controller: otpController,
          decoration: InputDecoration(
            hintText: "Enter OTP",
              focusedBorder:
              UnderlineInputBorder(
                  borderSide: BorderSide(
                      color:
                      Colors.black38)),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black38))
          ),


        ),
        SizedBox(
          height: 16,
        ),
        FlatButton(
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
            PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: otpController.text);

            _loginrController.signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          child: Text("VERIFY"),
          color: Theme.of(context).primaryColorDark,
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return

      // Scaffold(
      //   key: _scaffoldKey,
      //   body: Container(
      //     child: showLoading
      //         ? Center(
      //       child: CircularProgressIndicator(),
      //     )
      //         : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
      //         ? gettt()
      //         : getOtpFormWidget(context),
      //     padding: const EdgeInsets.all(16),
      //   ));




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

            Container(
                  child: _loginrController.showLoading
                      ? Center(
                    child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red),),
                  )
                      : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                      ? getMobileFormWidget()
                      : getOtpFormWidget(context),
                  padding: const EdgeInsets.all(16),
                )
    ]
    )
    )
    ])
    )
    )
      );
  }
}



// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   final _auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text("Home Screen"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: ()async{
//           await _auth.signOut();
//           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
//         },
//         child: Icon(Icons.lock_outline),
//       ),
//     );
//   }
// }
//
//
//
// class InitializerWidget extends StatefulWidget {
//   @override
//   _InitializerWidgetState createState() => _InitializerWidgetState();
// }
//
// class _InitializerWidgetState extends State<InitializerWidget> {
//
//   FirebaseAuth _auth;
//
//   User _user;
//
//   bool isLoading = true;
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _auth = FirebaseAuth.instance;
//     _user = _auth.currentUser;
//     isLoading = false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return isLoading ? Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     ) : _user == null ? LoginScreen() : HomeScreen();
//   }
// }






