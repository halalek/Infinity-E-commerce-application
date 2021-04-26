import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:structurepublic/src/controler/logout_controller.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/controler/shared.dart';
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
      //  ),

  //       bottomNavigationBar: BottomNavigationBar(
  //         currentIndex:  point,
  //         selectedFontSize: 13,
  //         selectedItemColor: Theme.of(context).primaryColorLight,
  //         unselectedItemColor: Colors.black45,
  //         unselectedFontSize: 5,
  //         items: [
  //           BottomNavigationBarItem(
  //             icon: Icon(
  //               Icons.home,
  //               //  color: Colors.black45,
  //             ),
  //             title: Text(
  //               "الرئيسية",
  //               // style: TextStyle(color: Colors.black45),
  //             ),
  //             backgroundColor: Colors.white38,
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(
  //               Icons.local_grocery_store,
  //               //  color: Theme.of(context).primaryColorLight,
  //             ),
  //             title: Text(
  //               "التسوق",
  //               //  style: TextStyle(color: Theme.of(context).primaryColorLight),
  //             ),
  //             // backgroundColor:Colors.white38,
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(
  //               Icons.show_chart,
  //               // color: Colors.black45,
  //             ),
  //             title: Text(
  //               "العروض",
  //               //  style: TextStyle(color: Colors.black45),
  //             ),
  //             //  backgroundColor:Colors.white38,
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(
  //               Icons.person,
  //               // color: Colors.black45,
  //             ),
  //             title: Text(
  //               "حسابك",
  //               //   style: TextStyle(color: Colors.black45),
  //             ),
  //             // backgroundColor:Colors.white38,
  //           ),
  //         ],
  //         onTap: (index) {
  //           setState(() {
  //             point=index;
  //             if(point==3)
  //             {
  //              // navigetor1("app");
  //               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogoutController(),),);
  //               //  Navigator.pop(context);
  //             }
  //



