import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/pages/startView.dart';
import 'package:structurepublic/src/pages/vereible.dart';

import '../../main.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.only(left: 16, top: 25, right: 16),
      child: ListView(
        children: [
          Center(
              child: Text(
            "Settings",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                fontFamily: font,
                color: Theme.of(context).primaryColor),
          )),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Text(language1=="en" ? "Them" :
                "التصميم",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[300],
                  fontFamily: font,
                ),
              ),
              Icon(
                Icons.format_paint,
                color: changecolor,
              ),
              SizedBox(
                width: 8,
              ),
            ],
          ),
          Divider(
            height: 15,
            thickness: 2,
          ),
          SizedBox(
            height: 10,
          ),
          //   buildAccountOptionRow3(context, "Change primary Color"),
          buildAccountOptionRow6(context, "Color"),
          // buildAccountOptionRow4(context,"Change font"),
          SizedBox(
            height: 70,
          ),
          buildAccountOptionRow5(context, (language1=="en" ? "Language" :"اللغة")),
          Divider(
            height: 15,
            thickness: 2,
          ),

          buildAccountOptionRow42(context, "Arabic"),
          buildAccountOptionRow4(context, "English"),

          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 10,
          ),

          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  GestureDetector buildAccountOptionRow4(BuildContext context, String title) {
    return GestureDetector(
        onTap: () {
          //_LanguageDialog();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor,
                  fontFamily: font,
                ),
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
                        Colors.red[400]
                      ])),
                  child: Center(
                    child: Text(
                      language1=="en" ? "active" :
                      "تفعيل ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
                onTap: () async {
                  //SystemNavigator.pop();
                  SharedPreferences preferences =
                  await SharedPreferences.getInstance();
                  preferences.setString('language', "en");
                  language1="en";
                  //  Navigator.pop(context);
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
        ));
  }


  GestureDetector buildAccountOptionRow42(BuildContext context, String title) {
    return GestureDetector(
        onTap: () {
          //_LanguageDialog();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor,
                  fontFamily: font,
                ),
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
                        Colors.red[400]
                      ])),
                  child: Center(
                    child: Text(
                      language1=="en" ? "active" :
                      "تفعيل ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
                onTap: () async {
                  //SystemNavigator.pop();
                  SharedPreferences preferences =
                  await SharedPreferences.getInstance();
                  preferences.setString('language', "ar");
                  //  Navigator.pop(context);
                  language1="ar";
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
        ));
  }

  Container buildAccountOptionRow5(BuildContext context, String title) {
    return Container(
        child: Row(children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.red[300],
          fontFamily: font,
        ),
      ),
      Icon(
        Icons.language,
        color: Colors.red[300],
      ),
    ]));
  }

  GestureDetector buildAccountOptionRow6(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        _ThemDialog();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // isSwitched1? IconButton(icon: Icon(Icons.wb_sunny,color: darkfont,), ):IconButton(icon: Icon(Icons.bedtime,color: darkfont,),),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor,
                fontFamily: font,
              ),
            ),
            Icon(
              Icons.palette,
              color: Theme.of(context).primaryColor,
            ),
          ],
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
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: new BorderRadius.circular(10.0)),
              width: 400.0,
              height: 250.0,
              alignment: AlignmentDirectional.center,
              child: new Column(children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Dark",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: darkfont,
                      ),
                    ),
                    Text(
                      "Light",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: darkfont,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(
                      image: AssetImage(
                        'assets/img/moon.png',
                      ),
                      width: 50,
                      height: 50,
                    ),
                    Image(
                      image: AssetImage(
                        'assets/img/sun.png',
                      ),
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              // Color.fromRGBO(143, 148, 251, 1),
                              // Color.fromRGBO(143, 148, 251, .6),
                              Colors.red[300],
                              Colors.red[400]
                            ])),
                        child: Center(
                          child: Text(
                            language1=="en" ? "active" :
                            "تفعيل ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      onTap: () async {
                        // setState(() async {
                        //
                        //   //   _con. getProductsSearch(_chosenValue);
                        // });
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        preferences.setString('color', "Dark");
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
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              // Color.fromRGBO(143, 148, 251, 1),
                              // Color.fromRGBO(143, 148, 251, .6),
                              Colors.red[300],
                              Colors.red[400]
                            ])),
                        child: Center(
                          child: Text(
                            language1=="en" ? "active" :
                            "تفعيل ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      onTap: () async {
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        preferences.setString('color', "light");
                        // Navigator.pop(context);
                        SystemNavigator.pop();
                      },
                    ),
                  ],
                )
              ])),
        );
      },
    );
  }

  void _LanguageDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.circular(10.0)),
              width: 100.0,
              height: 100.0,
              alignment: AlignmentDirectional.center,
              child: new Column(children: [
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          // Color.fromRGBO(143, 148, 251, 1),
                          // Color.fromRGBO(143, 148, 251, .6),
                          Colors.red[300],
                          Colors.red[400]
                        ])),
                    child: Center(
                      child: Text(
                        "555",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  onTap: () async {
                    SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                    preferences.setString('color', "light");
                    // Navigator.pop(context);
                    SystemNavigator.pop();
                  },
                ),
              ])),
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

/* void _changeLanguage(Language lang) {
    Locale _temp;
    switch (lang.languageCode)
  { case 'en': _temp = Locale(lang.languageCode, '');
    break;
    case 'ar': _temp = Locale(lang.languageCode, '');
    break;
    default: _temp = Locale('en', 'US'); break; } MyApp.setLocale(context, _temp); }*/
