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
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/SectionData.dart';

import '../helpers/custom_trace.dart';
import '../models/setting.dart';

ValueNotifier<Setting> setting = new ValueNotifier(new Setting());
final navigatorKey = GlobalKey<NavigatorState>();

//LocationData locationData;
Future<List<MarketData>> getMarket() async {
  List<MarketData> list = [];
  await FirebaseFirestore.instance
      .collection("market")
      .get()
      .then((value) {
   // print("value.docs[i].data()");

   for(int i=0;i<value.docs.length;i++){

      list.add(MarketData.fromJson(value.docs[i].data()));
      print( value.docs.length.toString() + "mmmmmmmmmm");
    }

  })
      .catchError((e) {});
  print("=====================================================================");
  print( list);
  print("=====================================================================");
  print( list.length.toString() + "88888888888888");
  return list;
}
//Future<List<SectionData>> getMarket() async {
  // List<SectionData> list = [];
  // await FirebaseFirestore.instance
  //     .collection("market")
  //     .get()
  //     .then((value) {
  //       print("kkkkkkkkkkkkkkkkkkkkkkkkkkkk");
  //
  //
  //   // for(int i=0;i<value.docs.length;i++){
  //   //   list.add(SectionData.fromJson(value.docs[i].data()));
  //   // }
  // })
  //     .catchError((e) {});
  // //return list;
//}
