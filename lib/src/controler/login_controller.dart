import 'dart:async';
import 'dart:convert';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/controler/user_controller.dart';
import 'package:structurepublic/src/controler/varify_controller.dart';
import 'package:structurepublic/src/models/route_argument.dart';
import 'package:structurepublic/src/pages/loginNumber.dart';
import 'package:structurepublic/src/pages/page_Main_View.dart';
import 'package:structurepublic/src/pages/profil.dart';
import 'package:structurepublic/src/pages/startView.dart';
import 'package:structurepublic/src/pages/verfiyView.dart';
import 'package:structurepublic/src/repository/login_repository.dart';

import 'package:structurepublic/src/repository/login_repository.dart' as repo;
import '../../generated/l10n.dart';
import '../../main.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../repository/user_repository.dart' as repository;

class LoginController extends ControllerMVC {
  //User user = new User();
  bool loading = false;
  bool loading1 = false;
  bool loadingpass = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  int start = 60;
  String id, vjson;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  VarifyController varifyController = new VarifyController();

  LoginrController() {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    print("BACK BUTTON!");

    // Do some stuff. return true;
  }

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

//
//       Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard(),),);

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get phoneController => _phoneController;

  TextEditingController get nameController => _nameController;

  void sendpasswordresetemail() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text)
        .then((value) {
      // Get.snackbar("Password Reset email link is been sent", "Success");
      print("aaaaaaaaaaaaaaaaaa");
      loadingpass = true;
      _onLoadingPassword();
    }).catchError(
      (onError) {
        print("zzzzzzzzzzzzzzzzzzzzzzz");
        _onLoadingError();
      },
    );
    //Get.snackbar("Error In Email Reset", onError.message) );
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationId;

  bool showLoading = false;


  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
      await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential?.user != null) {

       // preferences.setString('user', json.encode(authCredential.credential.toString()));
        userss.UserssSignphone(authCredential.user.uid, nameController.text,authCredential.user.phoneNumber,authCredential.user.getIdToken().toString(),"users");
        await addUser();
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('user', json.encode(userss.toJson()));
        preferences.setString('userID', authCredential.user.uid);
        Navigator.pop(context);
       // Navigator.pop(context);
       // Navigator.pop(context);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => StartMain()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
    }
  }




  void checksigup() async {
    _onLoadingEmail();
    await signupfirebase();
    //await varifyController.Checkemaill();
    await varifyController.Checkemaill().then((value) async {
      if (value == true) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('user', vjson);
        preferences.setString('userID', id);
        loading1 = true;
        Navigator.pop(context); //pop dialog
        Navigator.pop(context); //pop signup
        Navigator.pop(context); //pop welcomepage
        Navigator.pop(context); //pop login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => StartMain(),
          ),
        );
        print("login");
        //loginfirebase();
      } else {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.clear();
        await FirebaseAuth.instance.currentUser.delete();
        deleteUser(id);
        print("4444444444444444444444444444444444444444444444444444");
        print(value);
        print("errrrrrrrr");
      }
    });
  }

  Future<void> loginfirebase() async {
    _onLoading();

    await loginSettings(emailController.text, passwordController.text)
        .then((value) async {
      if (value == null) {
        print("error login");
      } else {
        loading = true; 

        print("Sucsess login");
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('user', json.encode(value.toJson()));
        preferences.setString('userID', value.id);
        print(
            "uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu" + value.id);
        Navigator.pop(context); //pop dialog ////////////////////g
        Navigator.pop(context); //pop login///////////////////// g
       // Navigator.pushReplacement('/e'); /////////////g
        Navigator.of(context).pushReplacementNamed('/e');
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context)=> PageMain(),),);
        //    print("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
        // varifyController. Checkemail();
        //Navigator.push(context, MaterialPageRoute(builder: (context) => Verfiy() ) );

        // varifyController. Checkemail();

      }
    });
  }

  Future<void> signupfirebase() async {
    //_onLoading();
    await signupSettings(
            emailController.text, passwordController.text, nameController.text)
        .then((value) async {
      if (value == null) {
        print("error signup");
      } else {
        print("Sucsess signin");

        id = value.id;
        vjson = json.encode(value.toJson());
        // SharedPreferences preferences = await SharedPreferences.getInstance();
        // preferences.setString('user', json.encode(value.toJson()));
        // preferences.setString('userID', value.id);

        //varifyController. Checkemail();
        // Navigator.pop(context);//pop dialog
        // Navigator.pop(context);//pop signup
        // Navigator.pushReplacement( context, MaterialPageRoute(builder: (BuildContext context)=> StartMain(),),);
        //varifyController. Checkemail();
        //  Navigator.push(context, MaterialPageRoute(builder: (context) => Verfiy() ) );

      }
    });
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Container(
            decoration: new BoxDecoration(
                color: Colors.red[200],
             //   borderRadius: new BorderRadius.circular(10.0)
            ),
            width: 150.0,
            height: 100.0,
            alignment: AlignmentDirectional.center,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Center(
                  child: new SizedBox(
                    height: 30.0,
                    width: 30.0,
                    child: new CircularProgressIndicator(
                      value: null,
                      strokeWidth: 7.0,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red)
                    ),
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  child: new Center(
                    child: new Text(
                      "loading.. wait...",
                      style: new TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // new Row(
          //   mainAxisSize: MainAxisSize.max,
          //   children: [
          //     new CircularProgressIndicator(),
          //     SizedBox(width: 5,),
          //     new Text("Loading"),
          //   ],
          // ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 33), () {
      if (!loading) {
        Navigator.pop(context); //pop dialog
        _onLoadingError();
      }


    });
  }

  void _onLoadingPassword() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Container(
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(10.0)),
            width: 300.0,
            height: 200.0,
            alignment: AlignmentDirectional.center,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Center(
                  child: new SizedBox(
                    height: 20.0,
                    width: 20.0,
                    child: new CircularProgressIndicator(
                      value: null,
                      strokeWidth: 2.0,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red)
                    ),
                    //Icon(Icons.email,color: Colors.blueAccent,)
                  ),
                ),
                new Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: Column(children: <Widget>[
                        Center(
                          child: Row(children: <Widget>[
                            Text("        "),
                            Icon(
                              Icons.email,
                              color: Colors.red[300],
                              size: 33,
                            ),
                            Text(
                              "       Password Reset  \n   email link is been sent  ",
                              style: new TextStyle(
                                  color: Colors.red[300], fontSize: 17),
                            ),
                          ]),
                        ),
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
          // new Row(
          //   mainAxisSize: MainAxisSize.max,
          //   children: [
          //     new CircularProgressIndicator(),
          //     SizedBox(width: 5,),
          //     new Text("Loading"),
          //   ],
          // ),
        );
      },
    );

    new Future.delayed(new Duration(seconds: 60), () {
      if (!loadingpass) {
        Navigator.pop(context); //pop dialog
        _onLoadingError();
      }

      if (loadingpass) {
        Navigator.pop(context); //pop dialog
        Navigator.pop(context);
      }
    });
  }

  void _onLoadingError() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Container(
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(10.0)),
            width: 150.0,
            height: 80.0,
            alignment: AlignmentDirectional.center,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Center(
                  child: new SizedBox(
                      height: 10.0,
                      width: 10.0,
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                      )),
                ),
                new Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  child: new Center(
                    child: new Text(
                      "Error...Try again ",
                      style: new TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // new Row(
          //   mainAxisSize: MainAxisSize.max,
          //   children: [
          //     new CircularProgressIndicator(),
          //     SizedBox(width: 5,),
          //     new Text("Loading"),
          //   ],
          // ),
        );
      },
    );

    new Future.delayed(new Duration(seconds: 3), () {
      Navigator.pop(context); //pop dialog
    });
  }

  void _onLoadingEmail() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Container(
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(10.0)),
            width: 300.0,
            height: 200.0,
            alignment: AlignmentDirectional.center,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Center(
                  child: new SizedBox(
                    height: 20.0,
                    width: 20.0,
                    child: new CircularProgressIndicator(
                      value: null,
                      strokeWidth: 2.0,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red)
                    ),
                    //Icon(Icons.email,color: Colors.blueAccent,)
                  ),
                ),
                new Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: Column(children: <Widget>[
                        Center(
                          child: Row(children: <Widget>[
                            Text("                           "),
                            Icon(
                              Icons.email,
                              color: Colors.red,
                              size: 25,
                            ),
                            Text(
                              "   Hi   " + nameController.text,
                              style: new TextStyle(
                                  color: Colors.red[300], fontSize: 16),
                            ),
                          ]),
                        ),
                        Text(
                          "",
                          style: new TextStyle(fontSize: 6),
                        ),
                        Text(
                          "A message was sent to check the email.. ",
                          style: new TextStyle(
                              color: Colors.red[300], fontSize: 12),
                        ),
                        Text(
                          "",
                          style: new TextStyle(fontSize: 3),
                        ),
                        Text(
                          " please  press the sender link ",
                          style: new TextStyle(
                              color: Colors.red[300], fontSize: 16),
                        ),
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
          // new Row(
          //   mainAxisSize: MainAxisSize.max,
          //   children: [
          //     new CircularProgressIndicator(),
          //     SizedBox(width: 5,),
          //     new Text("Loading"),
          //   ],
          // ),
        );
      },
    );

    new Future.delayed(new Duration(seconds: 90), () {
      if (!loading1) {
        Navigator.pop(context); //pop dialog
        _onLoadingError();
      }
    });
  }
}
