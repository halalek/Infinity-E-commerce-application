import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/elements/cardSection.dart';




class PageMain extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageMain();
  }

}


class  _PageMain extends StateMVC<PageMain>
{
  PageMainController _con;

  _PageMain() : super( PageMainController()) {
    // _con = controller;
    _con = controller;
  }

  int point=1;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.only(bottom: 50),
            children: <Widget>[
              DrawerHeader(
                child:
                Center(
                  child:

                  Text('نصائح طبية ',style: TextStyle(fontSize:30,fontWeight: FontWeight.bold,color:Colors.white,backgroundColor: Colors.lightGreen),),),
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                ),

              ),
              ListTile(
                title: Text(' Sign up ',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)),
              ),

              ListTile(
                title: Text('لا تشرب أقل من 6 أكواب من الماء ',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)),
              ),

              ListTile(
                title: Text('ولا تنسى أن العقل السليم في الجسم السليم',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                //  title: Image.asset("Images/8.png"),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(""),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body:ListView.builder(
          itemCount: _con.listSection.length,
          itemBuilder: (context, i) {
            return CardWidget(sectionData: _con.listSection[i],);
          },
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex:  point,
          selectedFontSize: 13,
          selectedItemColor: Theme.of(context).primaryColorLight,
          unselectedItemColor: Colors.black45,
          unselectedFontSize: 5,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                //  color: Colors.black45,
              ),
              title: Text(
                "الرئيسية",
                // style: TextStyle(color: Colors.black45),
              ),
              backgroundColor: Colors.white38,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_grocery_store,
                //  color: Theme.of(context).primaryColorLight,
              ),
              title: Text(
                "التسوق",
                //  style: TextStyle(color: Theme.of(context).primaryColorLight),
              ),
              // backgroundColor:Colors.white38,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.show_chart,
                // color: Colors.black45,
              ),
              title: Text(
                "العروض",
                //  style: TextStyle(color: Colors.black45),
              ),
              //  backgroundColor:Colors.white38,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                // color: Colors.black45,
              ),
              title: Text(
                "حسابك",
                //   style: TextStyle(color: Colors.black45),
              ),
              // backgroundColor:Colors.white38,
            ),
          ],
          onTap: (index) {
            setState(() {
              point=index;
              if(point==0)
              {
                navigetor1("app");
                //  Navigator.pop(context);
              }

              //   Navigator.pop(context);
            });
          },
        )
    );
  }
  void navigetor(String app) async
  {
    bool result= await Navigator.push(context, MaterialPageRoute(builder :(context)
    {
    //  return Pagelist();
    }));
  }


  void navigetor1(String app) async
  {
    bool result= await Navigator.push(context, MaterialPageRoute(builder :(context)
    {
     // return Page1();
    }));
  }

}



