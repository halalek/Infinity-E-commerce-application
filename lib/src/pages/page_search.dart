import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:structurepublic/src/controler/page_favority_controller.dart';
import 'package:structurepublic/src/controler/page_sold_controller.dart';
import 'package:structurepublic/src/controler/search_controller.dart';
import 'package:structurepublic/src/elements/cardFavorite.dart';
import 'package:structurepublic/src/elements/cardProduct.dart';
import 'package:structurepublic/src/elements/cardProductDetail.dart';
import 'package:structurepublic/src/elements/cardSearch.dart';
import 'package:structurepublic/src/elements/cardSearchMarket.dart';
import 'package:structurepublic/src/elements/cardStorySold.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/pages/comparison.dart';
import 'package:structurepublic/src/pages/pageFavority.dart';
import 'package:structurepublic/src/pages/page_Main_View.dart';
import 'package:structurepublic/src/pages/profil.dart';
import 'package:structurepublic/src/pages/startView.dart';
import 'package:structurepublic/src/pages/vereible.dart';

import 'convertSoundtoText.dart';

class PageSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageSearch();
  }
}

class _PageSearch extends StateMVC<PageSearch> {
  var point = 0;
  SearchProductController _con;
  var duplicateItems = ["a", "aw", "qwe"];

  _PageSearch() : super(SearchProductController()) {
    _con = controller;
    //duplicateItems= _con.listProductSearch;
  }

  var items = List<String>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  get categorizeData => null;

  void updataNote(String note) {
    setState(() => _con.search.text = note);
    /*productData.note=_note.text;
     print("productData.note    "   + productData.note);*/ //  Nour save note
  }

  void moveToSecondPage() async {
    final information = await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => MyAppcon()),
    );
    updataNote(information);
  }

  @override
  void initState() {
    // items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  List<String> _localeNames = ['التقيمم ', 'لسعر', 'الصنف '];
  String _chosenValue;
  String _chosenLessPrice;
  String _chosenLargePrice;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        //     appBar: AppBar(
        //     title: Text("المطاعم"),
        //backgroundColor: Colors.white,
        // ),
        body: Column(children: [
          SizedBox(
            height: 30,
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value);
              },
              controller: _con.search,
              decoration: InputDecoration(
                hintText: "Search query here... ",
                icon: Icon(Icons.search),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        // Color.fromRGBO(143, 148, 251, 1),
                        // Color.fromRGBO(143, 148, 251, .6),
                        Colors.red[300],
                        Color.fromRGBO(160, 0, 0, 1),
                      ])),
                  child: Center(
                    child: Text(
                      "بحث",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _con.getProductsSearch(_chosenValue);
                  });

                  //_loginrController.loginfirebase();
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context) => StartMain() ) );
                  //SignupMain
                },
              ),
              InkWell(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        // Color.fromRGBO(143, 148, 251, 1),
                        // Color.fromRGBO(143, 148, 251, .6),
                        Colors.red[300],
                        Color.fromRGBO(160, 0, 0, 1),
                      ])),
                  child: Center(
                    child: Text(
                      "الفلترة",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _onLoadingDialog();
                  });

                  //_loginrController.loginfirebase();
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context) => StartMain() ) );
                  //SignupMain
                },
              ),
              InkWell(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(160, 0, 0, 1),
                        Colors.red[300]
                      ])),
                  child: Center(
                    child: Text(
                      "البحث الصوتي ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    moveToSecondPage();
                  });

                  //_loginrController.loginfirebase();
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context) => StartMain() ) );
                  //SignupMain
                },
              ),
              InkWell(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        // Color.fromRGBO(143, 148, 251, 1),
                        // Color.fromRGBO(143, 148, 251, .6),
                        Colors.red[300],
                        Color.fromRGBO(160, 0, 0, 1),
                      ])),
                  child: Center(
                    child: Text(
                      "مقارنة المنتجات",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Comparison(new ProductData())));
                  });

                  //_loginrController.loginfirebase();
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context) => StartMain() ) );
                  //SignupMain
                },
              ),
            ],
          ),
          Search(),
        ]),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: point,
            selectedFontSize: 15,
            selectedItemColor: Theme.of(context).primaryColorDark,
            unselectedItemColor: Colors.black45,
            unselectedFontSize: 8,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.restaurant,
                  //  color: Colors.black45,
                ),
                title: Text(
                  "المطاعم",
                  // style: TextStyle(color: Colors.black45),
                ),
                backgroundColor: Colors.white38,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.fastfood,
                  //  color: Theme.of(context).primaryColorLight,
                ),
                title: Text(
                  "الأطباق",
                  //  style: TextStyle(color: Theme.of(context).primaryColorLight),
                ),
                // backgroundColor:Colors.white38,
              ),
            ],
            onTap: (index) {
              setState(() {
                point = index;

                if (point == 1) {
                  //  Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context)=>DropDownDemo(),),);

                }
                if (point == 2) {
                  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context)=> DropDownDemo(),),);

                }
              });
            }));
  }

  Widget Search() {
    if (point == 1) {
      return Expanded(
        child: ListView.builder(
          //basic
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: _con.listProduct.length,
          itemBuilder: (context, i) {
            // return CardProductWidget(categorizeData: categorizeData,productData: _con.listProduct[i]);
            return CardProductSearch(productData: _con.listProduct[i]);
          },
        ),
      );
    }

    if (point == 0) {
      return Expanded(
        child: ListView.builder(
          //basic
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: _con.listMarket.length,
          itemBuilder: (context, i) {
            // return CardProductWidget(categorizeData: categorizeData,productData: _con.listProduct[i]);
            return CardMarketSearch(marketData: _con.listMarket[i]);
          },
        ),
      );
    }
  }

  void _switchLang(selectedVal) {
    setState(() {
      _chosenValue = selectedVal;
    });
    print(selectedVal);
  }

  void _onLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Container(
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(10.0)),
            width: 400.0,
            height: 600.0,
            alignment: AlignmentDirectional.center,
            child: new Column(
              //  crossAxisAlignment: CrossAxisAlignment.center,
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: Text(
                    "      ",
                    style: TextStyle(fontSize: 50),
                  ),
                ),

                InkWell(
                  child: Container(
                    height: 30,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          // Color.fromRGBO(143, 148, 251, 1),
                          // Color.fromRGBO(143, 148, 251, .6),
                          Colors.red[300],
                          Color.fromRGBO(160, 0, 0, 1),
                        ])),
                    child: Center(
                      child: Text(
                        "الترتيب حسب  ",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _con.getProductsSearch(_chosenValue);
                    });

                    //_loginrController.loginfirebase();
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context) => StartMain() ) );
                    //SignupMain
                  },
                ),

                SizedBox(
                  child: Text(
                    "      ",
                    style: TextStyle(fontSize: 20),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(0.0),
                  child: DropdownButton<String>(
                    value: _chosenValue,
                    //elevation: 5,
                    style: TextStyle(color: Colors.black),

                    items: <String>[
                      'نوع المنتجات',
                      'سعر المنتجات',
                      'المطاعم الأعلى تقييماً',
                      'المطاعم المتوفرة',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text(
                      "الترتيب ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _chosenValue = value;
                        Navigator.pop(context);
                        _onLoadingDialog();
                      });
                    },
                  ),
                ),

                SizedBox(
                  child: Text(
                    "      ",
                    style: TextStyle(fontSize: 40),
                  ),
                ),

                //  Text("المنتجات التي اسعرها أكبر من ", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),),
                //   Text("المنتجات التي اسعرها أقل من  ", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),),
                InkWell(
                  child: Container(
                    height: 30,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          // Color.fromRGBO(143, 148, 251, 1),
                          // Color.fromRGBO(143, 148, 251, .6),
                          Colors.red[300],
                          Color.fromRGBO(160, 0, 0, 1),
                        ])),
                    child: Center(
                      child: Text(
                        "المنتجات التي أسعارها أكبر من ",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      //   _con. getProductsSearch(_chosenValue);
                    });

                    //_loginrController.loginfirebase();
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context) => StartMain() ) );
                    //SignupMain
                  },
                ),

                SizedBox(
                  child: Text(
                    "      ",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  child: DropdownButton<String>(
                    value: _chosenLargePrice,
                    //elevation: 5,
                    style: TextStyle(color: Colors.black),

                    items: <String>[
                      '1000',
                      '5000',
                      '10000',
                      '20000',
                      '30000',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text(
                      "السعر",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _chosenLargePrice = value;
                        _con.chosenLargePrice = value;
                        Navigator.pop(context);
                        _onLoadingDialog();
                      });
                    },
                  ),
                ),

                SizedBox(
                  child: Text(
                    "      ",
                    style: TextStyle(fontSize: 40),
                  ),
                ),

                //  Text("المنتجات التي اسعرها أكبر من ", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),),
                //   Text("المنتجات التي اسعرها أقل من  ", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),),
                InkWell(
                  child: Container(
                    height: 30,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          // Color.fromRGBO(143, 148, 251, 1),
                          // Color.fromRGBO(143, 148, 251, .6),
                          Colors.red[300],
                          Color.fromRGBO(160, 0, 0, 1),
                        ])),
                    child: Center(
                      child: Text(
                        "المنتجات التي أسعارها أقل من ",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      //  _con. getProductsSearch(_chosenValue);
                    });

                    //_loginrController.loginfirebase();
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context) => StartMain() ) );
                    //SignupMain
                  },
                ),

                SizedBox(
                  child: Text(
                    "      ",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  child: DropdownButton<String>(
                    value: _chosenLessPrice,
                    //elevation: 5,
                    style: TextStyle(color: Colors.black),

                    items: <String>[
                      '1000',
                      '5000',
                      '10000',
                      '20000',
                      '30000',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text(
                      "السعر",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _chosenLessPrice = value;
                        _con.chosenLessPrice = value;
                        Navigator.pop(context);
                        _onLoadingDialog();
                      });
                    },
                  ),
                ),

                SizedBox(
                  child: Text(
                    "      ",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text(
                  "عند الانتهاء قم بالضغط على زر البحث   ",
                  style: TextStyle(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // new Row(
          //   mainAxisSize: MainAxisSize.max,
          //   children: [
          //     new CircularProgressIndicator(),
          //     SizedBox(width: 5,),
          //     new Text("Loading"),
          //   ],
          // ),
        );
      },
    );

    new Future.delayed(new Duration(seconds: 90), () {});
  }
}

class DropDownDemo extends StatefulWidget {
  @override
  _DropDownDemoState createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownDemo> {
  String _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropDown'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(0.0),
          child: DropdownButton<String>(
            value: _chosenValue,
            //elevation: 5,
            style: TextStyle(color: Colors.black),

            items: <String>[
              'Android',
              'IOS',
              'Flutter',
              'Node',
              'Java',
              'Python',
              'PHP',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            hint: Text(
              "Please choose a langauage",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            onChanged: (String value) {
              setState(() {
                _chosenValue = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
