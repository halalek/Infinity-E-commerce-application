import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/repository/page_market_repository.dart' as repo;
import 'package:structurepublic/src/repository/search_repository.dart'  as repo;


import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SearchProductController extends ControllerMVC {
  //User user = new User();
  bool loading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  int z;
  List<ProductData> listProduct = [];
  List<ProductData> listProductLarge = [];
  List<ProductData> listProductLess = [];
  List<MarketData> listMarket = [];
  TextEditingController search = TextEditingController();

  SearchProductController() {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  String chosenLessPrice='10';
  String chosenLargePrice='10';

  @override
  void initState() {
    super.initState();

    //getProductsSearch();
  }

  getProductsSearch(String _chosenValue) async {
      listProduct.clear();
      listMarket.clear();
      print("clearrrrrrrrrrrrrrrrrrrrrrrrrrrr");


    _onLoading();
    print( "eeeeeeeeeeeeeeeeee" +listProduct.length.toString()  + search.text);
    await repo.getProductSearch(search.text).then((value) {
      setState(() {
        listProduct.addAll(value);
        if(_chosenValue=='سعر المنتجات')
        {getProductsFilterPrice();}

        if(_chosenValue== 'نوع المنتجات')
        {getProductsFiltertype();}
        print( "awwwwwwww " +listProduct.length.toString());
        //print(listProductSearch.contains(search.text.trim()).toString());

        if(chosenLessPrice!='10')
          {getProductsFilterPriceLess();}

        if(chosenLargePrice!='10')
        {getProductsFilterPriceLarge();}
      }

      );
    });




      await repo.getMarketSearch(search.text).then((value) {
        setState(() {
          listMarket.addAll(value);
          if(_chosenValue=='المطاعم الأعلى تقييماً')
          {getMarkerFilterRating();}

          if(_chosenValue=='المطاعم المتوفرة')
          {getMarkerFilterActive();}

          print("market" +listMarket.length.toString());
          //print(listProductSearch.contains(search.text.trim()).toString());
        }

        );
      });



  }




  getProductsFilterPrice() async {
    for(int i=0;i<listProduct.length;i++)
    listProduct.sort((a,b)=> a.price.compareTo(b.price));
  }


  getProductsFilterPriceLarge() async {
    for(int i=0;i<listProduct.length;i++) {
      if (listProduct[i].price >= int.parse(chosenLargePrice)) {
        listProductLarge.add(listProduct[i]);
      }
    }
    listProduct=listProductLarge;
  }


  getProductsFilterPriceLess() async {
    for(int i=0;i<listProduct.length;i++) {
      if (listProduct[i].price <= int.parse(chosenLessPrice)) {
        listProductLess.add(listProduct[i]);
      }
    }
    listProduct=listProductLess;
  }

  getProductsFiltertype() async {
    for(int i=0;i<listProduct.length;i++)
      listProduct.sort((a,b)=> a.id_categorize.compareTo(b.id_categorize));
  }


  getMarkerFilterRating() async {
    for(int i=0;i<listMarket.length;i++)
      listMarket.sort((b,a)=> a.rate.compareTo(b.rate));
  }

  getMarkerFilterActive() async {
    for(int i=0;i<listMarket.length;i++)
      listMarket.sort((b,a)=> a.state.compareTo(b.state));
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: false,
      builder: (BuildContext context) {
        return Dialog(
          child:
          new Container(
            // decoration: new BoxDecoration(
            //     color: Colors.blue[200],
            //     borderRadius: new BorderRadius.circular(10.0)
            // ),
            width: 100.0,
            height:100.0,
            alignment: AlignmentDirectional.center,
            child:  new CircularProgressIndicator(
              value: null,
              strokeWidth: 7.0,
            ),
            // child: new Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     new Center(
            //       child: new SizedBox(
            //         height: 30.0,
            //         width: 30.0,
            //         child: new CircularProgressIndicator(
            //           value: null,
            //           strokeWidth: 7.0,
            //         ),
            //       ),
            //     ),
            //     // new Container(
            //     //   margin: const EdgeInsets.only(top: 25.0),
            //     //   child: new Center(
            //     //     child: new Text(
            //     //       "loading.. wait...",
            //     //       style: new TextStyle(
            //     //           color: Colors.white,
            //     //           fontSize: 20
            //     //       ),
            //     //     ),
            //     //   ),
            //     // ),
            //   ],
            // ),
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
    new Future.delayed(new Duration(seconds:5), () {
      // if(!loading)
      // {
      //   Navigator.pop(context); //pop dialog
      //   //_onLoadingError();
      // }
     Navigator.pop(context);

    }

    );
  }



}
