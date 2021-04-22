import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/controler/varify_controller.dart';

import '../helpers/custom_trace.dart';
import '../models/setting.dart';

ValueNotifier<Setting> setting = new ValueNotifier(new Setting());
final navigatorKey = GlobalKey<NavigatorState>();

//LocationData locationData;

Future<User> logintSettings(String email, String password) async {
  var result = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
  //  return result;
  if (result != null) {
    return result.user;
  } else {
    return null;
  }
}


Future<User>  signuptSettings(String email, String password) async {
  var result = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);
  //  return result;
  if (result != null) {
    return result.user ;
  } else {
    return null;
  }
}




