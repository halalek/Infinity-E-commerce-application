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

import '../../main.dart';


class CardStorySoldWidget extends StatefulWidget {
  SoldData _soldData;

  CardStorySoldWidget(this._soldData);

  @override
  _CardStorySoldWidget createState() => _CardStorySoldWidget(this._soldData);
}


class _CardStorySoldWidget extends State<CardStorySoldWidget>  {
  final SoldData soldData;
  double parcent = 0.0;
  Timer _timer;

  _CardStorySoldWidget( this.soldData);


  void startTimer() {
    _timer = Timer.periodic(Duration(microseconds: 3000), (timer) {
      if (parcent <= 1) {
        setState(() {
          parcent += 0.001;
          if (parcent > 1) {
            _timer.cancel();
            Navigator.pop(context);
          //  Navigator.push(context, MaterialPageRoute(builder: (context) => CardStorySoldWidget(soldData)));
            //parcent=0.0;
          }
        });
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 36.0, horizontal: 8.0),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: parcent,
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                  CachedNetworkImageProvider(soldData.image_icon),
                  radius: 20.0,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(language1=="en" ? soldData.name_market_en :
                  soldData.name_market_ar,
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ),
            ListTile(
              title: Text(
                language1=="en" ? soldData.name_en : soldData.name_ar,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(language1=="en" ? soldData.description_en : soldData.description_ar,
                  style:
                  TextStyle(fontSize: 14)),
              trailing: Text(
                soldData.price.toString(),
                style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).primaryColorDark),
              ),
            ),


            SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      soldData.image,
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              height: 60.0,
            ),
            ShapeOfView(
              shape: CircleShape(
                borderColor: Colors.white, //optional
                borderWidth: 2, //optional
              ),
              child: GestureDetector(child:
              Icon(Icons.local_grocery_store,size: 40,color: Theme.of(context).primaryColorDark,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SoldDetail(soldData)));
                },
              ),
            ),


          ],
        ),
      ),

    ]
    );
  }



}


//
//
//
//
// class CardStorySoldWidget extends StatelessWidget  {
//   final SoldData soldData;
//   double parcent = 0.0;
//   Timer _timer;
//
//   CardStorySoldWidget( this.soldData);
//
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       Padding(
//         padding: EdgeInsets.symmetric(vertical: 36.0, horizontal: 8.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(
//                   backgroundImage:
//                   CachedNetworkImageProvider(soldData.image_icon),
//                   radius: 20.0,
//                 ),
//                 SizedBox(
//                   width: 8.0,
//                 ),
//                 Text(
//                   soldData.name_market_ar,
//                   style: TextStyle(fontSize: 18.0),
//                 )
//               ],
//             ),
//             ListTile(
//               title: Text(
//                 soldData.name_ar,
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(soldData.description_ar,
//                   style:
//                   TextStyle(fontSize: 14)),
//               trailing: Text(
//                 soldData.price.toString(),
//                 style: TextStyle(
//                     fontSize: 18.0,
//                     color: Theme.of(context).primaryColorDark),
//               ),
//             ),
//
//
//             SizedBox(
//               height: 20.0,
//             ),
//             Container(
//               width: double.infinity,
//               height: 250,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: CachedNetworkImageProvider(
//                       soldData.image,
//                     ),
//                     fit: BoxFit.cover,
//                   )),
//             ),
//             SizedBox(
//               height: 60.0,
//             ),
//             ShapeOfView(
//               shape: CircleShape(
//                 borderColor: Colors.white, //optional
//                 borderWidth: 2, //optional
//               ),
//               child: GestureDetector(child:
//               Icon(Icons.local_grocery_store,size: 40,color: Theme.of(context).primaryColorDark,),
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => SoldDetail(soldData)));
//                 },
//               ),
//             ),
//
//
//           ],
//         ),
//       ),
//
//     ]
//     );
//   }
//
//
//
// }
