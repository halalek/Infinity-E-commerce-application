import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:structurepublic/src/controler/page_market_controller.dart';
import 'package:structurepublic/src/elements/cardmarketWidget.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/repository/page_trollery_repository.dart';

class PageMarket extends StatefulWidget
{
  final SectionData sectionData;
  PageMarket(this.sectionData);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageMarket(this.sectionData);
  }
}

class  _PageMarket extends StateMVC<PageMarket>
{
  final SectionData sectionData;
  PageMarketController _con2;

  _PageMarket(this.sectionData) : super( PageMarketController(sectionData)) {
    // _con = controller;
    _con2 = controller;
  }

  @override
  Widget build(BuildContext context) {
    d.product=[];
    remov();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(sectionData.nameAr),
        backgroundColor: Theme.of(context).primaryColorDark,

      ),
       body: ListView.builder(
         itemCount: _con2.listMarket.length,
         // itemBuilder: (context, i) {
         //      return CardMarketWidget(marketData: _con2.listMarket[i],);
         //
         // },
           itemBuilder: (BuildContext context, int index) =>
               ShapeOfView(
                 shape: ArcShape(
                     direction: ArcDirection.Inside,
                     height: 20,
                     position: ArcPosition.Bottom
                 ),
                   child:CardMarketWidget(marketData: _con2.listMarket[index],), )
       ),
    //ListView(
      //   children: [
      //     Container(
      //       //      padding: EdgeInsets.fromLTRB(10,10,10,0),
      //       height: 300,
      //       width: double.maxFinite,
      //       child: Card(
      //         //  elevation: 5,
      //         //  color: Colors.orange,
      //         semanticContainer: true,
      //         clipBehavior: Clip.antiAliasWithSaveLayer,
      //         child:GestureDetector(child: Column(
      //           children:<Widget>[
      //
      //             new SizedBox(
      //               height: 200,
      //               width: MediaQuery.of(context).size.width,
      //               child:Image.network('https://scontent-lga3-2.xx.fbcdn.net/v/t1.6435-9/140942598_780862799453479_5223183120304690875_n.jpg?_nc_cat=107&ccb=1-3&_nc_sid=8bfeb9&_nc_ohc=YxQ6siPz7MoAX_vccMc&_nc_ht=scontent-lga3-2.xx&oh=567a87683f77f5efdbf2583f5c7ec021&oe=608BB855',fit: BoxFit.cover,),
      //
      //             ),
      //
      //
      //             //     Container(
      //             //     decoration: BoxDecoration(
      //             //         image: DecorationImage(
      //             //         image: new ExactAssetImage("image/3.jpg"),
      //             //     fit: BoxFit.fitWidth,
      //             //     alignment: Alignment.topCenter,
      //             //   ),
      //             // ),
      //             //     ),
      //             ListTile(
      //               leading:
      //               CircleAvatar(backgroundColor: Colors.black12,backgroundImage:NetworkImage('https://arab-rate.com/media/reviews/photos/original/cd/77/3e/309-309-79-1578342205.jpg',),),
      //
      //               title: Text("بيت المختار ",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
      //               subtitle: Text(  " وجبات سريعة"),
      //
      //               trailing:
      //               GestureDetector(
      //                 child: Text("متصل",style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w400),),
      //                 // child:Icon(Icons.access_time, color: Colors.grey,),
      //                 onTap: () {
      //                   navigetor("");
      //                   //    delete(context,this.studentlist[position]);
      //                   //   debugPrint("student print");
      //                 },),
      //               onTap: () {
      //                 navigetor("");
      //                 //       navigetortostudent(this.studentlist[position],"Edit Student");
      //                 //   debugPrint("student print");
      //               },
      //
      //             ),
      //
      //           ],
      //         ) ,
      //           onTap: () {
      //             navigetor("");
      //             //       navigetortostudent(this.studentlist[position],"Edit Student");
      //             //   debugPrint("student print");
      //           },
      //
      //
      //         ),
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         elevation: 5,
      //         margin: EdgeInsets.all(10),
      //       ),
      //     ),
      //     Container(
      //       //      padding: EdgeInsets.fromLTRB(10,10,10,0),
      //       height: 300,
      //       width: double.maxFinite,
      //       child: Card(
      //         //  elevation: 5,
      //         //  color: Colors.orange,
      //         semanticContainer: true,
      //         clipBehavior: Clip.antiAliasWithSaveLayer,
      //         child: GestureDetector(child:Column(
      //           children:<Widget>[
      //
      //             new SizedBox(
      //               height: 200,
      //               width: MediaQuery.of(context).size.width,
      //               child:Image.network('https://scontent-lga3-2.xx.fbcdn.net/v/t1.6435-9/120183671_3077399855699501_3219918659187702444_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=730e14&_nc_ohc=4PVzWNTMWksAX-AYoS_&_nc_ht=scontent-lga3-2.xx&oh=86cc9cf5c5aca9951f2a328f4faa5199&oe=608D665A',fit: BoxFit.cover,),
      //
      //             ),
      //
      //
      //             //     Container(
      //             //     decoration: BoxDecoration(
      //             //         image: DecorationImage(
      //             //         image: new ExactAssetImage("image/3.jpg"),
      //             //     fit: BoxFit.fitWidth,
      //             //     alignment: Alignment.topCenter,
      //             //   ),
      //             // ),
      //             //     ),
      //             ListTile(
      //               leading:
      //               CircleAvatar(backgroundColor: Colors.black12,backgroundImage:NetworkImage('https://scontent-lga3-2.xx.fbcdn.net/v/t1.6435-9/90644499_2590650397707785_4928256134986334208_n.jpg?_nc_cat=111&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=kTkZhOugU88AX-wCGOs&_nc_ht=scontent-lga3-2.xx&oh=232f08b9d025209df234a64e1081c447&oe=608EAC3B'),),
      //               title: Text("أبو عبدو ",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
      //               subtitle: Text(  "عصائر - سلطات فواكه - كوكتيلات"),
      //
      //               trailing:
      //               GestureDetector(
      //                 child: Text("متصل",style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w400),),
      //                 // child:Icon(Icons.access_time, color: Colors.grey,),
      //                 onTap: () {
      //                   navigetor("");
      //                   //    delete(context,this.studentlist[position]);
      //                   //   debugPrint("student print");
      //                 },),
      //               onTap: () {
      //                 navigetor("");
      //                 //       navigetortostudent(this.studentlist[position],"Edit Student");
      //                 //   debugPrint("student print");
      //               },
      //
      //             ),
      //
      //           ],
      //         ) ,
      //           onTap: () {
      //             navigetor("");
      //             //       navigetortostudent(this.studentlist[position],"Edit Student");
      //             //   debugPrint("student print");
      //           },
      //         ),
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         elevation: 5,
      //         margin: EdgeInsets.all(10),
      //       ),
      //     ),
      //     Container(
      //       //      padding: EdgeInsets.fromLTRB(10,10,10,0),
      //       height: 300,
      //       width: double.maxFinite,
      //       child: Card(
      //         //  elevation: 5,
      //         //  color: Colors.orange,
      //         semanticContainer: true,
      //         clipBehavior: Clip.antiAliasWithSaveLayer,
      //         child:GestureDetector(child: Column(
      //           children:<Widget>[
      //
      //             new SizedBox(
      //               height: 200,
      //               width: MediaQuery.of(context).size.width,
      //               child:Image.network('https://www.shorouknews.com/uploadedimages/Other/original/dfgsdfgeyhg.jpg',fit: BoxFit.cover,),
      //
      //             ),
      //
      //
      //             //     Container(
      //             //     decoration: BoxDecoration(
      //             //         image: DecorationImage(
      //             //         image: new ExactAssetImage("image/3.jpg"),
      //             //     fit: BoxFit.fitWidth,
      //             //     alignment: Alignment.topCenter,
      //             //   ),
      //             // ),
      //             //     ),
      //             ListTile(
      //               leading:
      //               CircleAvatar(backgroundColor: Colors.black12,backgroundImage:NetworkImage('https://scontent-lga3-2.xx.fbcdn.net/v/t1.6435-9/42282125_763076420705436_8649348721441505280_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=96Ax8MSztl8AX9OQxas&_nc_ht=scontent-lga3-2.xx&oh=61f7a5a411e74bdf4478ad31991ca14a&oe=608BA70F'),),
      //               title: Text("كنافيتو",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
      //               subtitle: Text(  "كنافة - مدلوقة - كوكتيلات"),
      //
      //               trailing:
      //               GestureDetector(
      //                 child: Text("متصل",style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w400),),
      //                 // child:Icon(Icons.access_time, color: Colors.grey,),
      //                 onTap: () {
      //                   navigetor("");
      //                   //    delete(context,this.studentlist[position]);
      //                   //   debugPrint("student print");
      //                 },),
      //               onTap: () {
      //                 navigetor("");
      //                 //       navigetortostudent(this.studentlist[position],"Edit Student");
      //                 //   debugPrint("student print");
      //               },
      //
      //             ),
      //
      //           ],
      //         ) ,
      //
      //           onTap: () {
      //             navigetor("");
      //             //       navigetortostudent(this.studentlist[position],"Edit Student");
      //             //   debugPrint("student print");
      //           },
      //
      //         ),
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         elevation: 5,
      //         margin: EdgeInsets.all(10),
      //       ),
      //     ),
      //   ],
      // ),
    ) ;
  }
  void navigetor(String app) async
  {
    bool result= await Navigator.push(context, MaterialPageRoute(builder :(context)
    {
      //return Pagelist_detail();
    }));
  }
}