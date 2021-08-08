import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:structurepublic/src/controler/login_controller.dart';
import 'package:structurepublic/src/controler/logout_controller.dart';
import 'package:structurepublic/src/controler/start_controller.dart';
import 'package:structurepublic/src/pages/pageSold.dart';
import 'package:structurepublic/src/pages/page_1.dart';
import 'package:structurepublic/src/pages/page_Main_View.dart';
import 'package:structurepublic/src/pages/page_welcome.dart';
import 'package:structurepublic/src/pages/privacy_policy.dart';
import 'package:structurepublic/src/pages/profil.dart';
import 'package:structurepublic/src/pages/settings.dart';
import 'package:structurepublic/src/pages/vereible.dart';

import '../../generated/l10n.dart';
import '../controler/user_controller.dart';
import '../elements/BlockButtonWidget.dart';
import '../helpers/app_config.dart' as config;
import '../repository/user_repository.dart' as userRepo;

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'contact_support.dart';
import 'dashboard.dart';
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
       loaderColor: Theme.of(context).primaryColorLight
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
    } else if (currentPage == DrawerSections.contact_support) {
      container = Common_questionsPage();
    } else if (currentPage == DrawerSections.events) {
      container = EventsPage();
    } else if (currentPage == DrawerSections.Profile) {
      container = ProfilePage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationsPage();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicyPage();
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
    // SizedBox(
    // width: 20.0,
    // height: 20.0,
    // child:GestureDetector(
    // child: Icon(Icons.refresh,),
    //   onTap: () {
    // Navigator.pushReplacement(
    //           context,
    //           MaterialPageRoute(
    //             builder: (BuildContext context) =>   StartMain(),));},
    // ))


          ],)


          //logo infinty
        ),
        body:
        container,

        drawer: Drawer(


          child: Container(
            color: dark,
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
          menuItem(1, "Dashboard", Icons.dashboard,
              currentPage == DrawerSections.page_Main_View ? true : false),
          menuItem(2, "Common questions", Icons.youtube_searched_for,
              currentPage == DrawerSections.contact_support ? true : false),
          menuItem(3, "Events", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Profile", Icons.account_circle,
              currentPage == DrawerSections.Profile ? true : false),
          Divider(),
          menuItem(5, "Settings", Icons.settings,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Notifications", Icons.notifications_none,
              currentPage == DrawerSections.notifications ? true : false),
          Divider(),
          menuItem(7, "Privacy policy", Icons.fingerprint,
              currentPage == DrawerSections.privacy_policy ? true : false),
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
              currentPage = DrawerSections.page_Main_View;
            } else if (id == 2) {
              currentPage = DrawerSections.contact_support;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.Profile;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
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
                  color: darkfont,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: darkfont,
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
}

enum DrawerSections {
  page_Main_View,
  contact_support,
  events,
  Profile,
  settings,
  notifications,
  privacy_policy,
  send_feedback,

}





