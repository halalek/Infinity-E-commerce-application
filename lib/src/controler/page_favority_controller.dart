import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/controler/user_controller.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/models/SoldData.dart';
import 'package:structurepublic/src/repository/login_repository.dart';
import 'package:structurepublic/src/repository/page_market_repository.dart' as repo;
import 'package:structurepublic/src/repository/page_faviroty_repository.dart'  as repo;
import 'package:structurepublic/src/repository/page_faviroty_repository.dart'  as repo;
import 'package:structurepublic/src/repository/page_sold_repository.dart' as repo;
import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PageFavorityController extends ControllerMVC {
  //User user = new User();
  bool loading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  int z;
  List<ProductData> listProductFav = [];
  List<ProductData> listProductSug = [];
  List<SoldData> listSold = [];
  List<SoldData> listSoldRe = [];
  List<SoldData> remove = [];
 // final CategorizeData categorizeData;
  PageFavorityController() {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }



  @override
  void initState() {
    super.initState();
    getSold();
    getProductsFav();

  }

  getProductsFav() async {
    setState((){
      listProductFav.clear();
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userid = preferences.getString('userID');
    await repo.getFavority(userid).then((value) {
      setState((){
        listProductFav.addAll(value);
        print("Llllllllllllllllllllllllllllllllllllllll");
        print(listProductFav.length.toString() + "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
        for(int i=0 ; i  < listProductFav.length ; i++)
          listProductFav[i].index=i;
      }



      );
      getProductSug();
    });



  }




getProductSug() async {
  List<ProductData> listProductFav1 = listProductFav;
  setState(() {
    listProductSug.clear();
  });
  print(listProductFav1.length.toString() +
      "777777777777777777777777777777777777777777");
  await repo.getSuggested(listProductFav1).then((value) {
    setState(() {
      listProductSug.addAll(value);

      print(listProductSug.length.toString() + "Suuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");
      for (int i = 0; i < listProductSug.length; i++)
        listProductSug[i].index = i;
    }


    );
  });
}


  getSold() async {
    setState((){
      listSold .clear();
    });
    await repo.getSold().then((value) {
      setState((){
        listSold.addAll(value);
        for(int i=0 ; i  < listSold.length ; i++)
          listSold[i].index=i;

        listSoldRe =listSold;
        for(int i=0 ; i  < listSold.length ; i++)
          for(int j=i+1 ; j  < listSoldRe.length ; j++)
            if( listSoldRe[j].id_market == listSold[i].id_market )
              {remove.add(listSoldRe[j]);

               // listSoldRe.removeAt(j);
              print(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;");}

        for(int i=0 ; i  < remove.length ; i++)
            {
            listSoldRe.remove(remove[i]);
            print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");}

      }


      );

      print(listSold.length.toString() + "444444444444444444444444444444444444444444444");
    });



  }
}
