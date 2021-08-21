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
  Widget build( context) {

    return Container(

     color:dark,
      padding: EdgeInsets.only(left: 16, top: 25, right: 16),
      child: ListView(
        children: [
          Center(child:
          Text(
         "Settings",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, fontFamily:font,color: darkfont),
          )),
          SizedBox(
            height: 40,
          ),
          // Row(
          //   children: [
          //     Icon(
          //       Icons.person,
          //       color: changecolor,
          //     ),
          //     SizedBox(
          //       width: 8,
          //     ),
          //     Text(
          //
          //       "Account",
          //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,fontFamily: font,color: darkfont),
          //     ),
          //   ],
          // ),
          // Divider(
          //   height: 15,
          //   thickness: 2,
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          //
          // buildAccountOptionRow1(context,  "Change password"),
          // buildAccountOptionRow2(context, "Content settings"),
          //
          //
          // SizedBox(
          //   height: 40,
          // ),
          Row(
            children: [

              Text(
                 "التصميم",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.red[300],fontFamily: font,),
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
          SizedBox(height: 70,),
          buildAccountOptionRow5(context,"اللغة"),
          Divider(
            height: 15,
            thickness: 2,
          ),




          buildAccountOptionRow4(context,"Arabic"),
          buildAccountOptionRow4(context,"English"),



          SizedBox(
            height: 40,
          ),
          Row(
            // children: [
            //   Icon(
            //     Icons.volume_up_outlined,
            //     color: changecolor,
            //   ),
            //   SizedBox(
            //     width: 8,
            //   ),
            //   Text(
            //        "Notifications",
            //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,fontFamily: font,color: darkfont),
            //   ),
            // ],
          ),
          SizedBox(
            height: 10,
          ),

   //       buildNotificationOptionRow("New for you", true),
        //  buildNotificationOptionRow("Account activity", true),
        //  buildNotificationOptionRow("Opportunity", false),
          SizedBox(
            height: 50,
          ),

        ],
      ),
    );

  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color:darkfont,
            fontFamily: font,

          ),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }
  GestureDetector buildAccountOptionRow1(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
               backgroundColor: darkAlert,
                title: Text(title, style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color:darkfont,
                  fontFamily: font,
                ),),

                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
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
                fontFamily: font,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: darkfont,
            ),
          ],
        ),
      ),
    );
  }
  GestureDetector buildAccountOptionRow2(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: darkAlert,
                title: Text(title, style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: font,
                ),),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
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
                color: darkfont,
                fontFamily: font,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: darkfont,
            ),
          ],
        ),
      ),
    );
  }
  GestureDetector buildAccountOptionRow3(BuildContext context, String title) {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: darkAlert,
                  title: Text(title, style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: font,
                  ),),
                  content: Container(
                    height: 500,
                    width: 500,
                    child: Center(
                      child:ColorPicker(
                        color: Colors.red,
                        onChanged: (value){
                          setState(() {

                            changecolor = value ;

                            // RestartWidget.restartApp(context);
                            //   Navigator.of(context).pushNamed('/a');

                          });
                        },
                      ),
                    ),
                  ),
                  actions: [
                    SingleChildScrollView(child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          child: Text( 'Activatie' ,

                          ),
                          onPressed: (){
                            setState(() {

                              Navigator.of(context).pop();
                              Navigator.of(context).popAndPushNamed('/a');
                             // Navigator.popAndPushNamed(context, MaterialPageRoute(builder: (context) => StartMain() ) );
                            });

                          },
                        ),
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();


                            },
                            child: Text("Close")),
                      ],

                    ))
                  ],
                );
              });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.palette,
                color: darkfont,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color:darkfont,
                  fontFamily: font,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: darkfont,
              ),
            ],
          ),
        )); }
  GestureDetector buildAccountOptionRow4(BuildContext context, String title) {
    // return GestureDetector(
    //     onTap: () {
    //       showDialog(
    //
    //           context: context,
    //
    //           builder: (BuildContext context) {
    //             return AlertDialog(
    //
    //               backgroundColor: darkAlert,
    //               title: Text(title, style: TextStyle(
    //                 fontSize: 18,
    //                 fontWeight: FontWeight.w500,
    //
    //                 fontFamily: font,
    //               ),),
    //               content:SingleChildScrollView( child:  Column(
    //             mainAxisSize: MainAxisSize.max,
    //
    //                 children: [
    //                   ListTile(
    //                     title: Text(
    //                       " Choose font !",
    //
    //                         style: TextStyle(
    //                           fontSize: 18,
    //                           fontWeight: FontWeight.w500,
    //                           color:darkfont,
    //                           fontFamily: font,
    //                         ),
    //                     ),
    //
    //                   ),
    //
    //                   FlatButton(
    //                     child: Text(  "Default",
    //                       style: TextStyle(
    //                         fontSize: 15,
    //                         color:darkfont,
    //
    //                         fontWeight: FontWeight.bold,
    //                         fontFamily: "OpenSans",
    //                       ),),
    //                     onPressed: (){
    //                       setState(() {
    //
    //                         font = "OpenSans";
    //                       });
    //
    //                     },
    //                   ),
    //                   FlatButton(
    //                     child: Text(  'DancingScript',
    //                       style: TextStyle(
    //                         fontSize: 15,
    //                         color:darkfont,
    //
    //                         fontWeight: FontWeight.bold,
    //                         fontFamily: "DancingScript",
    //                       ),),
    //                     onPressed: (){
    //                       setState(() {
    //
    //                         font = "DancingScript";
    //                       });
    //
    //                     },
    //                   ),
    //                   FlatButton(
    //                     child: Text(  'Chango',
    //                       style: TextStyle(
    //                         fontSize: 15,
    //                         color:darkfont,
    //
    //                         fontWeight: FontWeight.bold,
    //                         fontFamily: "Chango",
    //                       ),),
    //
    //                     onPressed: (){
    //                       setState(() {
    //
    //                         font = "Chango";
    //                       });
    //
    //                     },
    //                   ),
    //                   FlatButton(
    //                     child: Text(  'DelaGothicOne',
    //                       style: TextStyle(
    //                         fontSize: 15,
    //                         color:darkfont,
    //                         fontWeight: FontWeight.bold,
    //                         fontFamily: "DelaGothicOne",
    //                       ),),
    //                     onPressed: (){
    //                       setState(() {
    //
    //                         font = "DelaGothicOne";
    //                       });
    //
    //                     },
    //                   ),
    //                   FlatButton(
    //                     child: Text(  'PermanentMarker',
    //                       style: TextStyle(
    //                         fontSize: 15,
    //                         color:darkfont,
    //                         fontWeight: FontWeight.bold,
    //                         fontFamily: "PermanentMarker",
    //                       ),),
    //                     onPressed: (){
    //                       setState(() {
    //
    //                         font = "PermanentMarker";
    //                       });
    //
    //                     },
    //                   ),
    //                   FlatButton(
    //                     child: Text(  'Lobster',
    //                       style: TextStyle(
    //                         fontSize: 15,
    //                         color:darkfont,
    //                         fontWeight: FontWeight.bold,
    //                         fontFamily: "Lobster",
    //                       ),),
    //                     onPressed: (){
    //                       setState(() {
    //
    //                         font = "Lobster";
    //                       });
    //
    //
    //                     },
    //                   ),
    //                   FlatButton(
    //                     child: Text(  'TrainOne',
    //                       style: TextStyle(
    //                         fontSize: 15,
    //                         color:darkfont,
    //                         fontWeight: FontWeight.bold,
    //                         fontFamily: "TrainOne",
    //                       ),),
    //                     onPressed: (){
    //                       setState(() {
    //
    //                         font = "TrainOne";
    //                       });
    //
    //                     },
    //                   ),
    //
    //                   FlatButton(
    //                     child: Text(  'أميري',
    //                       style: TextStyle(
    //                         fontSize: 15,
    //                         color:darkfont,
    //
    //                         fontWeight: FontWeight.bold,
    //                         fontFamily: "Amiri",
    //                       ),),
    //
    //                     onPressed: (){
    //                       setState(() {
    //
    //                         font = "Amiri";
    //                       });
    //
    //                     },
    //                   ),
    //                   FlatButton(
    //                     child: Text(  'ريم كوفى',
    //                       style: TextStyle(
    //                         fontSize: 15,
    //                         color:darkfont,
    //                         fontWeight: FontWeight.bold,
    //                         fontFamily: "ReemKufi",
    //                       ),),
    //                     onPressed: (){
    //                       setState(() {
    //
    //                         font = "ReemKufi";
    //                       });
    //
    //                     },
    //                   ),
    //                   FlatButton(
    //                     child: Text(  'كوفام',
    //                       style: TextStyle(
    //                         fontSize: 15,
    //                         color:darkfont,
    //                         fontWeight: FontWeight.bold,
    //                         fontFamily: "Kufam",
    //                       ),),
    //                     onPressed: (){
    //                       setState(() {
    //
    //                         font = "Kufam";
    //                       });
    //
    //                     },
    //                   ),
    //                   FlatButton(
    //                     child: Text(  'جمهوري',
    //                       style: TextStyle(
    //                         fontSize: 15,
    //                         color:darkfont,
    //                         fontWeight: FontWeight.bold,
    //                         fontFamily: "Jomhuria",
    //                       ),),
    //                     onPressed: (){
    //                       setState(() {
    //
    //                         font = "Jomhuria";
    //                       });
    //
    //
    //                     },
    //                   ),
    //                   FlatButton(
    //                     child: Text(  'تشانجا',
    //                       style: TextStyle(
    //                         fontSize: 15,
    //                         color:darkfont,
    //                         fontWeight: FontWeight.bold,
    //                         fontFamily: "Changa",
    //                       ),),
    //                     onPressed: (){
    //                       setState(() {
    //
    //                         font = "Changa";
    //                       });
    //
    //                     },
    //                   ),
    //
    //
    //                 ],),
    //               ),
    //               actions: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     FlatButton(
    //                       child: Text( 'Activatie' ,
    //
    //                       ),
    //                       onPressed: (){
    //                         setState(() {
    //
    //                           Navigator.of(context).pop();
    //                           Navigator.of(context).popAndPushNamed('/a');
    //                         });
    //
    //                       },
    //                     ),
    //                     FlatButton(
    //                         onPressed: () {
    //                           Navigator.of(context).pop();
    //
    //
    //                         },
    //                         child: Text("Close")),
    //                   ],
    //
    //                 )    ],
    //             );
    //           });
    //     },
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(vertical: 8.0),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         // children: [
    //         //   Icon(
    //         //     Icons.font_download_outlined,
    //         //     color: darkfont,
    //         //   ),
    //         //   Text(
    //         //     title,
    //         //     style: TextStyle(
    //         //       fontSize: 18,
    //         //       fontWeight: FontWeight.w500,
    //         //       color: darkfont,
    //         //       fontFamily: font,
    //         //     ),
    //         //   ),
    //         //   Icon(
    //         //     Icons.arrow_forward_ios,
    //         //     color:darkfont,
    //         //   ),
    //         // ],
    //       ),
    //     ));


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
                  color:darkfont,
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
                      "تفعيل ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),
                    ),
                  ),
                ),
                onTap: () async {
                  // setState(() async {
                  //
                  //   //   _con. getProductsSearch(_chosenValue);
                  // });
                  // SharedPreferences preferences = await SharedPreferences.getInstance();
                  // preferences.setString('color',"Dark");
                  // //  Navigator.pop(context);
                  // SystemNavigator.pop();
                  //_loginrController.loginfirebase();
                  //   Navigator.of(context).pushReplacementNamed('/e');
                  //SignupMain
                },
              ),


            ],
          ),
        ));


  }
  Container buildAccountOptionRow5(BuildContext context, String title) {
    return Container(

        child:  Row(
        children:[

       //    Padding( padding: EdgeInsets.all(8),
       //  child: DropdownButton( underline: SizedBox(),
       //  dropdownColor: darkAlert,
       //  hint: Text( title,
       //    style: TextStyle(
       //      fontSize: 18,
       //      fontWeight: FontWeight.w500,
       //      color:darkfont,
       //      fontFamily: font,
       //    ),
       //  ),
       //
       // /* items: Language.languageList().map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
       //
       //    value: lang,
       //    child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
       //      children: <Widget>[ Text(lang.name ,style: TextStyle(
       //        fontSize: 18,
       //        fontWeight: FontWeight.w500,
       //        color: darkfont,
       //        fontFamily: font,
       //      ),) ], ),)).toList(),
       //  onChanged: (Language lang) {
       //    _changeLanguage(lang);
       //  },*/
       // ), ),

         Text( title,
           style: TextStyle(
             fontSize: 18,
             fontWeight: FontWeight.w500,
             color:Colors.red[300],
             fontFamily: font,
           ),
         ),
          Icon(
            Icons.language,
            color: Colors.red[300],
          ),])) ;

  }
  GestureDetector buildAccountOptionRow6(BuildContext context, String title) {
    return GestureDetector(


      onTap: () {_ThemDialog();},
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
                color: darkfont,
                fontFamily: font,
              ),
            ),
            Icon(
              Icons.palette,
              color: darkfont,
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
                          "تفعيل ",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),
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
                          "تفعيل ",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),
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
              height:100.0,
              alignment: AlignmentDirectional.center,
              child: new   Column(children:[
                SizedBox(height: 20,),
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
                            "تفعيل ",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),
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


 /* void _changeLanguage(Language lang) {
    Locale _temp;
    switch (lang.languageCode)
  { case 'en': _temp = Locale(lang.languageCode, '');
    break;
    case 'ar': _temp = Locale(lang.languageCode, '');
    break;
    default: _temp = Locale('en', 'US'); break; } MyApp.setLocale(context, _temp); }*/

