import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/controler/varify_controller.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/models/SoldData.dart';

import '../helpers/custom_trace.dart';
import '../models/setting.dart';

ValueNotifier<Setting> setting = new ValueNotifier(new Setting());
final navigatorKey = GlobalKey<NavigatorState>();

//LocationData locationData;
Future<List<SoldData>> getSold() async {
  List<SoldData> list = [];
  await FirebaseFirestore.instance
      .collection("sold").where("hide",isEqualTo:false).get()
      .then((value) async {
    for(int i=0;i<value.docs.length;i++){
      list.add(SoldData.fromJson(value.docs[i].data()));


      // SoldData soldData = SoldData.fromJson(value.docs[i].data());
      //
      // if (DateTime.now().microsecondsSinceEpoch > DateTime.parse(soldData.timeSend)
      //     .add(Duration(days: soldData.longDay)).microsecondsSinceEpoch) {
      //   await hideSold(soldData);
      //   soldData.hide=true;
      //   list.add(SoldData.fromJson(value.docs[i].data()));
      // } else if (DateTime.now().microsecondsSinceEpoch<DateTime.parse(soldData.timeSend)
      //     .add(Duration(days: soldData.longDay)).microsecondsSinceEpoch) {
      //   print("asasaaaaaaaaaaaaaaaaaaaa");
      //   list.add(SoldData.fromJson(value.docs[i].data()));
      // }
    }

      }
  ).catchError((e) {});

  return list;
}


// Future hideSold(SoldData soldData) async {
//   print("222dddddddddddddddddddddddddddddddddddddd" + soldData.id);
//   soldData.hide = true;
//   await FirebaseFirestore.instance
//       .collection("sold")
//       .doc(soldData.id)
//       .set(soldData.toJson())
//       .then((value) {})
//       .catchError((e) {});
// }

