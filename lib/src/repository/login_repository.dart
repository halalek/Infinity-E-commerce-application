import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:structurepublic/src/pages/sharedPref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/controler/varify_controller.dart';
import 'package:structurepublic/src/models/user.dart';
import 'package:structurepublic/src/pages/vereible.dart';

import '../helpers/custom_trace.dart';
import '../models/setting.dart';

ValueNotifier<Setting> setting = new ValueNotifier(new Setting());
final navigatorKey = GlobalKey<NavigatorState>();

final Userss userss=new Userss();
//LocationData locationData;

Future<Userss> loginSettings(String email, String password,String name,String phone) async {
  var result = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
  if (result != null) {
    userss.Usersslogin(result.user.uid, name, email,int.parse(phone));
    // getUser
    //return result.user;
    return  await getUser() ;
  } else {
    return null;
  }
}


Future<Userss>  signupSettings(String email, String password,String name,String phone) async {
  var result = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);

  if (result != null) {
    userss.UserssSign(result.user.uid, name, email,int.parse(phone),result.user.getIdToken().toString(),"users");
   //shared
    return  await addUser() ;
  } else {
    return null;
  }
}
Future<void> updateUser(Userss user ) async {
  await FirebaseFirestore.instance
      .collection("users").doc(user.id).update(
      {"name":user.name,
        "email":user.email,
        "phone":user.phone,
        "longe":user.long,
        "lat":user.lat,
        "image":user.image
      }
  )
      .then((value) {
        print("kkkkkkkkkkkkkkkkkkk");
    return value;
  })
      .catchError((e) {});
  return  await getUser();

}





Future<Userss> addUser() async {
  await FirebaseFirestore.instance
      .collection("users").doc(userss.id).set(
      {"name":userss.name,
        "email":userss.email,
        "phone":userss.phone,
        "id":userss.id,
        "token":userss.token,
        "role":userss.role,

      }
  )
      .then((value) {
  }).catchError((e) {});
  return  await getUser();


}
SharedPref sharedPref=SharedPref();

Future<Userss> getUser() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var user = preferences.getString('user');
  Userss users=new Userss();
  if(user==null)
    {
      await FirebaseFirestore.instance
          .collection("users").doc(userss.id)
          .get()
          .then((value) {
        users= Userss.fromJson(value.data());
      }
      );
      return users;
    }

  else
    {
      users=Userss.fromJson(json.decode(user));
      return users ;

    }

}



  Userss user =Userss.fromJson(await sharedPref.read('user')) ;
  Userss users;
  if(user==null)
  {

    await FirebaseFirestore.instance
        .collection("users").doc(userss.id)
        .get()
        .then((value) {

      users= Userss.fromJson(value.data());
    }
    )
        .catchError((e) {});
    return users;
  }

  else
  {
    users=user;
    return users ;

  }

}
/*

Future<Userss> userfirebase() async
{
  Userss b;
  b= await getUser().then((value)=>value);
  j=b.name;
  print(b.name);
  return b;

}*/



