import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/controler/page_market_controller.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/pages/productDetail.dart';
import 'package:structurepublic/src/repository/page_trollery_repository.dart';

import '../../main.dart';

class CardProductSearch extends StatelessWidget {
  final ProductData productData;

  CategorizeData categorizeData;
  CardProductSearch({Key key,this.productData,}) : super(key: key);



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
                       leading: CircleAvatar(backgroundColor: Colors.black12,backgroundImage: CachedNetworkImageProvider(productData.image),),
                    title: Text(language1=="en" ? productData.nameEn : productData.nameAr,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Theme.of(context).primaryColor),),
                    subtitle: Text(language1=="en" ? productData.description_en : productData.description_ar  ?? " ",style: TextStyle(color: Theme.of(context).primaryColor),),

                    trailing:
                    GestureDetector(
                      child: Text(productData.price.toString(),style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w400),),
                      // child:Icon(Icons.access_time, color: Colors.grey,),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetail(productData,categorizeData,new MarketData())) );

                      },),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetail(productData,categorizeData,new MarketData())) );

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
        Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetail(productData,categorizeData,new MarketData())) );

        // navigetor("");
      },
    );
  }
}


