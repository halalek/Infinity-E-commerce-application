import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/controler/page_market_controller.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/pages/categorizeView.dart';
import 'package:structurepublic/src/pages/chat.dart';

import '../../main.dart';

class CardChatWidget extends StatelessWidget {
  Color stateColor=Colors.white;
  CardChatWidget({Key key,this.marketData}) : super(key: key);

  final MarketData marketData;


  // PageMarketController ggg=new  PageMarketController();

  @override
  Widget build(BuildContext context) {
    if (!marketData.active)
    {stateColor=Colors.black12;}
    return  Container(
      //      padding: EdgeInsets.fromLTRB(10,10,10,0),
      height: 100,
      width: double.maxFinite,
      child: Card(
        //  elevation: 5,
        //color: stateColor,
        // color: Theme.of(context).scaffoldBackgroundColor,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: GestureDetector(
          child:Column(
            children:
            <Widget>[

              // new SizedBox(
              //   height: 200,
              //   width: MediaQuery.of(context).size.width,
              //
              //   child:Image(image:CachedNetworkImageProvider(marketData.image),fit: BoxFit.cover),
              //
              //
              //
              // ),



              Expanded(child: ListTile(

                leading:
                CircleAvatar(backgroundColor: Colors.black12,backgroundImage: CachedNetworkImageProvider(marketData.imageIcon),),

                title: Text( language1=="en" ? marketData.nameEn : marketData.nameAr,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.red[300],)),
             //   subtitle: Text( marketData.descriptionAr,style: TextStyle(color: Theme.of(context).primaryColor) ),

                trailing:
                GestureDetector(
                  child: Text( language1=="en" ? marketData.stateEn : marketData.state, style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w500),),
                  // child:Icon(Icons.access_time, color: Colors.grey,),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomeChat(marketData)) );

                    //   navigetor("");
                    //    delete(context,this.studentlist[position]);
                    //   debugPrint("student print");
                  }
                  ,),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomeChat(marketData)) );

                  // navigetor("");
                  //       navigetortostudent(this.studentlist[position],"Edit Student");
                  //   debugPrint("student print");
                },

              ),)

            ],
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomeChat(marketData)) );

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


