import 'dart:async';
import 'dart:convert';
import 'dart:io';

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

import '../helpers/custom_trace.dart';
import '../models/setting.dart';

ValueNotifier<Setting> setting = new ValueNotifier(new Setting());
final navigatorKey = GlobalKey<NavigatorState>();
final Userss userss=new Userss();
//LocationData locationData;

Future<Userss> loginSettings(String email, String password,String name,String phone) async {
  var result = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
  // userss.Usersslogin(result.user.uid, name, email,int.parse(phone));
  //userss.phone= int.parse(phone);

   //userss.email= email;
   //userss.name=name;
   //userss.id=result.user.uid;
  //  return result;
  if (result != null) {
    userss.Usersslogin(result.user.uid, name, email,int.parse(phone));
    // getUser
    //return result.user;
    return  await getUser() ;
  } else {
    print("44444444444444444444444444444444444");
    return null;
  }
}


Future<Userss>  signupSettings(String email, String password,String name,String phone) async {
  var result = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);
 // // userss.phone= int.parse(phone);
 //  userss.email= email;
 //  userss.name=name;
 //  userss.id=result.user.uid;
 // //print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj" + userss.phone.toString());

  //  return result;
  if (result != null) {
    userss.UserssSign(result.user.uid, name, email,int.parse(phone),result.user.getIdToken().toString(),"users");
   //shared
    return  await addUser() ;
  } else {
    return null;
  }
}



Future<void> updateUser() async {
  await FirebaseFirestore.instance
      .collection("users").doc(userss.id).update(
    {"name":userss.name,
    "email":userss.email,
    "phone":userss.phone
    }
  )
      .then((value) {
    return value;
  })
      .catchError((e) {});

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


Future<Userss> getUser() async {
  Userss users;
  await FirebaseFirestore.instance
      .collection("users").doc(userss.id)
      .get()
      .then((value) {

    // for(int i=0;i<value.docs.length;i++){
    //   list.add(Userss.fromJson(value.docs[i].data()));
    // }


    users= Userss.fromJson(value.data());
  })
      .catchError((e) {});
  return users;
}




