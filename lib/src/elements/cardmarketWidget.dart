import 'package:flutter/material.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/controler/page_market_controller.dart';
import 'package:structurepublic/src/models/SectionData.dart';

class CardMarketWidget extends StatelessWidget {
 //const CardMarketWidget({Key key,this.sectionData}) : super(key: key);

 // final SectionData sectionData;
  PageMarketController ggg=new  PageMarketController();

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
              child: Image.network('https://www.awanmasr.com/wp-content/uploads/2021/01/%D8%A3%D8%B6%D8%B1%D8%A7%D8%B1-%D8%A7%D9%84%D8%B4%D8%A7%D9%88%D8%B1%D9%85%D8%A7.png',fit: BoxFit.cover,),

            ),



            //     Container(
            //     decoration: BoxDecoration(
            //         image: DecorationImage(
            //         image: new ExactAssetImage("image/3.jpg"),
            //     fit: BoxFit.fitWidth,
            //     alignment: Alignment.topCenter,
            //   ),
            // ),
            //     ),
            Expanded(child: ListTile(
              leading:
              CircleAvatar(backgroundColor: Colors.black12,backgroundImage:NetworkImage('https://lh3.googleusercontent.com/p/AF1QipOgVQvmgYeEy0sz3x5BoUG4C_qbP99frKKgwB1W=s1600-w400',),),

              title: Text("الزين",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
              subtitle: Text(  " شاورما - مشاوي - وجبات سريعة"),

              trailing:
              GestureDetector(
                child: Text("متصل",style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w400),),
                // child:Icon(Icons.access_time, color: Colors.grey,),
                onTap: () {
               //   navigetor("");
                  //    delete(context,this.studentlist[position]);
                  //   debugPrint("student print");
                },),
              onTap: () {
               // navigetor("");
                //       navigetortostudent(this.studentlist[position],"Edit Student");
                //   debugPrint("student print");
              },

            ),)

          ],
        ),
          onTap: () {
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


