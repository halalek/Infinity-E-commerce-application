
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/repository/login_repository.dart';
import '../helpers/helper.dart';



import 'dart:async';
import 'dart:convert';

class VarifyController extends ControllerMVC {


  //User user = new User();
  bool loading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  final auth=FirebaseAuth.instance;
  User user;
  Timer timer;

  @override
  void initState()  {
    super.initState();
    // print("lllllllllllllllllllllllllll");
    // user = auth.currentUser;
    // user.sendEmailVerification();
    // timer = Timer.periodic(Duration(seconds:15), (timer) {
    //   Checkemail();
    // }
    // );

  }

  VarifyController() {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();

  }



  @override
  void dispose()
  {
    super.dispose();
    timer.cancel();
  }



  // ignore: non_constant_identifier_names
  Future<bool> Checkemaill() async
  {

    user = auth.currentUser;
    user.sendEmailVerification();
    await new Future.delayed(const Duration(seconds: 65));
    await FirebaseAuth.instance.currentUser.reload();
    //return await Checkemail();
    print("qqqqqqqqqqqqqqqqq       "          + FirebaseAuth.instance.currentUser.emailVerified.toString());

    if(!FirebaseAuth.instance.currentUser.emailVerified)
    {
      print("user.emailVerified faild");
     //  await FirebaseAuth.instance.currentUser.delete();
     //  deleteUser(user.uid);
      return false;
    }

    return FirebaseAuth.instance.currentUser.emailVerified;




    // timer= Timer.periodic (Duration(seconds:15), (timer) {
    //   return   Checkemail();
    // }
    //
    // );

    //return await   Checkemail();
    //return false;
  }

  Future<bool> Checkemail()  async{
   // _onLoadingEmail();
    user=auth.currentUser;
    print(auth.currentUser );
    await user.reload();

    print("hjjjjjjjjj" + (user.emailVerified.toString()));
    if(user.emailVerified)
    {
      loading=true;
      print("user.emailVerified successufuly");
      return true;
      timer.cancel();
      print("user.emailVerified successufuly");
     // _loginrController.loginfirebase() ;



    }

    if(!user.emailVerified)
    {

      print("user.emailVerified faild");
      //await FirebaseAuth.instance.signOut();
      deleteUser(user.uid);
      return false;
    }

  }







  void _onLoadingError() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child:
          new Container(
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(10.0)
            ),
            width: 150.0,
            height:80.0,
            alignment: AlignmentDirectional.center,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Center(
                  child: new SizedBox(
                      height: 10.0,
                      width: 10.0,
                      child: Icon(Icons.error,color: Colors.red,)
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  child: new Center(
                    child: new Text(
                      "Error...Try again ",
                      style: new TextStyle(
                          color: Colors.red,
                          fontSize: 20
                      ),
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

    new Future.delayed(new Duration(seconds:30), () {
      Navigator.pop(context); //pop dialog
    }

    );
  }



}


// "A message was sent to check the email.. \n please  press the sender link ",
