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
import 'package:structurepublic/src/repository/page_product_repository.dart'  as repo;


import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PageProductController extends ControllerMVC {
  //User user = new User();
  bool loading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  int z;
  List<ProductData> listProduct = [];
  final CategorizeData categorizeData;
  PageProductController(this.categorizeData) {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }


  @override
  void initState() {
    super.initState();
    getProducts();
  }

  getProducts() async {
    setState((){
      listProduct.clear();
    });
    await repo.getProduct(this.categorizeData).then((value) {
      setState((){
        listProduct.addAll(value);
        for(int i=0 ; i  < listProduct.length ; i++)
           listProduct[i].index=i;
      }


      );
    });



  }


  Indexof(ProductData productData)async
  {
   //  print("llllllllllllllllllllllll");
   //  //print(length );
   //  for(int i=0 ; i  < await listProduct.length ; i++)
   //    if(listProduct[i].id==productData.id)
   // // if(listProduct.indexOf(productData)!=-1)
   //    {print("hbhhhhhhhhhhh" );
   //    print(i );
   //    z=i;}


    //return i;}

  }
}
