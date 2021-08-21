import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:structurepublic/src/helpers/app_config.dart';
import 'package:structurepublic/src/models/user.dart';
import 'package:structurepublic/src/pages/convertSoundtoText.dart';
import 'package:structurepublic/src/pages/editProfil.dart';
import 'package:structurepublic/src/pages/loginNumber.dart';
import 'package:structurepublic/src/pages/loginView.dart';
import 'package:structurepublic/src/pages/pageRating.dart';
import 'package:structurepublic/src/pages/pageTrollery.dart';
import 'package:structurepublic/src/pages/page_Main_View.dart';
import 'package:structurepublic/src/pages/page_welcome.dart';
import 'package:structurepublic/src/pages/productDetail.dart';
import 'package:structurepublic/src/pages/profil.dart';
import 'package:structurepublic/src/pages/sharedPref.dart';
import 'package:structurepublic/src/pages/startView.dart';
import 'generated/l10n.dart';
import 'route_generator.dart';
import 'src/models/setting.dart';
import 'src/repository/settings_repository.dart' as settingRepo;
import 'src/helpers/app_config.dart' as config;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:structurepublic/src/pages/mydemand.dart';

var user1;
var color1;
Future<void> main() async {
//  await GlobalConfiguration().loadFromAsset("configurations");
//  print(CustomTrace(StackTrace.current, message: "base_url: ${GlobalConfiguration().getString('base_url')}"));


  //SharedPref sharedPref=SharedPref();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var user = preferences.getString('user');
  var color = preferences.getString('color');
user1=user;color1=color;
var i=1;
  //
 //Userss user = Userss.fromJson(await sharedPref.read('user')) ;
  await Firebase.initializeApp();
  // runApp(MaterialApp( theme:
  //      ThemeData(
  //     primaryColorDark: Colors.redAccent,
  //     primaryColorLight: Colors.red[300],),
  //        debugShowCheckedModeBanner: false,home:  MyApp(),));//basic


// runApp(MaterialApp(theme:
//        ThemeData(
//            primaryColorDark: Colors.red[300],
//            primaryColorLight: Colors.deepOrange,
//        backgroundColor: Colors.red[300]),
//          debugShowCheckedModeBanner: false,home: user == null ? WelcomePage() : MyApp(),));//basicbasic
  runApp(MyApp());//MyAppo//Pagemain1()
  //runApp(MaterialApp(debugShowCheckedModeBanner: false,home :  AuthService().handleAuth(),));//number

}

class MyApp extends StatefulWidget {
  @override

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>  {
  @override
  void initState() {
    settingRepo.initSettings();
     super.initState();

  }

  @override
  Widget build(BuildContext context) {
   // ColorsApp cc=ColorsApp();
   //  {cc.cl=Colors.white;cc.cl2=Colors.white;}
    return ValueListenableBuilder(
        valueListenable: settingRepo.setting,
        builder: (context, Setting _setting, _,) {

      // ColorsApp {
      //   var cl=Colors.brown[800];
      //   var cl2=Colors.brown[900];
          return  MaterialApp(
              routes: <String,WidgetBuilder>{
                '/a':(BuildContext context) =>StartMain(),
                '/b':(BuildContext context) => editProfilePage(),
                '/d':(BuildContext context) => pageTrollery(),
                '/c':(BuildContext context) => Pagemydemand(),
                '/e':(BuildContext context) => StartMain(),
              //  '/a':(context) =>StartMain(),
              },
              navigatorKey: settingRepo.navigatorKey,
              //debugShowMaterialGrid: false,
              title: "",
              home:
             (user1 == null ? WelcomePage() :  Pagemain1()),
            //  PageMarket(),
          //    Pagemain1(),/////////baaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
              //StartMain(),
              //LoginMain(),
              //MainStateWidget(),
              // initialRoute: '/MainStateWidget',
              onGenerateRoute: RouteGenerator.generateRoute,
              debugShowCheckedModeBanner: false,
              locale:( _setting.mobileLanguage.value),
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              theme:
              _setting.brightness.value ==( color1=="Dark" ? Brightness.dark : Brightness.light)
                  ? ThemeData(
                fontFamily: 'Poppins',
                primaryColorDark: Colors.red[300],
                primaryColorLight: Colors.deepOrange,
                primaryColor: Colors.black,
                cardColor: Colors.white,
                scaffoldBackgroundColor: Colors.white,
                // cardColor:Colors.brown[800],
                //  canvasColor:Colors.brown[900],
                 // cl=Colors.brown[800];
                  //   var cl2=Colors.brown[900];
                floatingActionButtonTheme: FloatingActionButtonThemeData(elevation: 0, foregroundColor: Colors.white),
                brightness: Brightness.light,
                accentColor: config.ColorsApp().mainColor(1),
                dividerColor: config.ColorsApp().secondColor(0.1),
                focusColor: config.ColorsApp().secondColor(1),
                hintColor: config.ColorsApp().secondColor(1),
                textTheme: TextTheme(
                  headline5: TextStyle(fontSize: 20.0, color: config.ColorsApp().secondColor(1), height: 1.35),
                  headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: config.ColorsApp().secondColor(1), height: 1.35),
                  subtitle1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: config.ColorsApp().secondColor(1), height: 1.35),
                  headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: config.ColorsApp().mainColor(1), height: 1.35),
                  bodyText2: TextStyle(fontSize: 12.0, color: config.ColorsApp().secondColor(1), height: 1.35),
                  bodyText1: TextStyle(fontSize: 14.0, color: config.ColorsApp().secondColor(1), height: 1.35),
                  caption: TextStyle(fontSize: 12.0, color: config.ColorsApp().secondColor(1), height: 1.35),

                  headline1: TextStyle(fontSize: 60.0, color: Colors.white),
                  headline2: TextStyle(fontSize: 35, color: Colors.white),
                  headline3: TextStyle(fontSize: 20, color: Colors.white),

                  //                    body2: TextStyle(fontSize: 12, color: Colors.white),
//                    subhead: TextStyle(fontSize: 15, color: Colors.black)
                ),
              )
                  : ThemeData(

               // cardColor:Colors.white,
               // canvasColor:Colors.deepOrange,
                primaryColorDark: Colors.red[300],
                primaryColorLight: Colors.deepOrange,
                // primaryColor: Colors.white,
                // floatingActionButtonTheme: FloatingActionButtonThemeData(elevation: 0, foregroundColor: Colors.black12),
                fontFamily: 'Poppins',
                cardColor: Colors.white12,
                //primaryColor: Color(0xFF252525),
                primaryColor:Colors.white,
                brightness: Brightness.dark,
                scaffoldBackgroundColor: Color(0xFF2C2C2C),
               // scaffoldBackgroundColor: Colors.black26,
                accentColor: config.ColorsApp().mainDarkColor(1),
                dividerColor: config.ColorsApp().secondColor(0.1),
                hintColor: config.ColorsApp().secondColor(1),
                focusColor: config.ColorsApp().secondColor(1),
                textTheme: TextTheme(
                  headline5: TextStyle(fontSize: 20.0, color: config.ColorsApp().secondColor(1), height: 1.35),
                  headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: config.ColorsApp().secondColor(1), height: 1.35),
                  subtitle1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: config.ColorsApp().secondColor(1), height: 1.35),
                  headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: config.ColorsApp().mainColor(1), height: 1.35),
                  bodyText2: TextStyle(fontSize: 12.0, color: config.ColorsApp().secondColor(1), height: 1.35),
                  bodyText1: TextStyle(fontSize: 14.0, color: config.ColorsApp().secondColor(1), height: 1.35),
                  caption: TextStyle(fontSize: 12.0, color: config.ColorsApp().secondColor(1), height: 1.35),

                  headline1: TextStyle(fontSize: 60.0, color: Colors.white),
                  headline2: TextStyle(fontSize: 35, color: Colors.white),
                  headline3: TextStyle(fontSize: 20, color: Colors.white),
//                    headline: TextStyle(fontSize: 60.0, color: Colors.white),
//                    title: TextStyle(fontSize: 35, color: Colors.white),
//                    subtitle: TextStyle(fontSize: 20, color: Colors.white),
//                    body1: TextStyle(fontSize: 15, color: Colors.white),
//                    body2: TextStyle(fontSize: 12, color: Colors.white),
//                    subhead: TextStyle(fontSize: 15, color: Colors.black)
                ),
              )

          );

        }

        );


  }


}
