
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/controler/page_market_controller.dart';
import 'package:structurepublic/src/controler/page_story_sold_controller.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/models/SoldData.dart';
import 'package:structurepublic/src/pages/categorizeView.dart';
import 'package:structurepublic/src/pages/pageSoldDetail.dart';
import 'package:structurepublic/src/pages/vereible.dart';

int i=0;
int finit=0;

class MoreStories extends StatefulWidget {
  SoldData _soldData;

  MoreStories(this._soldData);

  @override
  _MoreStoriesState createState() => _MoreStoriesState(this._soldData);
}

class _MoreStoriesState extends StateMVC<MoreStories> {
  SoldData _soldData;
  double parcent = 0.0;
  Timer _timer;
  PageSoldStoryController _con;


  void startTimer() {
    _timer = Timer.periodic(Duration(microseconds: 3000), (timer) {
      if (parcent <= 1) {
        setState(() {
          parcent += 0.001;
          if(i==0)
            { finit = _con.listSold.length;
          }
          // if(i!=0)
          //   {i++;}

          if (parcent > 1 && (i++) < finit)   {
            _timer.cancel();
           // ++i;
           // Navigator.pop(context);
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MoreStories(_con.listSold[i])));
          }
          if ((i+1) > (finit) && i!=0) {
           // _timer.cancel();
            // Navigator.pop(context);
            finit=0;
            parcent=0.0;
            i=0;
            Navigator.pop(context);
          }
        });
      }
    });
  }


  _MoreStoriesState(this._soldData) : super(PageSoldStoryController(_soldData)) {
    // _con = controller;
    _con = controller;
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
    return Scaffold(
        body:


        Stack(children: [
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
                      CachedNetworkImageProvider(_soldData.image_icon),
                      radius: 20.0,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      _soldData.name_market_ar,
                      style: TextStyle(fontSize: 18.0),
                    )
                  ],
                ),
                ListTile(
                  title: Text(
                    _soldData.name_ar,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(_soldData.description_ar,
                      style:
                      TextStyle(fontSize: 14)),
                  trailing: Text(
                    _soldData.price.toString(),
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
                          _soldData.image,
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SoldDetail(_soldData)));
                    },
                  ),
                ),


              ],
            ),
          ),

          // StoryView(
          //   storyItems: [
          //     // StoryItem.text(
          //     //   title: "Nice!\n\nTap to continue.",
          //     //   backgroundColor: Colors.red,
          //     //   textStyle: TextStyle(
          //     //     fontFamily: 'Dancing',
          //     //     fontSize: 40,
          //     //   ),
          //     // ),
          //
          //     StoryItem.pageImage(
          //       url: _soldData.image,
          //       caption:_soldData.description_ar ,
          //       controller: storyController,
          //     ),
          //     // StoryItem.pageImage(
          //     //     url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
          //     //     caption: "Working with gifs",
          //     //     controller: storyController),
          //     // StoryItem.pageImage(
          //     //   url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
          //     //   caption: "Hello, from the other side",
          //     //   controller: storyController,
          //     // ),
          //     // StoryItem.pageImage(
          //     //   url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
          //     //   caption: "Hello, from the other side2",
          //     //   controller: storyController,
          //     // ),
          //   ],
          //   onStoryShow: (s) {
          //     print("Showing a story");
          //   },
          //   onComplete: () {
          //     print("Completed a cycle");
          //   },
          //   progressPosition: ProgressPosition.top,
          //   repeat: false,
          //   controller: storyController,
          // ),
        ]));
  }
}
















// class MoreStories extends StatefulWidget {
//   SoldData _soldData;
//
//   MoreStories(this._soldData);
//
//   @override
//   _MoreStoriesState createState() => _MoreStoriesState(this._soldData);
// }
//
// class _MoreStoriesState extends State<MoreStories> {
//   SoldData _soldData;
//   double parcent = 0.0;
//   Timer _timer;
//
//   void startTimer() {
//     _timer = Timer.periodic(Duration(microseconds: 3000), (timer) {
//       if (parcent <= 1) {
//         setState(() {
//           parcent += 0.001;
//           if (parcent > 1) {
//             _timer.cancel();
//             Navigator.pop(context);
//           }
//         });
//       }
//     });
//   }
//
//   _MoreStoriesState(this._soldData);
//
//   final storyController = StoryController();
//
//   @override
//   void initState() {
//     startTimer();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     storyController.dispose();
//     _timer.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body:
//
//
//         Stack(children: [
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 36.0, horizontal: 8.0),
//             child: Column(
//               children: [
//                 LinearProgressIndicator(
//                   value: parcent,
//                 ),
//                 SizedBox(
//                   height: 8.0,
//                 ),
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundImage:
//                       CachedNetworkImageProvider(_soldData.image_icon),
//                       radius: 20.0,
//                     ),
//                     SizedBox(
//                       width: 8.0,
//                     ),
//                     Text(
//                       _soldData.name_market_ar,
//                       style: TextStyle(fontSize: 18.0),
//                     )
//                   ],
//                 ),
//                 ListTile(
//                   title: Text(
//                     _soldData.name_ar,
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text(_soldData.description_ar,
//                       style:
//                       TextStyle(fontSize: 14)),
//                   trailing: Text(
//                     _soldData.price.toString(),
//                     style: TextStyle(
//                         fontSize: 18.0,
//                         color: Theme.of(context).primaryColorDark),
//                   ),
//                 ),
//
//
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Container(
//                   width: double.infinity,
//                   height: 250,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: CachedNetworkImageProvider(
//                           _soldData.image,
//                         ),
//                         fit: BoxFit.cover,
//                       )),
//                 ),
//                 SizedBox(
//                   height: 60.0,
//                 ),
//                 ShapeOfView(
//                   shape: CircleShape(
//                     borderColor: Colors.white, //optional
//                     borderWidth: 2, //optional
//                   ),
//                   child: GestureDetector(child:
//                   Icon(Icons.local_grocery_store,size: 40,color: Theme.of(context).primaryColorDark,),
//                     onTap: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => SoldDetail(_soldData)));
//                     },
//                   ),
//                 ),
//
//
//               ],
//             ),
//           ),
//
//           // StoryView(
//           //   storyItems: [
//           //     // StoryItem.text(
//           //     //   title: "Nice!\n\nTap to continue.",
//           //     //   backgroundColor: Colors.red,
//           //     //   textStyle: TextStyle(
//           //     //     fontFamily: 'Dancing',
//           //     //     fontSize: 40,
//           //     //   ),
//           //     // ),
//           //
//           //     StoryItem.pageImage(
//           //       url: _soldData.image,
//           //       caption:_soldData.description_ar ,
//           //       controller: storyController,
//           //     ),
//           //     // StoryItem.pageImage(
//           //     //     url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
//           //     //     caption: "Working with gifs",
//           //     //     controller: storyController),
//           //     // StoryItem.pageImage(
//           //     //   url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
//           //     //   caption: "Hello, from the other side",
//           //     //   controller: storyController,
//           //     // ),
//           //     // StoryItem.pageImage(
//           //     //   url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
//           //     //   caption: "Hello, from the other side2",
//           //     //   controller: storyController,
//           //     // ),
//           //   ],
//           //   onStoryShow: (s) {
//           //     print("Showing a story");
//           //   },
//           //   onComplete: () {
//           //     print("Completed a cycle");
//           //   },
//           //   progressPosition: ProgressPosition.top,
//           //   repeat: false,
//           //   controller: storyController,
//           // ),
//         ]));
//   }
// }
