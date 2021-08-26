import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/controler/page_market_controller.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/models/SoldData.dart';
import 'package:structurepublic/src/pages/categorizeView.dart';
import 'package:structurepublic/src/pages/pageSoldDetail.dart';

import '../../main.dart';

class CardSoldWidget extends StatelessWidget {
  const CardSoldWidget({Key key,this.soldData}) : super(key: key);

  final SoldData soldData;


  @override
  Widget build(BuildContext context) {

    return  Container(
      height: 200,
      width: double.maxFinite,
      child: Card(
        //  elevation: 5,
        //  color: Colors.orange,

        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: GestureDetector(child:Column(
          children:
          <Widget>[



            Expanded(child: ListTile(
              // leading:
              // CircleAvatar(backgroundColor: Colors.black12,backgroundImage: CachedNetworkImageProvider(marketData.imageIcon),),
              leading:  CircleAvatar(backgroundColor: Colors.black12,backgroundImage: CachedNetworkImageProvider(soldData.image_icon),),
              title: Text(language1=="en" ? soldData.name_en :soldData.name_ar,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.red[300]),),
              subtitle: Text( language1=="en" ? soldData.description_en : soldData.description_ar,style: TextStyle(color: Theme.of(context).primaryColor)),

              trailing:
              GestureDetector(
                child: Text(soldData.price.toString(),style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w400),),
                // child:Icon(Icons.access_time, color: Colors.grey,),
                onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => SoldDetail(soldData)) );

                  //   navigetor("");
                  //    delete(context,this.studentlist[position]);
                  //   debugPrint("student print");
                },),
              onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => SoldDetail(soldData)) );

                // navigetor("");
                //       navigetortostudent(this.studentlist[position],"Edit Student");
                //   debugPrint("student print");
              },

            ),),
        //  +
        new SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child:Image(image:CachedNetworkImageProvider(soldData.image),fit: BoxFit.cover),


            ),
     // )
          ],
        ),
          onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) =>  SoldDetail(soldData)) );

            //  navigetor("");
            //       navigetortostudent(this.studentlist[position],"Edit Student");
            //   debugPrint("student print");
          },
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}


