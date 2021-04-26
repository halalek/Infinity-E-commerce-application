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
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/models/user.dart';

import '../helpers/custom_trace.dart';
import '../models/setting.dart';

ValueNotifier<Setting> setting = new ValueNotifier(new Setting());
final navigatorKey = GlobalKey<NavigatorState>();

//LocationData locationData;

Future<List<Userss>> getUserFirebase() async {
  List<Userss> list = [];
  await FirebaseFirestore.instance
      .collection("users")
      .get()
      .then((value) {
    //print("value.docs[i].data()");

    for(int i=0;i<value.docs.length;i++){
      list.add(Userss.fromJson(value.docs[i].data()));
    }
  })
      .catchError((e) {});
  return list;
}
