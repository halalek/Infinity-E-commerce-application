import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:structurepublic/src/controler/page_favority_controller.dart';
import 'package:structurepublic/src/elements/cardFavorite.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/pages/pageFavority.dart';
import 'package:structurepublic/src/pages/page_Main_View.dart';
import 'package:structurepublic/src/pages/profil.dart';
import 'package:structurepublic/src/pages/startView.dart';
import 'package:structurepublic/src/pages/vereible.dart';

class Page1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page1();
  }
}

class _Page1 extends StateMVC<Page1> {
  var pointt = 0;
  PageFavorityController _con;

  _Page1() : super(PageFavorityController()) {
    _con = controller;
  }

  List<String> imag = [
    "assets/img/f.gif",
    "assets/img/f7.gif",
    "assets/img/Flower-Cart.gif",
    "assets/img/ab.gif",
    "assets/img/q.gif"
  ];
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();

  Future<Null> _refresh() {
    return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => StartMain(),));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //     appBar: AppBar(
      //     title: Text("المطاعم"),
      backgroundColor: Colors.white,
      // ),
      body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refresh,
          child: ListView(children: [
            CarouselSlider(
              items: [
                for (int i = 0; i < imag.length; i++)
                  Container(
                    // width: 50,
                    margin: EdgeInsets.only(
                        top: 12.0, left: 6.0, right: 6.0, bottom: 6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: new AssetImage(imag[i]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
              //Slider Container properties
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            Container(
              padding: EdgeInsets.all(6),
              margin: EdgeInsets.all(6),
              child: Column(
                children: [


                  // Row(children: [
                  //   Text(
                  //     "حسوماتك",
                  //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  //   ),
                  // ]),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Container(
                  //       child: Center(
                  //         child: Text(
                  //           "حسوماتي",
                  //           style: TextStyle(fontSize: 15, color: Colors.black),
                  //         ),
                  //       ),
                  //       decoration: BoxDecoration(
                  //           color:  Theme.of(context).primaryColor,
                  //           borderRadius: BorderRadius.circular(20)),
                  //       width: 160,
                  //     ),
                  //     Container(
                  //       child: Center(
                  //         child: Text(
                  //           "1500 ل.س",
                  //           style: TextStyle(fontSize: 15, color: Colors.black),
                  //         ),
                  //       ),
                  //       decoration: BoxDecoration(
                  //           color: Colors.black12,
                  //           borderRadius: BorderRadius.circular(20)),
                  //       width: 110,
                  //     ),
                  //   ],
                  // ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        Text(
                          "مفضلتي",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  // CardFavoriteWidget(),

                  // CarouselSlider(
                  //   items: [
                  //     // CardFavoriteWidget()
                  //     Column(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //
                  //       children: <Widget>[
                  //         Expanded(
                  //           child: ListView.builder(
                  //               shrinkWrap: true,
                  //               scrollDirection: Axis.horizontal,
                  //               itemCount: _con.listProductFav.length,
                  //
                  //               itemBuilder: (BuildContext context, int index) =>
                  //                   ShapeOfView(
                  //                       shape: CutCornerShape(
                  //                           borderRadius: BorderRadius.circular(20)
                  //                       ),
                  //                       child: CardFavoriteWidget(productData: _con.listProductFav[index])
                  //                   )
                  //               // Card(
                  //               // child: Center(child: Text('Dummy Card Text')),
                  //               // ),
                  //               ),
                  //         ),
                  //
                  //       ],
                  //     ),
                  //     //1st Image of Slider
                  //   ],
                  //
                  //   //Slider Container properties
                  //   options: CarouselOptions(
                  //     height: 130.0,
                  //     //enlargeCenterPage: true,
                  //     // autoPlay: true,
                  //     aspectRatio: 16 / 9,
                  //     autoPlayCurve: Curves.fastOutSlowIn,
                  //     enableInfiniteScroll: false,
                  //     // autoPlayAnimationDuration: Duration(milliseconds: 800),
                  //     viewportFraction: 0.8,
                  //   ),
                  // ),
                  check(_con.listProductFav),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          //  margin: EdgeInsets.all(5),
                          //  padding: EdgeInsets.all(5),
                          color: Theme
                              .of(context)
                              .primaryColorDark,
                          height: 30.0,)
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        //  margin: EdgeInsets.all(5),
                        //  padding: EdgeInsets.all(5),
                          height: 70.0,
                          child: ShapeOfView(
                              shape: ArcShape(
                                  direction: ArcDirection.Outside,
                                  height: 20,
                                  position: ArcPosition.Bottom),
                              child: ListView(
                                padding: EdgeInsets.all(5),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  Image(
                                    image: AssetImage("assets/img/delv.png"),
                                    fit: BoxFit.cover,
                                    width: 160,
                                  ),
                                  Image(
                                    image: AssetImage("assets/img/price.jpg"),
                                    fit: BoxFit.cover,
                                    width: 160,
                                  ),
                                ],
                              )))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.whatshot,
                          color: Colors.red,
                        ),
                        Text(
                          "الأطباق المقترحة",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  check1(_con.listProductSug)
                  // CarouselSlider(
                  //   items: [
                  //     // CardFavoriteWidget()
                  //     Column(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //
                  //       children: <Widget>[
                  //         Expanded(
                  //           child: ListView.builder(
                  //               shrinkWrap: true,
                  //               scrollDirection: Axis.horizontal,
                  //               itemCount: _con.listProductSug.length,
                  //               itemBuilder: (BuildContext context,
                  //                   int index) =>
                  //                   ShapeOfView(
                  //                       shape: CutCornerShape(
                  //                           borderRadius: BorderRadius.circular(
                  //                               20)
                  //                       ),
                  //                       child:
                  //                       CardFavoriteWidget(productData: _con
                  //                           .listProductSug[index])
                  //                   )
                  //             // Card(
                  //             // child: Center(child: Text('Dummy Card Text')),
                  //             // ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     //1st Image of Slider
                  //   ],
                  //
                  //   //Slider Container properties
                  //   options: CarouselOptions(
                  //     height: 130.0,
                  //     //enlargeCenterPage: true,
                  //     // autoPlay: true,
                  //     aspectRatio: 16 / 9,
                  //     autoPlayCurve: Curves.fastOutSlowIn,
                  //     enableInfiniteScroll: false,
                  //     // autoPlayAnimationDuration: Duration(milliseconds: 800),
                  //     viewportFraction: 0.8,
                  //   ),
                  // ),
                ],
              ),
            )
          ])),
    );
  }

  Widget check(List<ProductData> list) {
    if (list.length != 0) {
        // TODO: implement build
        return CarouselSlider(
          items: [
            // CardFavoriteWidget()
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _con.listProductFav.length,

                      itemBuilder: (BuildContext context, int index) =>
                          ShapeOfView(
                              shape: CutCornerShape(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: CardFavoriteWidget(
                                  productData: _con.listProductFav[index])
                          )
                    // Card(
                    // child: Center(child: Text('Dummy Card Text')),
                    // ),
                  ),
                ),

              ],
            ),
            //1st Image of Slider
          ],

          //Slider Container properties
          options: CarouselOptions(
            height: 130.0,
            //enlargeCenterPage: true,
            // autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: false,
            // autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        );
      }
    else if (list.length==0)
    {return Image(image:AssetImage('assets/img/cardd.gif'),height: 120,fit: BoxFit.fitWidth,);
      //Icon(Icons.favorite_border);
    //  Image(image:AssetImage("assets/img/121.gif"));
    }
    }//giphy.gif








  Widget check1(List<ProductData> list) {
    if (list.length != 0) {
      return CarouselSlider(
        items: [
          // CardFavoriteWidget()
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _con.listProductSug.length,
                    itemBuilder: (BuildContext context,
                        int index) =>
                        ShapeOfView(
                            shape: CutCornerShape(
                                borderRadius: BorderRadius.circular(
                                    20)
                            ),
                            child:
                            CardFavoriteWidget(productData: _con
                                .listProductSug[index])
                        )

                ),
              ),
            ],
          ),
          //1st Image of Slider
        ],

        //Slider Container properties
        options: CarouselOptions(
          height: 130.0,
          //enlargeCenterPage: true,
          // autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: false,
          // autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
      );
    }
    else if (list.length==0)
    {return Image(image:AssetImage('assets/img/cardd.gif'),height: 120,fit: BoxFit.fitWidth,);
      //Icon(Icons.favorite_border);
      //  Image(image:AssetImage("assets/img/121.gif"));
    }
  }//giphy.gif

}




