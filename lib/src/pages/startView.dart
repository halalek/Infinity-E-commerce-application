import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:structurepublic/src/controler/login_controller.dart';
import 'package:structurepublic/src/controler/logout_controller.dart';
import 'package:structurepublic/src/controler/start_controller.dart';
import 'package:structurepublic/src/pages/chat_user.dart';
import 'package:structurepublic/src/pages/pageSold.dart';
import 'package:structurepublic/src/pages/page_1.dart';
import 'package:structurepublic/src/pages/page_Main_View.dart';
import 'package:structurepublic/src/pages/page_webinfinity.dart';
import 'package:structurepublic/src/pages/page_welcome.dart';
import 'package:structurepublic/src/pages/privacy_policy.dart';
import 'package:structurepublic/src/pages/profil.dart';
import 'package:structurepublic/src/pages/settings.dart';
import 'package:structurepublic/src/pages/vereible.dart';

import '../../generated/l10n.dart';
import '../../main.dart';
import '../controler/user_controller.dart';
import '../elements/BlockButtonWidget.dart';
import '../helpers/app_config.dart' as config;
import '../repository/user_repository.dart' as userRepo;

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'chat_userdalal.dart';
import 'contact_support.dart';

import 'events.dart';
import 'loginView.dart';
import 'my_drawer_header.dart';
import 'notifications.dart';


class Pagemain1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Pagemain1();
  }


}

class _Pagemain1 extends State<Pagemain1>
{
  //VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: StartMain(),
      title:

      Text(
        'infinity shopping',
        style:
        new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0,color: Theme.of(context).primaryColorDark,),
        // textAlign: TextAlign.right,
      ),

      // backgroundColor: Colors.black12,
      // imageBackground: new AssetImage('img/back.jpg') ,
     // image: Image.asset('assets/img/cardd.gif'),
        image: Image.asset('assets/img/gifgif.gif'),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 150.0,
       loaderColor: Theme.of(context).primaryColorLight,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
class StartMain extends StatefulWidget {
  @override
  _StartMain createState() => _StartMain();

}

class _StartMain extends StateMVC<StartMain> {
  UserController _con;
bool show=true;
  _StartMain() : super(UserController()) {
    // _con = controller;
    _con = controller;
   _con.getToken();

  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
  }


  void AlertMe(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      // insetPadding: EdgeInsets.all(10),
      backgroundColor: darkAlert,
      content:
      Column(

        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("Exit",
            style: TextStyle(
              fontSize: 15,
              color: darkfont,
              fontFamily: font,
              fontWeight: FontWeight.bold,
            ),
          ),
          /* leading: Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.help,
                color: Colors.red,
              ),
            ),*/

          Container(

            margin: EdgeInsets.all(15),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                    child: Text("YES", style: TextStyle(color: Colors.black,),),
                    color: Colors.grey,
                    minWidth: 80,
                    onPressed: () async {
                      SharedPreferences preferences = await SharedPreferences.getInstance();
                      preferences.remove('user');
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomePage(),),);
                      //LoginMainPage()
                      //  await FirebaseAuth.instance.signOut();
                      // RestartWidget.restartApp(context) ;

                    }),
                Text(""),
                MaterialButton(
                  child: Text("NO", style: TextStyle(color: Colors.black,),),
                  color: Colors.grey,
                  minWidth: 80,
                  onPressed: ()  {
                   // Navigator.pop(context);
                  //  Navigator.pop(context, false);

                  },),

              ],
            ),
          ),
        ],

      ),
    );

      showDialog(context: context,

          //barrierDismissible :false,
          builder: (BuildContext context) {
            return alertDialog;

          }

      );


  }

  var currentPage = DrawerSections.page_Main_View;
  var container;

  bool set = false;
  int point = 0;

  @override
  Widget build(BuildContext context) {
    if (currentPage == DrawerSections.page_Main_View) {
      container =  Page1();
    }
    else if (currentPage == DrawerSections.contact_support) {
      container = LinkifyExample();
    }
    else if (currentPage == DrawerSections.Them) {
     _ThemDialog();
    }
    //PageChatUser
    else if (currentPage == DrawerSections.chat) {
     container = PageChatUser();
     // container = PageChatUserdala("0icEpHVaoMlDk6ijQXNk");
      //0icEpHVaoMlDk6ijQXNk
     // PageChatUserdala();
    }
    else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    }


    return Scaffold(


        appBar: AppBar(
          backgroundColor: changecolor,
          title: Row(children: [
            Center(child: Image(


              image: AssetImage('assets/img/drawer.png'),
              width: 200,
              height: 50,
            ),),


          ],)


          //logo infinty
        ),
        body:
        container,

        drawer: Drawer(


          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: SingleChildScrollView(
              child: Stack(

                children: [
                  MyHeaderDrawer(),
                  Column(
                      children: [
                        SizedBox(
                          height: 188,
                        ),
                        MyDrawerList(),
                      ]),
                ],
              ),
            ),),

        ),


        bottomNavigationBar: BottomNavigationBar(

            currentIndex:  point,
            selectedFontSize: 15,
            selectedItemColor: Theme.of(context).primaryColorDark,
           // unselectedItemColor: Colors.black45,
            unselectedItemColor: Colors.black45,
            unselectedFontSize: 5,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  //  color: Colors.black45,
                ),
                title: Text(
                  language1=="en" ? "Home" :
                  "الرئيسية",
                  // style: TextStyle(color: Colors.black45),
                ),
               // backgroundColor: Colors.white38,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_grocery_store,
                  //  color: Theme.of(context).primaryColorLight,
                ),
                title: Text(
                  language1=="en" ? "Shopping " :
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
                  language1=="en" ? "Offers " :
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
                  language1=="en" ? "Profile" :
                  "حسابك",
                  //   style: TextStyle(color: Colors.black45),
                ),
                // backgroundColor:Colors.white38,
              ),
            ],
            onTap: (index) {
              setState(() {
                point=index;

                if(point==1)
                {

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context)=>PageMain(),),);

                }
                if(point==2)
                {

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context)=> PageSold(),),);

                }
                if(point==3)
                {

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context)=> ProfilePage(),),);

                }


              }
    );
  }
    )
    );
}

  Widget MyDrawerList() {
    return Container(

      padding: EdgeInsets.only(
        top: 15,
      ),

      child: Column(

        children: [
          menuItem(1, "Chat", Icons.chat,
              currentPage == DrawerSections.chat ? true : false,),
          menuItem(2, "Common questions", Icons.youtube_searched_for,
              currentPage == DrawerSections.contact_support ? true : false),
          Divider(),
          menuItem(5, "Settings", Icons.settings,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(8, "Exit", Icons.label_important, set),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(

      color: selected ? Colors.grey[400] : Colors.transparent,
      child:
      InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.chat;
            } else if (id == 2) {
              currentPage = DrawerSections.contact_support;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            }  else if (id == 3) {
              currentPage = DrawerSections.Them;
            } else if (id == 8) {
              set = true;
              AlertMe(context);
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontFamily: font,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _ThemDialog() {
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
              height:250.0,
              alignment: AlignmentDirectional.center,
              child: new   Column(children:[
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Dark",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color:darkfont,
                      ),
                    ),
                    Text("Light",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color:darkfont,
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(
                      image: AssetImage( 'assets/img/moon.png',),
                      width:50,
                      height:50,
                    ),
                    Image(
                      image: AssetImage( 'assets/img/sun.png',),
                      width:50,
                      height:50,
                    ),
                  ],
                ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: Container(
                        height: 30,
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
                            "تفعيل ",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () async {
                        // setState(() async {
                        //
                        //   //   _con. getProductsSearch(_chosenValue);
                        // });
                        SharedPreferences preferences = await SharedPreferences.getInstance();
                        preferences.setString('color',"Dark");
                        //  Navigator.pop(context);
                        SystemNavigator.pop();
                        //_loginrController.loginfirebase();
                        //   Navigator.of(context).pushReplacementNamed('/e');
                        //SignupMain
                      },
                    ),


                    InkWell(
                      child: Container(
                        height: 30,
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
                            "تفعيل ",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () async {
                        // setState(() async {
                        //   SharedPreferences preferences = await SharedPreferences.getInstance();
                        //   preferences.setString('color',"light");
                        //   //   _con. getProductsSearch(_chosenValue);
                        // });
                        SharedPreferences preferences = await SharedPreferences.getInstance();
                        preferences.setString('color',"light");
                        // Navigator.pop(context);
                        SystemNavigator.pop();

                        //   Navigator.push(context, MaterialPageRoute(builder: ( context) => MyApp() ) );
                        //_loginrController.loginfirebase();
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context) => StartMain() ) );
                        //SignupMain
                      },
                    ),
                  ],
                )
              ])
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

  }




}




enum DrawerSections {
  page_Main_View,
  contact_support,
  settings,
  chat,
  Them,
  notifications,
  privacy_policy,
  send_feedback,

}





