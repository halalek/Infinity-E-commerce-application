import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/elements/cardProductDetail.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/DemandData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/pages/marketView.dart';
import 'package:structurepublic/src/pages/pagMydemand.dart';
import 'package:structurepublic/src/pages/pageFavority.dart';
import 'package:structurepublic/src/pages/productDetail.dart';
import 'package:structurepublic/src/repository/page_trollery_repository.dart';

import 'cardmarketWidget.dart';
import 'package:intl/intl.dart';



  class CardmydemandWidget extends StatefulWidget {

  final DemandData demandData;

  const CardmydemandWidget( this.demandData) ;
  @override
  State<StatefulWidget> createState() {
  // TODO: implement createState
  return _CardmydemandWidget(this.demandData);
  }
  }




  class _CardmydemandWidget extends State<CardmydemandWidget> {
  _CardmydemandWidget(this.demandData) ;
  final DemandData demandData;
MarketData marketData=MarketData();

  @override
  Widget build(BuildContext context) {
    marketData=getmarket(demandData) as MarketData;
    return GestureDetector(child:Row(
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.fromLTRB(7,7,7,0),
            height: 100,
            width: double.maxFinite,
            child: Card(
                elevation: 5,
                //  color: Colors.orange,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
              child: GestureDetector( child:Column(children: [

                  // new SizedBox(
                  //   height: 130,
                  //   width: MediaQuery.of(context).size.width,
                  //   // child:Image.network('https://dbq8hrmshvuto.cloudfront.net/a2d/f98c8/0803/4c93/9ebe/05596a8ed7a9/normal/516995.jpg',fit: BoxFit.cover,),
                  //   child:Image(image:CachedNetworkImageProvider(productData.image),fit: BoxFit.cover,),
                  //
                  // ),
                  Expanded(child: ListTile(
                    leading: CircleAvatar(backgroundColor: Colors.black12,backgroundImage:CachedNetworkImageProvider(marketData.image)),
                    title: Text(marketData.nameAr,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                    subtitle: Text((demandData.timesTampCreat).toString()),

                    trailing:
                    GestureDetector(
                      // chi0ld: Text("llll",style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w400),),
                      child:Icon(Icons.mode_rounded, color: Colors.grey,),
                      onTap: () {

                        // Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetail(productData,categorizeData)) );
                       // Navigator.push(context, MaterialPageRoute(builder: (context) => editProfilePage(user: user,)));

                      },),
                    onTap: () {
                      //  Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetail(productData,categorizeData)) );

                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),)


                ],

                ) ,
                  onTap: () {

            Navigator.push(context,MaterialPageRoute(builder :(context)
            {

              return pagemydemand(demandData);
            }));

            //  navigetor("");
            //       navigetortostudent(this.studentlist[position],"Edit Student");
            //   debugPrint("student print");
            },
            ),

            ) ,


          )
          ),

        ]
    ),
      onTap: (){
        //  Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetail(productData,categorizeData)) );

        // navigetor("");
      },

    );
  }
}

/*class Carduser extends StatelessWidget {



  // PageMarketController ggg=new  PageMarketController();

  @override
  Widget build(BuildContext context) {

    return GestureDetector(child:Row(
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.fromLTRB(7,7,7,0),
            height: 100,
            width: double.maxFinite,
            child: Card(
                elevation: 5,
                //  color: Colors.orange,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child:Column(children: [

                  // new SizedBox(
                  //   height: 130,
                  //   width: MediaQuery.of(context).size.width,
                  //   // child:Image.network('https://dbq8hrmshvuto.cloudfront.net/a2d/f98c8/0803/4c93/9ebe/05596a8ed7a9/normal/516995.jpg',fit: BoxFit.cover,),
                  //   child:Image(image:CachedNetworkImageProvider(productData.image),fit: BoxFit.cover,),
                  //
                  // ),
                  Expanded(child: ListTile(
                    leading: CircleAvatar(backgroundColor: Colors.black12,backgroundImage:CachedNetworkImageProvider(user.image)),
                    title: Text(user.name,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                    subtitle: Text(user.phone.toString() ??  ""),

                    trailing:
                    GestureDetector(
                     // child: Text("llll",style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w400),),
                       child:Icon(Icons.mode_rounded, color: Colors.grey,),
                      onTap: () {
                        moveToSecondPage();
                        // Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetail(productData,categorizeData)) );
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Pageedit(use: user)));
                      },),
                    onTap: () {
                      //  Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetail(productData,categorizeData)) );

                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),)


                ],

                )

            ) ,


          )
          ),

        ]
    ),
      onTap: (){
        //  Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetail(productData,categorizeData)) );

        // navigetor("");
      },
    );
  }
}*/