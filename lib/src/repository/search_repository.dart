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
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';

import '../helpers/custom_trace.dart';
import '../models/setting.dart';
import 'package:intl/intl.dart';
ValueNotifier<Setting> setting = new ValueNotifier(new Setting());
final navigatorKey = GlobalKey<NavigatorState>();

//LocationData locationData;
Future<List<ProductData>> getProductSearch(String searchQuery ) async {
  List<ProductData> list = [];
  await FirebaseFirestore.instance
      .collection("product").where("hide",isEqualTo:false).where("name_ar",isGreaterThanOrEqualTo: searchQuery,
    isLessThan: searchQuery.substring(0, searchQuery.length - 1) + String.fromCharCode(searchQuery.codeUnitAt(searchQuery.length - 1) + 1),
  ).get()
      .then((value) {
    for(int i=0;i<value.docs.length;i++){
      list.add(ProductData.fromJson(value.docs[i].data()));
      print("zzzzzzzzzzzzzzzzzzzz");
    }}
  ).catchError((e) {});

  return list;
}

Future<List<MarketData>> getMarketSearch(String searchQuery) async {
  List<MarketData> list = [];
  await FirebaseFirestore.instance
      .collection("market").where("hide",isEqualTo:false).where("name_ar",isGreaterThanOrEqualTo: searchQuery,
    isLessThan: searchQuery.substring(0, searchQuery.length - 1) + String.fromCharCode(searchQuery.codeUnitAt(searchQuery.length - 1) + 1),
  ).get()
      .then((value) {
    for(int i=0;i<value.docs.length;i++){
      MarketData marketData=MarketData.fromJson(value.docs[i].data());
      int timeInMillisopen = marketData.timesTampOpen;
      int timeInMillisclose = marketData.timesTampClose;
      var date = DateTime.fromMicrosecondsSinceEpoch(timeInMillisopen);
      var formattedDate = DateFormat('HH:mm a').format(date); // 12/31, 11:59 pm
      marketData.timeOpen=formattedDate.toString();

      var dateclose = DateTime.fromMicrosecondsSinceEpoch(timeInMillisclose);
      var formattedDateclose = DateFormat('HH:mm a').format(dateclose); // 12/31, 11:59 pm
      marketData.timeClose=formattedDateclose.toString();
      print("timeClose "  +   marketData.timeOpen    +  " "  + marketData.timeClose);
      if(marketData.active)
      {
        marketData.state="متصل";
      }
      else{marketData.state="غير متصل";}

      print(" 7777777777777777777777777777"  + marketData.state );
      list.add(marketData);

  }}
  ).catchError((e) {});

  return list;
}




