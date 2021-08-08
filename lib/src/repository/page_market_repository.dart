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
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/SectionData.dart';

import '../helpers/custom_trace.dart';
import '../models/setting.dart';
import 'package:intl/intl.dart';

ValueNotifier<Setting> setting = new ValueNotifier(new Setting());
final navigatorKey = GlobalKey<NavigatorState>();
bool bz=false;
//LocationData locationData;
Future<List<MarketData>> getMarket(SectionData sectionData) async {
  List<MarketData> list = [];

  // DateTime now = DateTime.now();
  // DateFormat formatter = DateFormat('HH');
  // final String formatted = formatter.format(now);
  //
  // DateFormat formatterminit = DateFormat('mm');
  // final String formattedminit = formatterminit.format(now);


  await FirebaseFirestore.instance
      .collection("market").where("id_section",isEqualTo:sectionData.id.toString()).where("hide",isEqualTo:false).get()
      .then((value) {
   for(int i=0;i<value.docs.length;i++){
     MarketData marketData=MarketData.fromJson(value.docs[i].data());
//
      int timeInMillisopen = marketData.timesTampOpen;
      int timeInMillisclose = marketData.timesTampClose;
      var date = DateTime.fromMicrosecondsSinceEpoch(timeInMillisopen);
     var formattedDate = DateFormat('HH:mm a').format(date); // 12/31, 11:59 pm
//
//
     marketData.timeOpen=formattedDate.toString();
//      var timeopenhour=DateFormat('HH ').format(date);
//      var timeopenminit=DateFormat('mm ').format(date);
      var dateclose = DateTime.fromMicrosecondsSinceEpoch(timeInMillisclose);
      var formattedDateclose = DateFormat('HH:mm a').format(dateclose); // 12/31, 11:59 pm
      marketData.timeClose=formattedDateclose.toString();
      print("timeClose "  +   marketData.timeOpen    +  " "  + marketData.timeClose);
      if(marketData.active)
        {
          marketData.state="متصل";
        }
      else{marketData.state="غير متصل";}
//      var timeclose=DateFormat('HH ').format(dateclose);
//      var timecloseminit=DateFormat('mm ').format(dateclose);
//      print(" formattedDateopen   " +   formattedDate   +  "   formattedDateclose  " +   formattedDateclose );
//
//
//      print(" nowwwww  " +   formatted);
//      print("nowwwwwwwwwww"  + formattedminit );
//       print(" open hour " +   double.parse(timeopenhour).toString() + "open minit" + double.parse(timeopenminit).toString());
//      print(" close hour " +   double.parse(timeclose).toString() + "close minit" + double.parse(timecloseminit).toString());
//
//
//  if(  (double.parse(timeopenhour) == double.parse(formatted) ) )
//   {
//     if( (double.parse(timeopenminit) <= double.parse(formattedminit) ) )
//       {print(" open ");
//       marketData.state="متصل";
//       bz=true;}
//
//   }
//
// if(   (double.parse(timeclose) == double.parse(formatted) ))
// {
//   if( (double.parse(timecloseminit) > double.parse(formattedminit) ) )
//   {print(" open ");
//   marketData.state="متصل";}
//
// }
//
//      else if( ((double.parse(timeopenhour) < double.parse(formatted) )  &&  (double.parse(timeclose) > double.parse(formatted) )))
//      { print(" open ");
//      print("aaaaaaaa");
//      marketData.state="متصل";
//      bz=true;
//      }
//
// else
//   {
//     marketData.state="غير متصل ";
//   }
print(" 7777777777777777777777777777"  + marketData.state );
     list.add(marketData);

    }

      }
  ).catchError((e) {});

  return list;
}





// await FirebaseFirestore.instance
//     .collection("market").where("owners",arrayContains:userss.id.toString()).get()
//     .then((value) {
// for(int i=0;i<value.docs.length;i++){
// list.add(MarketData.fromJson(value.docs[i].data()));
// }}
// )


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
