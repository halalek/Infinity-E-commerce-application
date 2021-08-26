import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SoldData.dart';
import 'package:structurepublic/src/repository/page_faviroty_repository.dart';

import '../../main.dart';

class CardSoldDetailWidget extends StatefulWidget {
  final SoldData soldData;

  const CardSoldDetailWidget(this.soldData);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardSoldDetailWidget(this.soldData);
  }
}

class _CardSoldDetailWidget extends State<CardSoldDetailWidget> {
  _CardSoldDetailWidget(this.soldData);

  final SoldData soldData;
  int count = 0;
  int point = 0;
  var _snackBar1 = SnackBar(
    content: Center(
      child: Text(
        language1=="en" ? "Added to cart" :'تم الإضافة إلى السلة ',
        style: TextStyle(fontSize: 25),
      ),
    ),
    backgroundColor: Colors.black26,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 5),
  );
  bool selectfav = false;
  bool selectfav1 = false;
  var fav = Icons.favorite_border;

  // ignore: non_constant_identifier_names
  void Search() {
    for (int i = 0; i < listfav.length; i++) {
      if (listfav[i].id == soldData.id) {
        fav = Icons.favorite;
        selectfav = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Search();
    return Container(
      height: 400,
      color: Colors.black45,
      child: Column(children: [
        Expanded(
            child: ListView(padding: EdgeInsets.all(5), children: <Widget>[
          Container(
              width: 280, //MediaQuery.of(context).size.width,
              height: 600,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: new SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image(
                        image: CachedNetworkImageProvider(soldData.image),
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
                            language1=="en" ? soldData.name_en : soldData.name_ar,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
                          ),
                          subtitle: Text(language1=="en" ? soldData.description_en :  soldData.description_ar,style: TextStyle(color: Theme.of(context).primaryColor)),
                          trailing: Text(
                            soldData.price.toString(),
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Text(""),
                        Text(""),
                        ShapeOfView(
                          shape: RoundRectShape(
                            borderRadius: BorderRadius.circular(1),
                            borderColor:
                                Theme.of(context).primaryColorDark, //optional
                            borderWidth: 1,
                            //optional
                          ),
                          child: Text((language1=="en" ? "Price before sale " :
                            "  السعر قبل العرض   " )+ soldData.price_last.toString() ,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new MaterialButton(
                                onPressed: add,
                                child: new Icon(
                                  Icons.add,
                                  color:Theme.of(context).primaryColor,
                                ),
                                // backgroundColor: Colors.white,
                              ),
                              new Text('$count',
                                  style: new TextStyle(fontSize: 20.0,color: Theme.of(context).primaryColor)),
                              new MaterialButton(
                                onPressed: minus,
                                child: new Icon(
                                    const IconData(0xe15b,
                                        fontFamily: 'MaterialIcons'),
                                    color: Theme.of(context).primaryColor),
                                //   backgroundColor: Colors.white,
                              ),
                            ],
                          ),
                        ),

                        Expanded(child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: language1=="en" ? "Note (Optional)" :  'ملاحظات أضافية (اختياري)',
                            hintStyle: TextStyle(color: Theme.of(context).primaryColor)
                          ),
                        ),),

                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                child: Container(
                                  width: 100,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Center(
                                    child: Text(language1=="en" ? "Add" :
                                      "إضافة",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Scaffold.of(context).showSnackBar(_snackBar1);
                                },
                              ),

                              // InkWell(child: Container(
                              //
                              //   width: 50,
                              //   padding: EdgeInsets.all(10),
                              //   decoration: BoxDecoration(
                              //     color: Colors.redAccent,
                              //     borderRadius: BorderRadius.circular(8.0),
                              //     // image:  DecorationImage(image: NetworkImage("https://www.awanmasr.com/wp-content/uploads/2021/01/%D8%A3%D8%B6%D8%B1%D8%A7%D8%B1-%D8%A7%D9%84%D8%B4%D8%A7%D9%88%D8%B1%D9%85%D8%A7.png"), fit: BoxFit.cover
                              //     // )
                              //   ),
                              //   child:
                              //   Center(child:Icon(fav),),
                              // ),
                              //   onTap: () {
                              //     setState((){
                              //
                              //       if(selectfav==false)
                              //       {fav=Icons.favorite;
                              //       selectfav1=false;
                              //       setFavority(productData);
                              //       print("id " + productData.id);
                              //
                              //         //Search();
                              //         // Navigator.pushReplacement(
                              //         //     context,
                              //         //     MaterialPageRoute(
                              //         //         builder: (BuildContext context) => CardProductDetailWidget(productData)));
                              //       }
                              //       if(selectfav==true)
                              //       {
                              //         //Search();
                              //         fav=Icons.favorite_border;
                              //         selectfav1=true;
                              //         deleteFavority(productData);
                              //         print(";llll");
                              //       }
                              //     }
                              //     );
                              //
                              //     selectfav=!selectfav1;
                              //     // Navigator.pushReplacement(
                              //     //     context,
                              //     //     MaterialPageRoute(
                              //     //         builder: (BuildContext context) => Page1()));
                              //     //   Search();
                              //   },
                              //   // onLongPress: (){
                              //   // setState(() {
                              //   //   fav=Icons.favorite_border;
                              //   // });
                              //   // },
                              // ),
                            ],
                          ),
                        )
                      ],
                    )),
                  )
                ],
              ))
        ]))
      ]),
    );
  }

  void add() {
    setState(() {
      count++;
    });
  }

  void minus() {
    setState(() {
      if (count != 0) count--;
    });
  }
}
