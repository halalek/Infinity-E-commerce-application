import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:structurepublic/src/controler/page_market_controller.dart';
import 'package:structurepublic/src/controler/page_sold_controller.dart';
import 'package:structurepublic/src/elements/cardSold.dart';
import 'package:structurepublic/src/elements/cardStorySold.dart';
import 'package:structurepublic/src/elements/cardmarketWidget.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/pages/page_Main_View.dart';
import 'package:structurepublic/src/pages/profil.dart';
import 'package:structurepublic/src/pages/startView.dart';

class PageSold extends StatefulWidget {
  PageSold();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageSold();
  }
}

class _PageSold extends StateMVC<PageSold> {
  int point = 2;
  PageSoldController _con;

  _PageSold() : super(PageSoldController()) {
    // _con = controller;
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(" العروض "),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body:   ListView.builder(
            itemCount: _con.listSold.length,
            itemBuilder: (BuildContext context, int index) => ShapeOfView(
              shape: ArcShape(
                  direction: ArcDirection.Inside,
                  height: 20,
                  position: ArcPosition.Bottom),
              child: CardSoldWidget(
                soldData: _con.listSold[index],
              ),
            )),
          // ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: _con.listSold.length,
          //       itemBuilder: (BuildContext context, int index) =>
          //             CardStorySoldWidget(soldData: _con.listSold[index],),
          //           ),



          // CarouselSlider(
          //   items: [
          //     // CardFavoriteWidget()
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: <Widget>[
          //         Expanded(
          //           child: ListView.builder(
          //             scrollDirection: Axis.horizontal,
          //             itemCount: _con.listSold.length,
          //             itemBuilder: (BuildContext context, int index) =>
          //                 CardStorySoldWidget(
          //               soldData: _con.listSold[index],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //     //1st Image of Slider
          //   ],
          //
          //   //Slider Container properties
          //   options: CarouselOptions(
          //     height: 160.0,
          //     //enlargeCenterPage: true,
          //     // autoPlay: true,
          //     aspectRatio: 16 / 9,
          //     autoPlayCurve: Curves.fastOutSlowIn,
          //     enableInfiniteScroll: false,
          //     // autoPlayAnimationDuration: Duration(milliseconds: 800),
          //     viewportFraction: 0.8,
          //   ),
          // ),








//       ListView(
//         scrollDirection: Axis.horizontal,
//         children: [//_______________________________________________________________________________
//     //   Container(
//     //     margin: EdgeInsets.all(8),
//     //     child: ListView.builder(
//     //
//     //         itemCount: _con.listSold.length,
//     //         itemBuilder: (BuildContext context, int index) =>
//     //             ShapeOfView(
//     //               shape: ArcShape(
//     //                   direction: ArcDirection.Inside,
//     //                   height: 20,
//     //                   position: ArcPosition.Bottom
//     //               ),
//     //               child:
//     //               CardSoldWidget(soldData: _con.listSold[index],),
//     //             )
//     //     ),
//     //
//     // ),
//
// // ------------------------------------------------------------------------------------------------------
//
//
//       //_____________________________________________________________
//       Column(children: [
//         Container(
//           height: 200,
//           width: 150,
//           child:
//           StoryView(
//             controller: controllerr,
//             storyItems: [
//               // StoryItem.text(
//               //   title:
//               //   "Hello world!\nHave a look at some great Ghanaian delicacies. I'm sorry if your mouth waters. \n\nTap!",
//               //   backgroundColor: Colors.orange,
//               //   roundedTop: true,
//               // ),
//               // StoryItem.inlineImage(
//               //   NetworkImage(
//               //       "https://image.ibb.co/gCZFbx/Banku-and-tilapia.jpg"),
//               //   caption: Text(
//               //     "Banku & Tilapia. The food to keep you charged whole day.\n#1 Local food.",
//               //     style: TextStyle(
//               //       color: Colors.white,
//               //       backgroundColor: Colors.black54,
//               //       fontSize: 17,
//               //     ),
//               //   ),
//               // ),
//
//               StoryItem.inlineImage(
//                 url:
//                 "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
//                 controller: controllerr,
//                 caption: Text(
//                   "الزين",
//                   style: TextStyle(
//                     color: Colors.white,
//                     backgroundColor: Colors.black54,
//                     fontSize: 17,
//                   ),
//                 ),
//               ),
//               // StoryItem.inlineImage(
//               //   url:
//               //   "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
//               //   controller: controllerr,
//               //   caption: Text(
//               //     "Hektas, sektas and skatad",
//               //     style: TextStyle(
//               //       color: Colors.white,
//               //       backgroundColor: Colors.black54,
//               //       fontSize: 17,
//               //     ),
//               //   ),
//               // )
//             ],
//             onStoryShow: (s) {
//               print("Showing a story");
//             },
//             onComplete: () {
//               print("Completed a cycle");
//             },
//             progressPosition: ProgressPosition.bottom,
//             repeat: false,
//             inline: true,
//           ),
//       ),
//           Material(
//             child: InkWell(
//               onTap: () {
//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => MoreStories()));
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.black54,
//                     borderRadius:
//                     BorderRadius.vertical(bottom: Radius.circular(8))),
//                 padding: EdgeInsets.symmetric(vertical: 8),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Icon(
//                       Icons.arrow_forward,
//                       color: Colors.white,
//                     ),
//                     SizedBox(
//                       width: 16,
//                     ),
//                     Text(
//                       "المزيد من العروض ",
//                       style: TextStyle(fontSize: 16, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ]
//       ),
//
//         Column(children: [
//           Container(
//             height: 200,
//             width: 150,
//             child:
//             StoryView(
//               controller: controllerr,
//               storyItems: [
//
//                 StoryItem.inlineImage(
//                   url:
//                   "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
//                   controller: controllerr,
//                   caption: Text(
//                     "Omotuo & Nkatekwan; You will love this meal if taken as supper.",
//                     style: TextStyle(
//                       color: Colors.white,
//                       backgroundColor: Colors.black54,
//                       fontSize: 17,
//                     ),
//                   ),
//                 ),
//               ],
//               onStoryShow: (s) {
//                 print("Showing a story");
//               },
//               onComplete: () {
//                 print("Completed a cycle");
//               },
//               progressPosition: ProgressPosition.bottom,
//               repeat: false,
//               inline: true,
//             ),
//           ),
//           Material(
//             child: InkWell(
//               onTap: () {
//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => MoreStories()));
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.black54,
//                     borderRadius:
//                     BorderRadius.vertical(bottom: Radius.circular(8))),
//                 padding: EdgeInsets.symmetric(vertical: 8),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Icon(
//                       Icons.arrow_forward,
//                       color: Colors.white,
//                     ),
//                     SizedBox(
//                       width: 16,
//                     ),
//                     Text(
//                       "View more stories",
//                       style: TextStyle(fontSize: 16, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ]
//         ),
//
//       ],
//     ),

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
                  //  color: Colors.black45,
                ),
                title: Text(
                  "الرئيسية",
                  // style: TextStyle(color: Colors.black45),
                ),
                backgroundColor: Colors.white38,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_grocery_store,
                  //  color: Theme.of(context).primaryColorLight,
                ),
                title: Text(
                  "التسوق",
                  //  style: TextStyle(color: Theme.of(context).primaryColorLight),
                ),
                // backgroundColor:Colors.white38,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.show_chart,
                  // color: Colors.black45,
                ),
                title: Text(
                  "العروض",
                  //  style: TextStyle(color: Colors.black45),
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
                  //   style: TextStyle(color: Colors.black45),
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
                if (point == 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageMain(),
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
            }));
  }
}

// class MoreStories extends StatefulWidget {
//   @override
//   _MoreStoriesState createState() => _MoreStoriesState();
// }
//
// class _MoreStoriesState extends State<MoreStories> {
//   final storyController = StoryController();
//
//   @override
//   void dispose() {
//     storyController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("More"),
//       ),
//       body: StoryView(
//         storyItems: [
//           StoryItem.text(
//             title: "I guess you'd love to see more of our food. That's great.",
//             backgroundColor: Colors.blue,
//           ),
//           StoryItem.text(
//             title: "Nice!\n\nTap to continue.",
//             backgroundColor: Colors.red,
//             textStyle: TextStyle(
//               fontFamily: 'Dancing',
//               fontSize: 40,
//             ),
//           ),
//           StoryItem.pageImage(
//             url:
//                 "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
//             caption: "Still sampling",
//             controller: storyController,
//           ),
//           StoryItem.pageImage(
//               url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
//               caption: "Working with gifs",
//               controller: storyController),
//           StoryItem.pageImage(
//             url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
//             caption: "Hello, from the other side",
//             controller: storyController,
//           ),
//           StoryItem.pageImage(
//             url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
//             caption: "Hello, from the other side2",
//             controller: storyController,
//           ),
//         ],
//         onStoryShow: (s) {
//           print("Showing a story");
//         },
//         onComplete: () {
//           print("Completed a cycle");
//         },
//         progressPosition: ProgressPosition.top,
//         repeat: false,
//         controller: storyController,
//       ),
//     );
//   }
// }
