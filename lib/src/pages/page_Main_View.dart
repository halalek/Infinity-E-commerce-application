import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/elements/cardSection.dart';
import 'package:structurepublic/src/pages/vereible.dart';


class PageMain extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageMain();
  }

}


class  _PageMain extends StateMVC<PageMain>
{
  PageMainController _con;

  _PageMain() : super( PageMainController()) {
    // _con = controller;
    _con = controller;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      color:dark,
      child: ListView.builder(
          itemCount: _con.listSection.length,
          itemBuilder: (context, i) {

            return CardWidget(sectionData: _con.listSection[i],);
          },
        ),);}}






