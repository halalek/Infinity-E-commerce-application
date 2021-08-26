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
import 'package:structurepublic/src/pages/mydemand.dart';
import 'package:structurepublic/src/pages/pageFavority.dart';
import 'package:structurepublic/src/pages/pageTrollery.dart';
import 'package:structurepublic/src/pages/productDetail.dart';
import 'package:structurepublic/src/repository/page_trollery_repository.dart';

import '../../main.dart';
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

  DemandData demandData;
// MarketData marketData=MarketData();
//
//     llll() async {   print("pppaaaaaaaaaaaaaqqqqqqqqqq") ;  await getmarket(this.demandData).then((value) =>print(value.nameAr));
//     }

  @override

  Widget build(BuildContext context) {
    // print("pppaaaaaaaaaaaaaqqqqqqqqqq");
    // print(demandData.marketData.nameAr);
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
                   leading: CircleAvatar(backgroundColor: Colors.black12,backgroundImage:CachedNetworkImageProvider(demandData.marketData.imageIcon)),
                   title: Text(language1=="en" ?demandData.marketData.nameEn :
                   demandData.marketData.nameAr,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Theme.of(context).primaryColor),),
                    subtitle: Text((demandData.priceTotal).toString() + "ل.س",style: TextStyle(color: Theme.of(context).primaryColor),),

                    trailing:
                    GestureDetector(
                      // chi0ld: Text("llll",style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w400),),
                      child:Text(language1=="en" ? (demandData.stateEn).toString() :
                      (demandData.stateAr).toString(),style: TextStyle(fontSize: 16,color: Theme.of(context).primaryColorDark)),
                      onTap: () {

                         Navigator.push(context, MaterialPageRoute(builder: (context) =>PageDemandBasket(demandData)));

                      },),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>PageDemandBasket(demandData)));

                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),)


                ],

                ) ,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>PageDemandBasket(demandData)));


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
        Navigator.push(context, MaterialPageRoute(builder: (context) =>PageDemandBasket(demandData)));

        // navigetor("");
      },

    );
  }
}




class CardmydemandDetail extends StatelessWidget {
  CardmydemandDetail(this.product);


  final Product product;


  @override
  Widget build(BuildContext context) {



    return Container(
      width: 160,

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        color: Colors.white70,
        margin: EdgeInsets.all(4),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          margin: EdgeInsets.only(left: 10,right: 10),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),

                Container(
                  alignment: Alignment.topLeft,

                  child: Text(

                    (product.priceTotal).toString(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.black26,
                ),
                SizedBox(
                  height: 5,
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  backgroundImage: CachedNetworkImageProvider(
                    product.image,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  language1=="en" ? product.nameEn :
                  product.nameAr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20,color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child:
                Row(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(language1=="en" ? "count " : "العدد : ",
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,color: Colors.black),),
SizedBox(width: 20,),
                    Text( product.number.toString(),
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,color: Colors.black),),

                  ],
                ),
                //),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.grey,
                ),

                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }





}