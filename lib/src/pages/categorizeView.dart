import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:structurepublic/src/controler/categorize_controller.dart';
import 'package:structurepublic/src/controler/page_product_controller.dart';
import 'package:structurepublic/src/controler/page_trollery_controller.dart';
import 'package:structurepublic/src/elements/cardCategorize.dart';
import 'package:structurepublic/src/elements/cardProduct.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/DemandData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/pages/pageTrollery.dart';




// ignore: must_be_immutable
class Categorize extends StatefulWidget
{
  final MarketData marketData;
  Categorize(this.marketData);
  int c=0;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Categorize(this.marketData);
  }
}

class  _Categorize extends StateMVC<Categorize>
{
  final MarketData marketData;
  CategorizeData categorizeData;
  PageCategorizeController _categorizeController;
  //CategorizeDetail categorizeDetail ;
  PageProductController _con ;


  _Categorize(this.marketData) : super(PageCategorizeController(marketData),) {
    _categorizeController = controller;
  }



  bool select=false;
  int point=0;
  int pointt=0;
  int z=0;
  // _ProductDetail(this.pointt);
  Decoration  _decoration1=BoxDecoration(
    color: Colors.black12,

  );
  Decoration  _decoration=BoxDecoration(
    color: Colors.white24,border: Border(
    bottom: BorderSide(width: 1),
  ),
  );



  @override
  Widget build(BuildContext context) {

   /* d.product=[];
    remov();
    print("ggggggggg");
    print(d.product.length);
    print("ggggggggg");*/

    // TODO: implement build
    return Scaffold(
        body: ListView(
            shrinkWrap: true,
            children: [

              // Expanded(child:Row(children: [
              //   Container(
              //     height: 200,
              //     width:MediaQuery.of(context).size.width,
              //     child:
              //     Card(
              //       semanticContainer: true,
              //       clipBehavior: Clip.antiAliasWithSaveLayer,
              //       child:  GestureDetector(child: Container(
              //         child:
              //         Center(
              //           child: RaisedButton(
              //             // onPressed: () {
              //             //
              //             //   Navigator.push(context, MaterialPageRoute(builder: (context) => PageMarket(sectionData)) );
              //             //
              //             //
              //             // },
              //             shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(80.0),),
              //             padding: EdgeInsets.all(6.0),
              //             color: Colors.black12,
              //             child: Ink(
              //               decoration: BoxDecoration(
              //                 border: Border.all(
              //                   color: Colors.white70,
              //                   style: BorderStyle.solid,
              //                   width: 1.0,
              //                 ),
              //                 borderRadius: BorderRadius.circular(30.0),
              //                 color: Colors.black12,//pink
              //               ),
              //               child: Container(
              //                 constraints:
              //                 BoxConstraints(maxWidth: 100.0, minHeight: 40.0,maxHeight: 50),
              //                 alignment: Alignment.center,
              //                 child: Text(
              //                   marketData.nameAr,
              //                   textAlign: TextAlign.center,
              //                   style: TextStyle(color: Colors.white, fontSize: 20),
              //                 ),
              //
              //               ),
              //
              //             ),
              //
              //           ),
              //         ),
              //
              //
              //
              //
              //         decoration: BoxDecoration(
              //           image: DecorationImage(
              //             image: new NetworkImage(marketData.image,),
              //             fit: BoxFit.fitWidth,
              //             alignment: Alignment.topCenter,
              //           ),
              //         ),
              //       ),
              //         onTap: () {
              //           //  Navigator.push(context, MaterialPageRoute(builder: (context) => PageMarket(sectionData)) );
              //           // Navigator.push(context, MaterialPageRoute(builder: (context) => PageMarket() ) );
              //         },
              //       ),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10.0),
              //       ),
              //       elevation: 5,
              //       margin: EdgeInsets.all(10),
              //
              //     ),
              //   )
              //
              // ]) ,),







              Container(
                //   margin: EdgeInsets.symmetric(vertical: 5.0),
                  height:MediaQuery.of(context).size.height,
                  child: Column(children: [
                    Container(
                      height: 130,
                      width: MediaQuery.of(context).size.width,
                      child:  Text(marketData.timeOpen +"        " + marketData.timeClose,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800),textAlign: TextAlign.end,)
                        // decoration: InputDecoration(
                        //   hintText: "Search query here... ",
                        //   icon: Icon(Icons.search),
                        // ),
                      ,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:CachedNetworkImageProvider(marketData.image),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),


                    // Row(children: [
                    //   Expanded(child:new SizedBox(
                    //     height: 130,
                    //     width: MediaQuery.of(context).size.width,
                    //     child:Image.network(marketData.image,fit: BoxFit.cover,)
                    //
                    //   ) ,)
                    //
                    // ],),




                    // Expanded(child:ListView.builder(
                    //   shrinkWrap: true,
                    //   scrollDirection: Axis.horizontal,
                    //   padding: EdgeInsets.only(bottom: 5),
                    //   itemCount: _categorizeController.listCategorize.length,
                    //   itemBuilder: (context, i) {
                    //     return CardCategorizeWidget(categorizeData: _categorizeController.listCategorize[i],);
                    //   },
                    // )
                    // ),


                    //  _categorizeDetail.Listprod(_categorizeController.listCategorize[0]),
                    //  _categorizeDetail.Listprod(),
                    //  CategorizeDetail(categorizeData),
                    //   Expanded(child:ListView.builder(
                    //     shrinkWrap: true,
                    //     scrollDirection: Axis.horizontal,
                    //     padding: EdgeInsets.only(bottom: 5),
                    //     itemCount: _con.listProduct.length,
                    //     itemBuilder: (context, i) {
                    //       return CardProductWidget(categorizeData: _categorizeController.listCategorize[i],productData: _con.listProduct[i],);
                    //     },
                    //   )
                    //   ),


                    Expanded(child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(1.5),
                      crossAxisCount:2,
                      childAspectRatio: 0.98,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing:1.0,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children:List.generate(_categorizeController.listCategorize.length, (index) =>
                          CardCategorizeWidget(categorizeData: _categorizeController.listCategorize[index],marketData: marketData),),

                    )),









                  ]
                  )
              ),



            ]















        ),



        bottomNavigationBar: BottomNavigationBar(
          currentIndex: point,
          selectedFontSize: 13,
          items: [
            BottomNavigationBarItem(
              icon:Icon(Icons.arrow_back,color: Theme.of(context).primaryColorLight,),
              title: Text("عودة",style: TextStyle(color: Theme.of(context).primaryColorLight ),),
              backgroundColor:Colors.white38,
            ),

            BottomNavigationBarItem(
              icon:Icon(Icons.local_grocery_store,color: Theme.of(context).primaryColorLight,),
              title: Text(" عرض السلة",style: TextStyle(color: Theme.of(context).primaryColorLight),),
              // backgroundColor:Colors.white38,
            ),

          ],
          onTap: (index)
          {setState(() {

            point=index;
            if(point==0)
            {Navigator.pop(context);

            }

            if(point==1 &&  d.product.length!=0)
            {
              Navigator.push(context,MaterialPageRoute(builder :(context)
              {
                return pageTrollery();
              }));
            }
          });},
        ));

  }


}




// ignore: must_be_immutable
// class CategorizeDetail extends StatefulWidget
// {
//   final CategorizeData categorizeData;
//   CategorizeDetail(this.categorizeData);
//   int c=0;
//
//   @override
//   State<StatefulWidget> createState() {
// print("Llllllllllllllllllllllllllllllllllll");
//     // TODO: implement createState
//     return _CategorizeDetail(this.categorizeData);
//   }
// }

// class pppp extends StatelessWidget{
//
//   final CategorizeData categorizeDataa;
//   final PageProductController pageProductController;
// final int z;
//   const pppp( {Key key, this.categorizeDataa, this.pageProductController,this.z}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
//
//   Widget Listprod( )
//   {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: pageProductController.listProduct.length,
//       itemBuilder: (context, i) {
//         return CardProductWidget(categorizeData: categorizeDataa,productData: pageProductController.listProduct[i]);
//       },
//     );
//   }
//
// }







