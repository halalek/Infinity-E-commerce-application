import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_linkify/linkify.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

class LinkifyExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // title: 'flutter_linkify example',
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(child:  new RaisedButton(
              onPressed: _launchURL,
              child: new Text('Show Infinity Website'),
            ),),


          ],
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://sites.google.com/view/h12a/%D8%AD%D9%88%D9%84-%D8%A7%D9%84%D8%AA%D8%B7%D8%A8%D9%8A%D9%82?read_current=1';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}