import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/controler/page_market_controller.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/pages/categorizeView.dart';

class CardMarketWidget extends StatelessWidget {
 const CardMarketWidget({Key key,this.marketData}) : super(key: key);

 final MarketData marketData;


 // PageMarketController ggg=new  PageMarketController();

  @override
  Widget build(BuildContext context) {

    return  Container(
      //      padding: EdgeInsets.fromLTRB(10,10,10,0),
      height: 300,
      width: double.maxFinite,
      child: Card(
        //  elevation: 5,
        //  color: Colors.orange,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: GestureDetector(child:Column(
          children:
          <Widget>[
            new SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,

              child:Image(image:CachedNetworkImageProvider(marketData.image),fit: BoxFit.cover),

           //    Container(
           //     decoration: BoxDecoration(
           //    image: DecorationImage(
           //    image: new NetworkImage(marketData.image,fit: BoxFit.cover),
           //
           //    fit: BoxFit.fitWidth,
           //    alignment: Alignment.topCenter,
           //    ),
           // ),)

            ),



          /*  //     Container(
            //     decoration: BoxDecoration(
            //         image: DecorationImage(
            //         image: new ExactAssetImage("image/3.jpg"),
            //     fit: BoxFit.fitWidth,
            //     alignment: Alignment.topCenter,
            //   ),
            // ),
            //     ),*/
            Expanded(child: ListTile(
              leading:
              CircleAvatar(backgroundColor: Colors.black12,backgroundImage: CachedNetworkImageProvider(marketData.imageIcon),),

              title: Text(marketData.nameAr,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
              subtitle: Text( marketData.descriptionAr),

              trailing:
              GestureDetector(
                child: Text("متصل",style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w400),),
                // child:Icon(Icons.access_time, color: Colors.grey,),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Categorize(marketData)) );

                  //   navigetor("");
                  //    delete(context,this.studentlist[position]);
                  //   debugPrint("student print");
                }
                ,),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Categorize(marketData)) );

                // navigetor("");
                //       navigetortostudent(this.studentlist[position],"Edit Student");
                //   debugPrint("student print");
              },

            ),)

          ],
        ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Categorize(marketData)) );

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


