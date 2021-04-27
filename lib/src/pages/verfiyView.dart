// import 'dart:async';
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class Verfiy extends StatefulWidget{
//   @override
//   _Verfiy createState() => _Verfiy();
// }
//
// class _Verfiy extends State<Verfiy> {
//   final auth=FirebaseAuth.instance;
//   User user;
//   Timer timer;
//   void initState()
//   {
//     super.initState();
//     user=auth.currentUser;
//     user.sendEmailVerification();
//     timer= Timer.periodic(Duration(seconds: 8), (timer) {
//       Checkemail();
//
//     });
//   }
//
//   @override
//   void dispose()
//   {
//     super.dispose();
//     timer.cancel();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login To My Account'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16),
//         child: Form(
//           // key: _formkey,
//             child: Column(
//               children: <Widget>[
//                 Text(
//                     "Verfiy in email "
//                 ),
//
//                 // RaisedButton(
//                 //   color: Colors.blue,
//                 //   child: Text('Register New Account 2 ',style: TextStyle(color: Colors.white),),
//                 //   onPressed: () async {
//                 // //    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen2() ) );
//                 //   },
//                 // )
//
//               ],
//             )
//         ),
//       ),
//     );
//   }
//   Future<void> Checkemail()  async{
//     user=auth.currentUser;
//     await user.reload();
//     if(user.emailVerified)
//     {
//       timer.cancel();
//       print("user.emailVerified successufuly");
//     }
//
//     if(!user.emailVerified)
//     {
//       print("user.emailVerified faild");
//     }
//
//   }
//
//
//
// }

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/controler/varify_controller.dart';
import 'package:structurepublic/src/elements/cardSection.dart';
import 'package:structurepublic/src/elements/cardVerfiy.dart';
import 'package:structurepublic/src/models/user.dart';

import 'page_Main_View.dart';



class PageVerfiy extends StatefulWidget
{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageVerfiy();
  }

}


class  _PageVerfiy extends StateMVC<PageVerfiy>
{
  VerifyController _con;
  Userss  _users ;
  _PageVerfiy() : super( VerifyController()) {
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
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(""),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body:
       // PageMain(),
        ListView.builder(
          itemCount: _con.listUsers.length,
          itemBuilder: (context, i) {
            return CardVerfiy(userss: _con.listUsers[i],);
          },
        ),
        // Text(
        //     _users.name
        //  // itemCount: _con.listSection.length,
        //  //  itemBuilder: (context, i) {
        //  //    return CardWidget(sectionData: _con.listSection[i],);
        //  //  },
        // ),

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

  Widget xxxxxx()
  {

    if(_users.name == null)
  {
    print("sssssssssssssssssssssssssssssssssss" +_users.name );
    PageMain();}
  else{
      print("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
  Text("aaaaaaaaaaaaaaaaa" );
  }}


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



