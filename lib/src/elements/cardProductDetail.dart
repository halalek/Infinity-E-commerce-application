import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/controler/page_market_controller.dart';
import 'package:structurepublic/src/elements/cardFavorite.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/pages/page_1.dart';
import 'package:structurepublic/src/repository/page_faviroty_repository.dart';



class CardProductDetailWidget extends StatefulWidget {

   final ProductData productData;
   const CardProductDetailWidget( this.productData) ;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardProductDetailWidget(this.productData);
  }
}



class _CardProductDetailWidget extends State<CardProductDetailWidget> {
   _CardProductDetailWidget(this.productData) ;

  final ProductData productData;
  int count=0;
  int point=0;
   var _snackBar1 = SnackBar(
    content: Center(child: Text('تم الإضافة إلى السلة ',style: TextStyle(fontSize:25),),),
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
                                    Expanded(child: TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'ملاحظات أضافية (اختياري)'
                                      ),
                                    ),),


                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(child: Container(
                                            width: 100,
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
                                                  print(";llll");
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


