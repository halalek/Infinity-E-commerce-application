import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/controler/page_market_controller.dart';
import 'package:structurepublic/src/elements/cardProductDetail.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/pages/productDetail.dart';

import '../../main.dart';

class CardProductWidget extends StatelessWidget {
  final ProductData productData;
  final CategorizeData categorizeData;
  final MarketData marketData;

  const CardProductWidget({this.categorizeData,Key key,this.productData,this.marketData}) : super(key: key);




  // PageMarketController ggg=new  PageMarketController();

  @override

  Widget build(BuildContext context) {

    return GestureDetector(
      child: Row(children: [
        Expanded(
            child: Container(
          padding: EdgeInsets.fromLTRB(7, 7, 7, 0),
          height: 230,
          width: double.maxFinite,
          child: Card(
              elevation: 5,
              //color: Colors.white,
           //   color: Theme.of(context).scaffoldBackgroundColor,
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                children: [
                  new SizedBox(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                   // child:Image.network('https://dbq8hrmshvuto.cloudfront.net/a2d/f98c8/0803/4c93/9ebe/05596a8ed7a9/normal/516995.jpg',fit: BoxFit.cover,),
                     child:Image(image:CachedNetworkImageProvider(productData.image),fit: BoxFit.cover,),

                  ),
                  Expanded(child: ListTile(
                    //   leading: CircleAvatar(backgroundColor: Colors.black12,backgroundImage:NetworkImage('https://arab-rate.com/media/reviews/photos/original/cd/77/3e/309-309-79-1578342205.jpg',),),
                    title: Text(language1=="en" ? productData.nameEn :  productData.nameAr,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Theme.of(context).primaryColor),),
                    subtitle: Text(language1=="en" ? productData.description_en :  productData.description_ar  ?? " ",style: TextStyle( color: Theme.of(context).primaryColor),),

                    trailing:
                    GestureDetector(
                      child: Text(productData.price.toString(),style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w400),),
                      // child:Icon(Icons.access_time, color: Colors.grey,),
                      onTap: () {
                        countt=0;
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetail(productData,categorizeData,marketData)) );

                      },),
                    onTap: () {
                      countt=0;
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetail(productData,categorizeData,marketData)));

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
        countt=0;
        Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetail(productData,categorizeData,marketData)) );

        // navigetor("");
      },
    );
  }
}

class CardProductcomp extends StatelessWidget {
  final ProductData productData;
  final CategorizeData categorizeData;

  const CardProductcomp({
    this.categorizeData,
    Key key,
    this.productData,
  }) : super(key: key);

  // PageMarketController ggg=new  PageMarketController();



  @override
  Widget build(BuildContext context) {
    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    print(countt);
    return Container(
      color: Colors.black12,
      height: 460,
      width: 170,
      child: Column(children: [
        Expanded(
            child: ListView(padding: EdgeInsets.all(5), children: <Widget>[
          Container(
              width: 170, //MediaQuery.of(context).size.width,
              height: 450,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: new SizedBox(
                      width: 170,
                      child: Image(
                        image: CachedNetworkImageProvider(productData.image),
                        //  'https://dbq8hrmshvuto.cloudfront.net/a2d/f98c8/0803/4c93/9ebe/05596a8ed7a9/normal/516995.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 300,
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                        child: Column(
                      children: [
                        Text(
                          language1=="en" ? productData.nameMarketen :
                           productData.nameMarket ,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,color: Theme.of(context).primaryColor),
                        ),

                        Text(
                          "",
                          style: TextStyle(
                            fontSize: 10,),
                        ),
                        Text(
                          language1=="en" ? productData.nameEn :
                          productData.nameAr,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          " ",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          language1=="en" ? productData.description_en :
                          productData.description_ar,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          " ",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          productData.price.toString(),
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )),
                  )
                ],
              ))
        ]))
      ]),
    );
  }

}

