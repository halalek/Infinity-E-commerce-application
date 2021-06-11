import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/controler/page_market_controller.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/models/SoldData.dart';
import 'package:structurepublic/src/pages/categorizeView.dart';
import 'package:structurepublic/src/pages/pageSold.dart';
import 'package:structurepublic/src/pages/pageSoldDetail.dart';
import 'package:structurepublic/src/pages/pageStorySold.dart';
import 'package:structurepublic/src/pages/vereible.dart';

class CardStorySoldWidget extends StatelessWidget {
  CardStorySoldWidget({Key key, this.soldData}) : super(key: key);
  final StoryController controllerr = StoryController();
  final SoldData soldData;

  @override
  Widget build(BuildContext context) {
    return

        Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Row(children: [
          InkWell(
            child: ShapeOfView(
                shape: ArcShape(
                    direction: ArcDirection.Outside,
                    height: 20,
                    position: ArcPosition.Bottom
                ),
    child:
    Container(
              //    width:110,
              // height: 150,
              margin: EdgeInsets.only(left: 6.0, right: 6.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(soldData.image),
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white70,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.black12, //pink
                ),
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: 130.0, minHeight: 40.0, maxHeight: 160),
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    backgroundImage:
                        CachedNetworkImageProvider(soldData.image_icon),
                    // Text(
                    // soldData.name_market_ar,
                    // textAlign: TextAlign.center,
                    // style: TextStyle(color: Colors.white, fontSize: 20),
                    // ),
                  ),
                ),
              ),
            )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MoreStories(soldData) //ProductDetail(productData,categorizeDataa)
                      ));
            },
          )
        ]),
        // Row(children: [
        //   Container(
        //     // margin: EdgeInsets.only(left: 15),
        //     child: Center(
        //       child: Text(
        //         soldData.name_market_ar,
        //         style: TextStyle(
        //           fontSize: 15,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //
        //     ),
        //   ),
        //
        // ]
        // ),
      ],
    );
  }
}

