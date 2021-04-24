import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/controler/login_controller.dart';
import 'package:structurepublic/src/controler/start_controller.dart';
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
import 'my_drawer_header.dart';
import 'notifications.dart';

class StartMain extends StatefulWidget {
  @override
  _StartMain createState() => _StartMain();
}

class _StartMain extends StateMVC<StartMain> {
  StartController _StartrController;
  _StartMain() : super( StartController()) {
    // _con = controller;
    _StartrController = controller;
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
          Text("exit",
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

            margin: EdgeInsets.all(25),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                    child:Text("YES",style: TextStyle(color: Colors.black,),),
                    color: Colors.grey,
                    minWidth: 100,
                    onPressed:() async {
                      //  await FirebaseAuth.instance.signOut();
                     // RestartWidget.restartApp(context) ;

                    }),
                MaterialButton(
                  child:Text("No", style: TextStyle(color: Colors.black,),),
                  color: Colors.grey,
                  minWidth: 100,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },),

              ],
            ),
          ),
        ],

      ),
    ) ;
    showDialog(context: context,
        builder: (BuildContext context) {

          return alertDialog;
        });
  }

  var currentPage = DrawerSections.dashboard;
  var container ;
  bool set =false;


  @override
  Widget build(BuildContext context) {
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
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
        title :Center( child:Image(



          image: AssetImage('assets/img/drawer.png'),
          width:200,
          height:50,
        ),),


        //logo infinty
      ),
      body:container,
      drawer: Drawer(



        child: Container(
          color:dark,
          child: SingleChildScrollView(
            child: Stack(

              children: [
                MyHeaderDrawer(),
                Column(
                    children: [
                      SizedBox(
                        height: 188,
                      ),
                      MyDrawerList(),]),
              ],
            ),
          ),  ),

      ),
    );
  }

  Widget MyDrawerList() {
    return Container(

      padding: EdgeInsets.only(
        top: 15,
      ),

      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1,"Dashboard" , Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Common questions", Icons.contact_support_outlined,
              currentPage == DrawerSections.contact_support ? true : false),
          menuItem(3,"Events" , Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Profile", Icons.account_circle,
              currentPage == DrawerSections.Profile ? true : false),
          Divider(),
          menuItem(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          Divider(),
          menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(8,  "Exit", Icons.logout,set),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(

      color: selected ? Colors.grey[400]: Colors.transparent,
      child:
      InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
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
              set= true;
              AlertMe(context ) ;
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
  dashboard,
  contact_support,
  events,
  Profile,
  settings,
  notifications,
  privacy_policy,
  send_feedback,

}





