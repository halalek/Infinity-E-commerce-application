import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/controler/page_market_controller.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/pages/categorizeView.dart';

class CardMarketSearch extends StatelessWidget {
  Color stateColor=Colors.white;
  CardMarketSearch({Key key,this.marketData}) : super(key: key);

  final MarketData marketData;


  // PageMarketController ggg=new  PageMarketController();

  @override
  Widget build(BuildContext context) {
    if (marketData.state=="غير متصل ")
    {stateColor=Colors.black12;}
    return  Container(
      //      padding: EdgeInsets.fromLTRB(10,10,10,0),
      height:100,
      width: double.maxFinite,
      child: Card(
        //  elevation: 5,
        color: stateColor,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: GestureDetector(child:Column(
          children:
          <Widget>[


            Expanded(child: ListTile(

              leading:
              CircleAvatar(backgroundColor: Colors.black12,backgroundImage: CachedNetworkImageProvider(marketData.imageIcon),),

              title: Text(marketData.nameAr,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
              subtitle: Text( marketData.descriptionAr),

              trailing:
              GestureDetector(
                child: Text(marketData.state.toString(), style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w500),),
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


