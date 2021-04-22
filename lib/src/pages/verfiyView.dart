import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Verfiy extends StatefulWidget{
  @override
  _Verfiy createState() => _Verfiy();
}

class _Verfiy extends State<Verfiy> {
  final auth=FirebaseAuth.instance;
  User user;
  Timer timer;
  void initState()
  {
    super.initState();
    user=auth.currentUser;
    user.sendEmailVerification();
    timer= Timer.periodic(Duration(seconds: 8), (timer) {
      Checkemail();

    });
  }

  @override
  void dispose()
  {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login To My Account'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          // key: _formkey,
            child: Column(
              children: <Widget>[
                Text(
                    "Verfiy in email "
                ),

                // RaisedButton(
                //   color: Colors.blue,
                //   child: Text('Register New Account 2 ',style: TextStyle(color: Colors.white),),
                //   onPressed: () async {
                // //    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen2() ) );
                //   },
                // )

              ],
            )
        ),
      ),
    );
  }
  Future<void> Checkemail()  async{
    user=auth.currentUser;
    await user.reload();
    if(user.emailVerified)
    {
      timer.cancel();
      print("user.emailVerified successufuly");
    }

    if(!user.emailVerified)
    {
      print("user.emailVerified faild");
    }

  }



}