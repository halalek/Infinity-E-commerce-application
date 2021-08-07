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
import 'package:structurepublic/src/models/DemandData.dart';
import 'package:structurepublic/src/models/FavorityData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';

import 'package:uuid/uuid.dart';

import '../helpers/custom_trace.dart';
import '../models/setting.dart';

ValueNotifier<Setting> setting = new ValueNotifier(new Setting());
final navigatorKey = GlobalKey<NavigatorState>();

final  List<Product> listtor = [];
DemandData d=new DemandData();
Product p=new Product();
 List<int> tt=[];
final List<DemandData> listdam = [];
List<DemandData> listdam1 = [];

String iduser;
 int total=0;
String b=" ";



setTrollery(ProductData productData, int count, MarketData marketData)async {

  Product p=new Product();
if(b!=" "&& d.idMarket!=marketData.id)
  {
     d = new DemandData();
    d.product=[];
     tt=[];
     total=0;
     p.nameAr = productData.nameAr;
     p.nameEn = productData.nameEn;
     p.descriptionAr = productData.description_ar;
     p.descriptionEn = productData.description_en;
     p.image = productData.image;
     p.id = productData.id;
     p.number = count;
     p.priceTotal = productData.price;
     tt.add(p.priceTotal);
     p.note = productData.note;
     d.idMarket = marketData.id;
     b = d.idMarket;
     d.idAdmins = marketData.owners;
     d.idWorker = ' ';
     d.done = false;
     d.remove = false;
     d.id= Uuid().v4();
     d.rating = 0;
     d.timesTampCreat = DateTime
         .now()
         .microsecondsSinceEpoch;
     d.stateAr = "مرسل";
     d.stateEn = "send";

     d.iscoupon=false;
     SharedPreferences preferences = await SharedPreferences.getInstance();
     d.idUser = preferences.getString('userID');


     d.product.add(p);
     print("KKKKKKKKKKKKKKKKKKKKKKKKKKKK}");
     print(300);
     print("KKKKKKKKKKKKKKKKKKKKKKKKKKKK}");

  }
else {
  p.nameAr = productData.nameAr;
  p.nameEn = productData.nameEn;
  p.descriptionAr = productData.description_ar;
  p.descriptionEn = productData.description_en;
  p.image = productData.image;
  p.id = productData.id;
  p.number = count;
  p.priceTotal = productData.price;
  tt.add(p.priceTotal);
  p.note = productData.note;
  d.idMarket = marketData.id;
  b = d.idMarket;
  d.idAdmins = marketData.owners;
  d.idWorker = ' ';
  d.done = false;
  d.remove = false;
  d.rating = 0;
  d.timesTampCreat = DateTime
      .now()
      .microsecondsSinceEpoch;
  d.stateAr = "مرسل";
  d.stateEn = "send";
  d.id= Uuid().v4();
  d.iscoupon=false;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  d.idUser = preferences.getString('userID');


  d.product.add(p);
}
}


void price()
{


  for (int i = 0; i <  d.product.length; i++) {

    d.product[i].priceTotal= tt[i] *d.product[i].number;

  }

}
void set()
{
  d = new DemandData();
  p = new Product();
  d.product=[];
}


int sum(){
  total=0;
  for (int i = 0; i <  d.product.length; i++) {
    d.priceTotal= total + d.product[i].priceTotal;
    total=d.priceTotal;
  }
 return d.priceTotal;
}
int clear(){

  for (int i = 0; i <  d.product.length; i++) {
    if(d.product[i].number==0){
  d.product.removeAt(i);
  }}

}
void remov()
{
  for (int i = 0; i < listtor.length; i++) {
    listtor.removeAt(i);
  }
}
void postDamandNode(DemandData demandData)async{
  var url = Uri.parse('https://infinityserver2020.herokuapp.com/demand/user/post/');
  var response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'done':false,
      'product' : demandData.product.map((v) => v.toJson()).toList(),
      'id': demandData.id,
      'id_user':demandData.idUser,
      'id_worker':" ",
      'id_market': demandData.idMarket,
      'id_admins':demandData.idAdmins,
      'state_ar':demandData.stateAr,
      'state_en': demandData.stateEn,
      'remove': false,
      'timesTampdemand': 0,
      'timesTampCreat': demandData.timesTampCreat,
      'priceTotal':demandData.priceTotal,
      'rating':0,
      'notification':false,

      'iscoupon':demandData.iscoupon,




    }),
  );
  print(response.body.toString());
}








Future<List<DemandData >> gettollery(String IDuser) async {
  listdam.clear();
  List<DemandData> list = [];
  iduser = IDuser;
  print("TTTTTTTTTTTTTTT<");
  await FirebaseFirestore.instance
      .collection("users")
      .doc(IDuser)
      .collection("demand")
      .get()
      .then((value) {
    print("TTTTTTTTTTTTTTT<<");
    print(value.docs.length);
    for (int i = 0; i < value.docs.length; i++) {
      listdam.add(DemandData.fromJson(value.docs[i].data()));
      print("TTTTTTTTTTTTTTT");
      print(listdam[i]);

    }
  }).catchError((e) {});

  for (int i = 0; i < listdam.length; i++) {
    await FirebaseFirestore.instance
        .collection("myDemand")
        .where("id", isEqualTo: listdam[i].id)
        .get()
        .then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        list.add(DemandData.fromJson(value.docs[i].data()));
        print("TTTTTTTTTTTTTTT");
        print(value.docs[i].data());
      }
    }).catchError((e) {});
 }
  listdam1 = list;
  return list;
}

settollery(DemandData demandData) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  iduser = preferences.getString('userID');
    DemandData h = new DemandData();
    h.id = demandData.id;
    listdam.add(h);

    await FirebaseFirestore.instance
        .collection("users")
        .doc(iduser)
        .collection("demand")
        .doc()
        .set({
      "id":  h.id,
    })
        .then((value) {})
        .catchError((e) {});


  //list.add(productData.id);

  // return  await getUser();
}

Future<MarketData> getmarket(DemandData demandData) async {
  MarketData marketData=MarketData();
  FirebaseFirestore.instance
      .collection("market").where("id", isEqualTo:demandData.idMarket).get()
      .then((value) {
    marketData=value as MarketData;
  }
      ).catchError((e) {});
  return marketData;
  }
