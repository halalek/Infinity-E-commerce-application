import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:structurepublic/src/models/user.dart';
import 'package:structurepublic/src/pages/loginView.dart';
import 'package:structurepublic/src/pages/startView.dart';

import 'generated/l10n.dart';
import 'route_generator.dart';
import 'src/controler/shared.dart';
import 'src/helpers/custom_trace.dart';
import 'src/models/setting.dart';
import 'src/pages/mainView.dart';
import 'src/pages/marketView.dart';
import 'src/pages/page_Main_View.dart';
import 'src/pages/verfiyView.dart';
import 'src/repository/settings_repository.dart' as settingRepo;
import 'src/repository/user_repository.dart' as userRepo;
import 'src/helpers/app_config.dart' as config;
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {
//  await GlobalConfiguration().loadFromAsset("configurations");
//  print(CustomTrace(StackTrace.current, message: "base_url: ${GlobalConfiguration().getString('base_url')}"));


  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var user = preferences.getString('user');
  await Firebase.initializeApp();
  runApp(MaterialApp(home: user == null ? LoginMain() :  MyApp(),));


  //runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    settingRepo.initSettings();
     super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: settingRepo.setting,
        builder: (context, Setting _setting, _) {
          return  MaterialApp(
              routes: <String,WidgetBuilder>{
                '/a':(BuildContext context) =>StartMain(),
              },
              navigatorKey: settingRepo.navigatorKey,
              title: "",
              home:
            //  PageMarket(),
             //PageMain(),
              StartMain(),
              //LoginMain(),
              //MainStateWidget(),
              // initialRoute: '/MainStateWidget',
              onGenerateRoute: RouteGenerator.generateRoute,
              debugShowCheckedModeBanner: false,
              locale: _setting.mobileLanguage.value,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              theme: _setting.brightness.value == Brightness.light
                  ? ThemeData(
                fontFamily: 'Poppins',
                primaryColor: Colors.white,
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
                fontFamily: 'Poppins',
                primaryColor: Color(0xFF252525),
                brightness: Brightness.dark,
                scaffoldBackgroundColor: Color(0xFF2C2C2C),
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
              ));

        });
  }
}



// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   var email = preferences.getString('email');
//   runApp(MaterialApp(home: email == null ? Login() : Dashboard(),));
// }
//
//
// class Login extends StatefulWidget {
// @override
// _LoginState createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//
//
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passController = TextEditingController();
//
//   String email = "shawon@gmail.com";
//   String password = "123";
//
//   Future checkLogin()async{
//     if (emailController.text == email && passController.text == password) {
//
//       SharedPreferences preferences = await SharedPreferences.getInstance();
//       preferences.setString('email', emailController.text);
//
//       Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard(),),);
//       Fluttertoast.showToast(
//           msg: "Login Successful",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.green,
//           textColor: Colors.white,
//           fontSize: 16.0
//       );
//     }else{
//       Fluttertoast.showToast(
//           msg: "Username & Password Invalid!",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0
//       );
//     }
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login'),),
//       body: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Text('Login',style: TextStyle(fontSize: 25,fontFamily: 'Nasalization'),),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText:'Username'),),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: passController,
//               decoration: InputDecoration(labelText:'Password'),),
//           ),
//           SizedBox(height: 10,),
//           MaterialButton(
//             color: Colors.pink,
//             onPressed: (){
//               checkLogin();
//             },child: Text('Login',style: TextStyle(color: Colors.white)),),
//         ],
//       ),
//     );
//   }
// }