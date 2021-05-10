import 'package:flutter/material.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/pages/marketView.dart';

import 'cardmarketWidget.dart';

class CardFavoriteWidget extends StatelessWidget {
  const CardFavoriteWidget({Key key}) : super(key: key);

// تستبدل بكلاس خاص بالمفضلة


  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 200,
      width: double.maxFinite,
      child:
      Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child:  GestureDetector(child: Container(
          child:
          Center(
            child: IconButton(
              icon: Icon(Icons.favorite_border),
            ),
          ),




          decoration: BoxDecoration(
            image: DecorationImage(
              image: new NetworkImage("assets/img/logo.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
          onTap: () {

            // Navigator.push(context, MaterialPageRoute(builder: (context) => PageMarket() ) );
          },
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),

      ),
    );
  }
}


