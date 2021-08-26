import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:structurepublic/src/controler/page_chat_user_controller.dart';
import 'package:structurepublic/src/controler/page_market_controller.dart';
import 'package:structurepublic/src/controler/page_trollery_controller.dart';
import 'package:structurepublic/src/elements/cardChat.dart';
import 'package:structurepublic/src/elements/cardmarketWidget.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/repository/page_trollery_repository.dart';

import '../../main.dart';

class PageChatUser extends StatefulWidget
{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageChatUser();
  }
}

class  _PageChatUser extends StateMVC<PageChatUser>
{
  PageChatUserController _con2;

  _PageChatUser() : super( PageChatUserController()) {
    // _con = controller;
    _con2 = controller;
  }

  @override
  Widget build(BuildContext context) {



    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text( language1=="en" ? "chat" : "المحادثة",style: TextStyle(color: Theme.of(context).primaryColorDark),),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      ),
      body: ListView.builder(
          itemCount: _con2.listMarket.length,
          // itemBuilder: (context, i) {
          //      return CardMarketWidget(marketData: _con2.listMarket[i],);
          //
          // },
          itemBuilder: (BuildContext context, int index) =>
              CardChatWidget(marketData: _con2.listMarket[index],)
      ),

    ) ;
  }

}





