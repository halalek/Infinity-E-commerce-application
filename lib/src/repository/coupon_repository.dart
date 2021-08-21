import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:structurepublic/src/models/CouponData.dart';
import 'package:structurepublic/src/models/FavorityData.dart';
import 'package:structurepublic/src/models/ProductData.dart';

import '../helpers/custom_trace.dart';
import '../models/setting.dart';

ValueNotifier<Setting> setting = new ValueNotifier(new Setting());
final navigatorKey = GlobalKey<NavigatorState>();
String iduser;
List<CouponData> listCoupon = [];

//LocationData locationData;
Future<List<CouponData>> getCoupon(String IDuser) async {
  listCoupon.clear();
  await FirebaseFirestore.instance//عم جيب أرقام كل المستخدمين
      .collection("coupon")
      .where("iduser",isEqualTo:IDuser)
      .get()
      .then((value) {
    for (int i = 0; i < value.docs.length; i++) {
      listCoupon.add( CouponData.fromJson(value.docs[i].data())); //كل ارقام طلبات
    }
  }).catchError((e) {});

  return listCoupon;
}


Future<List<CouponData>>verifycod(String discount,String IDuser)
async {
  List<CouponData>listCouponVerify=[];
  await FirebaseFirestore.instance//عم جيب أرقام كل المستخدمين
      .collection("coupon")
      .where("iduser",isEqualTo:IDuser).where("iscoupon",isEqualTo: false).where("code",isEqualTo: discount.trim())
      .get()
      .then((value) {
    for (int i = 0; i < value.docs.length; i++) {
      listCouponVerify.add( CouponData.fromJson(value.docs[i].data())); //كل ارقام طلبات
    }
  }).catchError((e) {});

  return listCouponVerify;

}


setCoupon(String id) async {

  await FirebaseFirestore.instance
      .collection("coupon").doc(id)
      .update({
    "iscoupon": true,


  })
      .then((value) {})
      .catchError((e) {});
}


//  addCoupon() async {
//
//   await FirebaseFirestore.instance
//       .collection("coupon").doc().set(
//       {"id":id,//2
//         "iduser":userss.id,//1
//         "code":code,//4
//         "iscoupon":false,//1
//
//
//       }
//
//   )
//       .then((value) {
//   }).catchError((e) {});
//
//
// }