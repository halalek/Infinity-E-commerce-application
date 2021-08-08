import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/pages/comparison.dart';
import 'package:structurepublic/src/pages/convertSoundtoText.dart';
import 'package:structurepublic/src/repository/page_faviroty_repository.dart';
import 'package:structurepublic/src/repository/page_trollery_repository.dart';
import 'package:structurepublic/src/models/MarketData.dart';


import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class CardProductDetailWidget extends StatefulWidget {

   final ProductData productData;
   final MarketData marketData;
   const CardProductDetailWidget( this.productData,this.marketData) ;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardProductDetailWidget(this.productData,this.marketData);
  }
}




class _CardProductDetailWidget extends State<CardProductDetailWidget> {
   _CardProductDetailWidget(this.productData,this.marketData) ;
   final MarketData marketData;
   _CardProductDetailWidget(this.productData) ;

   void updataNote(String note){
     setState(() =>_note.text = note);
     /*productData.note=_note.text;
     print("productData.note    "   + productData.note);*/  //  Nour save note
   }
   void moveToSecondPage() async {
     final information = await Navigator.push(
       context,
       CupertinoPageRoute(
           fullscreenDialog: true, builder: (context) => MyAppcon()),
     );
     updataNote(information);

   }

  final ProductData productData;
  int count=0;
  int point=0;
  //String _note='ملاحظات أضافية (اختياري)';
   TextEditingController _note = TextEditingController();
   var _snackBar1 = SnackBar(
    content: Center(

      child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
         child: Text('تم الإضافة إلى السلة ',style: TextStyle(fontSize:25), )),

         Center(
        child: Text('لتأكيد أو تعديل الطلب انتقل لصفحة السلة  ',style: TextStyle(fontSize:20, ),),


          ),],),),
    backgroundColor: Colors.black26,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 5),

  );












  bool  selectfav=false;bool selectfav1=false;
  var fav=Icons.favorite_border ;
   // ignore: non_constant_identifier_names
    void Search()  {
     for (int i = 0; i < listfav.length; i++) {
       if(listfav[i].id == productData.id)
       {fav= Icons.favorite;
      selectfav=true;
         }
     }
   }
  @override
  Widget build(BuildContext context) {

    Search();
    return  Container(
      height:400,
      color: Colors.black45,
      child:
      Column(children: [
        Expanded(
            child: ListView(
                padding: EdgeInsets.all(5),
                children: <Widget>[
                  Container(
                      width:280,//MediaQuery.of(context).size.width,
                      height: 600,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: new SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Image(
                                image:CachedNetworkImageProvider(productData.image) ,
                              //  'https://dbq8hrmshvuto.cloudfront.net/a2d/f98c8/0803/4c93/9ebe/05596a8ed7a9/normal/516995.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 400,
                            padding: EdgeInsets.all(10),
                            child: GestureDetector(
                                child: Column(
                                  children: [

                                    ListTile(
                                      title: Text(
                                        productData.nameAr,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                         productData.description_ar),

                                      trailing: GestureDetector(
                                        child: Text(
                                         productData.price.toString(),
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        // child:Icon(Icons.access_time, color: Colors.grey,),
                                        onTap: () {
                                          //    delete(context,this.studentlist[position]);
                                          //   debugPrint("student print");
                                        },
                                      ),
                                      onTap: () {
                                        //       navigetortostudent(this.studentlist[position],"Edit Student");
                                        //   debugPrint("student print");
                                      },

                                    ),
                                    Expanded(child:  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        new  MaterialButton(
                                          onPressed: add,
                                          child: new Icon(Icons.add, color: Colors.black,),
                                          // backgroundColor: Colors.white,
                                        ),

                                        new Text('$count',
                                            style: new TextStyle(fontSize: 20.0)),

                                        new MaterialButton(
                                          onPressed: minus,
                                          child: new Icon(
                                              const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                                              color: Colors.black),
                                          //   backgroundColor: Colors.white,
                                        ),
                                      ],
                                    ),),
                                   //  Container(
                                   //     padding: EdgeInsets.only(bottom: 30),
                                   //      child: Row(
                                   //         // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   //          children: [
                                   //            Expanded(child: TextField(
                                   //              decoration: InputDecoration(
                                   //                  border: OutlineInputBorder(),
                                   //                  hintText: 'ملاحظات أضافية (اختياري)',
                                   //                prefixIcon: Icon(Icons.mic),
                                   //              ),
                                   //              onTap: _onSound,
                                   //            ),),
                                   //
                                   //
                                   //  ])
                                   // ),

                                    GestureDetector(child: Container(
                                      width: 300,
                                     margin: EdgeInsets.all(10),
                                     padding: EdgeInsets.only(bottom: 20,top: 30),
                                      // decoration: BoxDecoration(
                                      //  // color: Colors.black45,
                                      //   borderRadius: BorderRadius.circular(8.0),
                                      //   border: Border.all(
                                      //     color: Theme.of(context).primaryColorDark
                                      //   ),
                                      // ),
                                      child:Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       children: [
                                    //   Text("ملاحظات إضافية (اختياري)"  ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),

                                      Expanded(child: TextField(
                                       controller: _note ,
                                                   decoration: InputDecoration(
                                                      // border: OutlineInputBorder(),
                                                       hintText: 'ملاحظات أضافية (اختياري)',
                                                     //prefixIcon: Icon(Icons.mic),
                                                   ),
                                                  // onTap: _onSound,
                                                 ),),


                                         InkWell(child: Container(

                                           width: 50,
                                           padding: EdgeInsets.all(10),
                                           // decoration: BoxDecoration(
                                           //   color: Colors.redAccent,
                                           //   borderRadius: BorderRadius.circular(8.0),
                                           //   image:  DecorationImage(image: NetworkImage("https://www.awanmasr.com/wp-content/uploads/2021/01/%D8%A3%D8%B6%D8%B1%D8%A7%D8%B1-%D8%A7%D9%84%D8%B4%D8%A7%D9%88%D8%B1%D9%85%D8%A7.png"), fit: BoxFit.cover
                                           //   )
                                           // ),
                                           child:
                                           Icon(Icons.mic,color:  Theme.of(context).primaryColorDark,size: 30,),
                                         ),
                                           onTap: () {
                                             setState((){
                                               moveToSecondPage();
                                               // Navigator.push(
                                               //     context,
                                               //     MaterialPageRoute(
                                               //         builder: (BuildContext context) => MyAppcon()));
                                             }
                                             );

                                           },
                                         ),


                                      ]),
                                    ),
                                      onTap: (){
                                     //   _onSound();
                                      },
                                    ),




                                    Container(
                                      padding: EdgeInsets.all(20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(child: Container(
                                            width: 80,
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.black45,
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                            child:
                                            Center(child: Text("إضافة",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                            onTap: (){
                                              Scaffold.of(context).showSnackBar(_snackBar1);

                                              setTrollery(productData,count,marketData);
                                            },
                                          ),
                                          GestureDetector(child: Container(
                                            width: 60,
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.black45,
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                            child:
                                            Center(child: Text("مقارنة",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                            onTap: (){
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Comparison(productData)) );
                                            },
                                          ),
                                          InkWell(child: Container(

                                            width: 50,
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.redAccent,
                                              borderRadius: BorderRadius.circular(8.0),
                                              // image:  DecorationImage(image: NetworkImage("https://www.awanmasr.com/wp-content/uploads/2021/01/%D8%A3%D8%B6%D8%B1%D8%A7%D8%B1-%D8%A7%D9%84%D8%B4%D8%A7%D9%88%D8%B1%D9%85%D8%A7.png"), fit: BoxFit.cover
                                              // )
                                            ),
                                            child:
                                            Center(child:Icon(fav),),
                                          ),
                                            onTap: () {
                                              setState((){

                                                if(selectfav==false)
                                                {fav=Icons.favorite;
                                                 selectfav1=false;
                                                  setFavority(productData);
                                                print("id " + productData.id);

                                                //Search();
                                                // Navigator.pushReplacement(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (BuildContext context) => CardProductDetailWidget(productData)));
                                                }
                                                if(selectfav==true)
                                                {
                                                  //Search();
                                                  fav=Icons.favorite_border;
                                                  selectfav1=true;
                                                  deleteFavority(productData);

                                                }
                                              }
                                              );

                                            selectfav=!selectfav1;
                                              // Navigator.pushReplacement(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (BuildContext context) => Page1()));
                                              //   Search();
                                            },
                                            // onLongPress: (){
                                            // setState(() {
                                            //   fav=Icons.favorite_border;
                                            // });
                                            // },
                                          ),
                                        ],),)



                                  ],
                                )
                            ),
                          )
                        ],
                      ))
                ] ))]),
    );
  }


   void add() {
     setState(() {
       count++;


     });
   }
   void minus() {
     setState(() {
       if (count != 0)
         count--;
     });
   }






























}


