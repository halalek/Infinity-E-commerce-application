import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:structurepublic/src/controler/logout_controller.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/controler/shared.dart';
import 'package:structurepublic/src/controler/user_controller.dart';
import 'package:structurepublic/src/elements/cardSection.dart';
import 'package:structurepublic/src/pages/pageSold.dart';
import 'package:structurepublic/src/pages/page_1.dart';
import 'package:structurepublic/src/pages/profil.dart';
import 'package:structurepublic/src/pages/startView.dart';
import 'package:structurepublic/src/pages/vereible.dart';

class PageMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    bool comparison;
    return _PageMain();
  }
}

class _PageMain extends StateMVC<PageMain> {
  int point = 1;
  PageMainController _con;

  _PageMain() : super(PageMainController()) {
    // _con = controller;
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        //  color: dark,
          child: ListView.builder(
            itemCount: _con.listSection.length,
            itemBuilder: (context, i) {
              return CardWidget(
                sectionData: _con.listSection[i],
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: point,
          selectedFontSize: 15,
          selectedItemColor: Theme.of(context).primaryColorDark,
          unselectedItemColor: Colors.black45,
          unselectedFontSize: 5,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                // color: Theme.of(context).primaryColorLight,
              ),
              title: Text(
                "الرئيسية",
                //   style: TextStyle(color: Theme.of(context).primaryColorLight),
              ),
              backgroundColor: Colors.white38,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_grocery_store,
                //  color: Colors.black45,
              ),
              title: Text(
                "التسوق",
                //  style: TextStyle(color: Colors.black45),
              ),
              // backgroundColor:Colors.white38,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.show_chart,
                //color: Colors.black45,
              ),
              title: Text(
                "العروض",
                // style: TextStyle(color: Colors.black45),
              ),
              //  backgroundColor:Colors.white38,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                // color: Colors.black45,
              ),
              title: Text(
                "حسابك",
                // style: TextStyle(color: Colors.black45),
              ),
              // backgroundColor:Colors.white38,
            ),
          ],
          onTap: (index) {
            setState(() {
              point = index;

              if (point == 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StartMain(),
                  ),
                );
              }
              if (point == 2) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageSold(),
                  ),
                );
              }

              if (point == 3) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              }
            });
          },
        ));
    // TODO: implement build
  }
}
