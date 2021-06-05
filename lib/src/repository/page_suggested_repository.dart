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
import 'package:structurepublic/src/models/FavorityData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';

import '../helpers/custom_trace.dart';
import '../models/setting.dart';

ValueNotifier<Setting> setting = new ValueNotifier(new Setting());
final navigatorKey = GlobalKey<NavigatorState>();
String iduser;
final List<FavorityData> listfav = [];

//LocationData locationData;
Future<List<ProductData>> getSuggested(String IDuser) async {
  listfav.clear();
  List<ProductData> list = [];
  iduser=IDuser;
  await FirebaseFirestore.instance
      .collection("users").doc(IDuser).collection("favorite").get()
      .then((value) {
    for (int i = 0; i < value.docs.length; i++) {
      listfav.add(FavorityData.fromJson(value.docs[i].data()));
    }
  }
  ).catchError((e) {});

  for (int i = 0; i < listfav.length; i++) {
    await FirebaseFirestore.instance
        .collection("product").where("hide", isEqualTo: false,).where(
        "id", isEqualTo:listfav[i].id).get()
        .then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        list.add(ProductData.fromJson(value.docs[i].data()));
      }
    }
    ).catchError((e) {});
//23d00bb9-1b77-45bc-8bd4-a89d9e42c88b
  }
  return list;
}


setFavority(ProductData productData) async {
  if(Search(productData)){
    FavorityData h=new FavorityData();
    h.id=productData.id;
    listfav.add(h);
    await FirebaseFirestore.instance
        .collection("users").doc(iduser).collection("favorite").doc().set(
        {"idproduct":productData.id,

        }

    )
        .then((value) {
    }).catchError((e) {});
  }

  //list.add(productData.id);

  // return  await getUser();


}

deleteFavority(ProductData productData) async {
  if(!Search(productData)){
    FavorityData h=new FavorityData();
    h.id=productData.id;
    listfav.removeWhere((item) => item.id == productData.id);
    print(" listfav.remove(productData.id)" + listfav.length.toString() );

    await FirebaseFirestore.instance
        .collection("users").doc(iduser).collection("favorite").where(
      "idproduct", isEqualTo: productData.id,).get().then((value) {
      value.docs.forEach((element) {
        FirebaseFirestore.instance.collection("users").doc(iduser).collection(
            "favorite").doc(element.id).delete().then((value) {
          print("Success!");
        });
      });
    });
  }



  // return  await getUser();


}

bool Search(ProductData productDataa)  {

  for (int i = 0; i < listfav.length; i++) {
    if(listfav[i].id == productDataa.id)
    {print("faaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");return false ;}
  }
  return true;
}

// ignore: non_constant_identifier_names, missing_return
