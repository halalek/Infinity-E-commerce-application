
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/controler/login_controller.dart';
import 'package:structurepublic/src/controler/user_controller.dart';
import 'package:structurepublic/src/elements/cardFavorite.dart';
import 'package:structurepublic/src/models/user.dart';
import 'package:structurepublic/src/pages/editProfil.dart';
import 'package:structurepublic/src/pages/pageSold.dart';
import 'package:structurepublic/src/pages/page_1.dart';
import 'package:structurepublic/src/pages/page_Main_View.dart';
import 'package:structurepublic/src/pages/realLocation.dart';
import 'package:structurepublic/src/pages/startView.dart';
//import 'package:structurepublic/src/pages/sharedPref.dart';
import 'package:structurepublic/src/pages/vereible.dart';
import 'package:structurepublic/src/repository/login_repository.dart'as repo;
import 'package:location/location.dart';
import 'dart:io';

import 'package:structurepublic/src/repository/login_repository.dart';
class ProfilePage extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfilePage();
  }

}


class  _ProfilePage extends StateMVC<ProfilePage> {
  int point = 3;
  void updataName(String name){
    setState(() =>_name = name);
  }
  void moveToSecondPage() async {
    final information = await Navigator.push(
      context,
      CupertinoPageRoute(
          fullscreenDialog: true, builder: (context) => editProfilePage()),
    );
    updataName(information);
  }
  String _name;
  UserController _con;
  //SharedPref sharedPref=SharedPref();
  //SharedPreferences preferences =  SharedPreferences.getInstance() as SharedPreferences;
  _ProfilePage() : super(UserController()) {
    // _con = controller;
    _con = controller;

  }





  String getcon(){
    _name=_con.user.name;
    return _name;
  }
void location() async{
  Location location = new Location();


  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  location.onLocationChanged.listen((LocationData currentLocation) {
    // Use current location


    _con.user.long=currentLocation.longitude;
    _con.user.lat=currentLocation.latitude;
    //sharedPref.save('user', _con.user);
    // print(repo.updateUser(lat1));

    repo.updateUser(_con.user);



  });

}
  bool showPassword=false;
  void displayBottomSheet(BuildContext context)  { showModalBottomSheet( context: context, builder: (ctx) {
    return Container( height: MediaQuery.of(context).size.height * 0.4,
        child:Column(   children: [
          Expanded(child:
          Row(
              children: [
         IconButton(
                  iconSize: 100,
                  icon: Image.asset("assets/img/c.png",

                  ),
                  onPressed: (){
                    setState(() {

                      image="https://www.pngkey.com/png/full/284-2844044_fashion-toys-electrical-items-and-more-girl-with.png";
                      _con.user.image=image;
                      print("imaaaaaaaaaaaaaaaaaaagggggggggggggg");
                      // sharedPref.save('user', _con.user);

                      repo.updateUser(_con.user);
                    });


                  },
                ) ,

                IconButton(
                  iconSize: 100,
                  icon: Image.asset( "assets/img/rose_PNG66944.png",

                  ),
                  onPressed: (){
                    setState(() {
                      image="https://www.joigifts.com/pub/media/catalog/product/cache/afad95d7734d2fa6d0a8ba78597182b7/0/0/0005752_50-red-roses-bouquet.jpeg";
                      _con.user.image=image;
                      print("imaaaaaaaaaaaaaaaaaaagggggggggggggg");
                      //sharedPref.save('user', _con.user);

                      repo.updateUser(_con.user);

                    });


                  },
                ),
                IconButton(
                  iconSize: 100,
                  icon: Image.asset( "assets/img/ic.png",
                  ),
                  onPressed: (){
                    setState(() {

                      image="http://igav3-metcdn-com.global.ssl.fastly.net/content/uploads/sites/2/2018/10/16091327/49_Hero.png";
                      _con.user.image=image;
                      print("imaaaaaaaaaaaaaaaaaaagggggggggggggg");
                      //sharedPref.save('user', _con.user);

                      repo.updateUser(_con.user);
                    });



                  },
                ) ,

              ]
          )),
          Expanded(child:
          Row(
              children: [
                 IconButton(
                  iconSize: 100,
                  icon: Image.asset( "assets/img/c2.png",

                  ),
                  onPressed: (){
                    setState(() {

                      image="http://www.seekpng.com/png/full/21-212923_mens-jens-fashion-png.png";
                      _con.user.image=image;
                      print("imaaaaaaaaaaaaaaaaaaagggggggggggggg");
                      //sharedPref.save('user', _con.user);
                      repo.updateUser(_con.user);
                    });

                  },
                ),
               IconButton(
                 iconSize: 100,
                 icon: Image.asset( "assets/img/f2.png",),
                 onPressed: (){
                   setState(() {
                     image="http://rjeem.com/wp-content/uploads/2019/12/%D8%A8%D9%88%D9%83%D9%8A%D9%87-%D9%88%D8%B1%D8%AF-%D8%A7%D8%A8%D9%8A%D8%B6.png";

                     _con.user.image=image;
                     print("imaaaaaaaaaaaaaaaaaaagggggggggggggg");
                     // sharedPref.save('user', _con.user);
                     repo.updateUser(_con.user);
                   });

                 },
               ) ,
           IconButton(
            iconSize: 100,
            icon: Image.asset( "assets/img/p.png",

            ),
            onPressed: (){
              setState(() {

                image="http://www.seekpng.com/png/full/89-891255_fast-food-png-food.png";
                if(image!="http://cdn.dribbble.com/users/25514/screenshots/1614757/logo-design-golden-ratio-infinity.gif")
                  _con.user.image=image;
                print("imaaaaaaaaaaaaaaaaaaagggggggggggggg");
                // sharedPref.save('user', _con.user);
                repo.updateUser(_con.user);
              });
            },
          ),

              ]
          )) ,
       ],
        )); }); }

  @override
  Widget build(BuildContext context)  {


     return Scaffold(
     body: Container(
      color: darkAlert,
      child: ListView(

        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: ClipPath(
                  clipper: ClippingClass(),
                  child: Container(
                    height: 130.0,
                    decoration: BoxDecoration(color: changecolor),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child:Stack(
                    children: [
                      Container(

                        width: 120,
                        height: 120,

                        decoration: BoxDecoration(

                            border: Border.all(
                                width: 4,
                                color: changecolor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            //
                            image: DecorationImage(

                              fit: BoxFit.fill,

                              image:CachedNetworkImageProvider(_con.user.image ?? "https://www.seekpng.com/png/full/89-891255_fast-food-png-food.png"),

                            )

                        ),

                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: changecolor,
                              ),
                              color:changecolor,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.edit,color: darkfont,),
                              onPressed: (){
                                displayBottomSheet(context);
                              },
                            ),
                          )),
                    ],
                  ),
                ),

              )
            ],
          ),
          Container(

            padding: const EdgeInsets.only(left: 180),
            child :Text(_name==null?"${getcon()}":"${_name}"),
          ),
          Container(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              children: <Widget>[
                IntrinsicHeight
                  (
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                            children: [IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: (){

                                moveToSecondPage();   },
                            ),


                              FlatButton(
                                child:      Text("edit profil",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color:darkfont,

                                    fontWeight: FontWeight.bold,
                                    fontFamily: font,
                                  ),),
                                onPressed: (){
                                  moveToSecondPage();
                                },)
                            ]),


                        VerticalDivider(color: darkfont,width: 20,),
                        Column(
                            children: [ IconButton(
                              icon: Icon(Icons.add_location),
                              onPressed:()async{
                                location();
                              },
                            ),
                              FlatButton(
                                child:Text("location",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color:darkfont,

                                    fontWeight: FontWeight.bold,
                                    fontFamily: font,
                                  ),),
                                onPressed: (){
                                  location();
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => RealtimeMapScrren()));
                                },)
                            ]),


                        VerticalDivider(color: darkfont,width: 20,),
                        Column(
                            children: [IconButton(
                              icon: Icon(Icons.shopping_cart),
                              onPressed: (){

                              },
                            ),   FlatButton(
                              child:Text("my requests",
                                style: TextStyle(
                                  fontSize: 12,
                                  color:darkfont,

                                  fontWeight: FontWeight.bold,
                                  fontFamily: font,
                                ),),
                              onPressed: (){

                              },)



                            ]),

                      ], )),
                Padding(
                    padding:
                    const EdgeInsets.only(top: 22.0, left: 42.0, right: 42.0),
                    child: Center(
                      child:Column(
                          children: [
                            Row(  children: [
                              Text("Favorite"),
                              IconButton(
                                  icon: Icon(Icons.favorite,color:changecolor,),

                                  onPressed: (){}


                              ),



                            ])
                          ]),)
                ), ],
            )),
        ],
      ),
    ),

         bottomNavigationBar: BottomNavigationBar(
         currentIndex:  point,
         selectedFontSize: 13,
         selectedItemColor: Theme.of(context).primaryColorDark,
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

               Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context)=>StartMain(),),);

             }
             if(point==1)
             {

               Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context)=> PageMain(),),);

             }
             if(point==2)
             {

               Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context)=> PageSold(),),);

             }


           }
           );
         }
     )

     );
  }
}
class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 80);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - (size.width / 4),
      size.height,
      size.width,
      size.height - 80,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}
