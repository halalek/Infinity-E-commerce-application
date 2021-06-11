import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

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
List<ProductData> listfav1 = [];
List<ProductData> list11=[];
//LocationData locationData;
Future<List<ProductData>> getFavority(String IDuser) async {
  listfav.clear();
  List<ProductData> list = [];
  iduser = IDuser;
  await FirebaseFirestore.instance
      .collection("users")
      .doc(IDuser)
      .collection("favorite")
      .get()
      .then((value) {
    for (int i = 0; i < value.docs.length; i++) {
      listfav.add(FavorityData.fromJson(value.docs[i].data()));
    }
  }).catchError((e) {});

  for (int i = 0; i < listfav.length; i++) {
    await FirebaseFirestore.instance
        .collection("product")
        .where(
          "hide",
          isEqualTo: false,
        )
        .where("id", isEqualTo: listfav[i].id)
        .get()
        .then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        list.add(ProductData.fromJson(value.docs[i].data()));
      }
    }).catchError((e) {});
//23d00bb9-1b77-45bc-8bd4-a89d9e42c88b
  }
  listfav1 = list;

  return list;
}

setFavority(ProductData productData) async {
  if (Search(productData)) {
    FavorityData h = new FavorityData();
    h.id = productData.id;
    listfav.add(h);
    await FirebaseFirestore.instance
        .collection("users")
        .doc(iduser)
        .collection("favorite")
        .doc()
        .set({
          "idproduct": productData.id,
        })
        .then((value) {})
        .catchError((e) {});
  }

  //list.add(productData.id);

  // return  await getUser();
}

deleteFavority(ProductData productData) async {
  if (!Search(productData)) {
    FavorityData h = new FavorityData();
    h.id = productData.id;
    listfav.removeWhere((item) => item.id == productData.id);
    print(" listfav.remove(productData.id)" + listfav.length.toString());

    await FirebaseFirestore.instance
        .collection("users")
        .doc(iduser)
        .collection("favorite")
        .where(
          "idproduct",
          isEqualTo: productData.id,
        )
        .get()
        .then((value) {
      value.docs.forEach((element) {
        FirebaseFirestore.instance
            .collection("users")
            .doc(iduser)
            .collection("favorite")
            .doc(element.id)
            .delete()
            .then((value) {
          print("Success!");
        });
      });
    });
  }

  // return  await getUser();
}

bool Search(ProductData productDataa) {
  for (int i = 0; i < listfav.length; i++) {
    if (listfav[i].id == productDataa.id) {
      return false;
    }
  }
  return true;
}

Future<List<ProductData>> getSuggested(List<ProductData> listProductFav) async {
  List<ProductData> list = [];
  List<ProductData> list1=[];
  //List<ProductData> listProductFav1=Remove(listProductFav);
  if(listProductFav.length!=0) {
    for (int i = 0; i < listProductFav.length; i++) {
      await FirebaseFirestore.instance
          .collection("product")
          .where("id_categorize",
          isEqualTo: listProductFav[i].id_categorize.toString())
          .where("hide", isEqualTo: false)
          .get()
          .then((value) {
        for (int j = 0; j < value.docs.length; j++) {
          if (listProductFav[i].id != value.docs[j].id)
            list.add(ProductData.fromJson(value.docs[j].data()));
        }
      }).catchError((e) {});
    }

    list1 = Remove(list);
    if(list1.length == 0)
      {   print("qazqazqazqaz" + list1.length.toString());
      list1=await getSuggestedRandome(listProductFav);
      }
  }

  if(listProductFav.length==0) {
      // await FirebaseFirestore.instance
      //     .collection("product")
      //     .where("hide", isEqualTo: false)
      //     .get()
      //     .then((value) {
      //   for (int j = 0; j < value.docs.length; j++) {
      //       list.add(ProductData.fromJson(value.docs[j].data()));
      //   }
      // }).catchError((e) {});
      //
      // var rng = new Random();
      // for (var i = 0; i < (list.length/2); i++) {
      //   print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" );
      //   print(rng.nextInt(10));
      //   list.removeAt(rng.nextInt(list.length));
      //
      // }
      list1=await getSuggestedRandome(listProductFav);
    }
  return list1;
}





Future<List<ProductData>> getSuggestedRandome(List<ProductData> listProductFav) async {
  List<ProductData> list = [];
  await FirebaseFirestore.instance
      .collection("product")
      .where("hide", isEqualTo: false)
      .get()
      .then((value) {

      for (int j = 0; j < value.docs.length; j++) {
          list.add(ProductData.fromJson(value.docs[j].data()));
      }
  }).catchError((e) {});

  var rng = new Random();
  for (var i = 0; i < (list.length/2); i++) {
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" );
    print(rng.nextInt(10));
    list.removeAt(rng.nextInt(list.length));

  }

  list11=Remove(list);
  return list11;
  }


List<ProductData> Remove(List<ProductData> listProductFav1) {
  List<ProductData> rem = [];

  //أإزالة العناصر  المفضلة
  for (int i = 0; i < listProductFav1.length; i++) {
    for (int j = 0; j < listfav1.length; j++) {
      if (listProductFav1[i].id == listfav1[j].id) {
        rem.add(listProductFav1[i]);
      }
    }
  }

//إزالة العناصر المتكررة

  for (int i = 0; i < listProductFav1.length; i++) {
    for (int j = i + 1; j < listProductFav1.length; j++) {
      if (listProductFav1[i].id == listProductFav1[j].id) {
        rem.add(listProductFav1[i]);
      }
    }
  }

  for (int i = 0; i < rem.length; i++) {
    listProductFav1.remove(rem[i]);
  }

  return listProductFav1;
}
