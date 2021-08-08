import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
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
          Text(
         "Settings",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, fontFamily:font,color: darkfont),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Icon(
                Icons.person,
                color: changecolor,
              ),
              SizedBox(
                width: 8,
              ),
              Text(

                "Account",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,fontFamily: font,color: darkfont),
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

          buildAccountOptionRow1(context,  "Change password"),
          buildAccountOptionRow2(context, "Content settings"),


          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Icon(
                Icons.format_paint,
                color: changecolor,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                 "Styles",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: darkfont,fontFamily: font),
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
          buildAccountOptionRow3(context, "Change primary Color"),
          buildAccountOptionRow6(context, "Theme"),
          buildAccountOptionRow4(context,"Change font"),
          buildAccountOptionRow5(context,"Language"),



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
          Divider(
            height: 15,
            thickness: 2,
          ),
          SizedBox(
            height: 10,
          ),

          buildNotificationOptionRow("New for you", true),
          buildNotificationOptionRow("Account activity", true),
          buildNotificationOptionRow("Opportunity", false),
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

                    )
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
                  content:SingleChildScrollView( child:  Column(
                mainAxisSize: MainAxisSize.max,

                    children: [
                      ListTile(
                        title: Text(
                          " Choose font !",

                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color:darkfont,
                              fontFamily: font,
                            ),
                        ),

                      ),

                      FlatButton(
                        child: Text(  "Default",
                          style: TextStyle(
                            fontSize: 15,
                            color:darkfont,

                            fontWeight: FontWeight.bold,
                            fontFamily: "OpenSans",
                          ),),
                        onPressed: (){
                          setState(() {

                            font = "OpenSans";
                          });

                        },
                      ),
                      FlatButton(
                        child: Text(  'DancingScript',
                          style: TextStyle(
                            fontSize: 15,
                            color:darkfont,

                            fontWeight: FontWeight.bold,
                            fontFamily: "DancingScript",
                          ),),
                        onPressed: (){
                          setState(() {

                            font = "DancingScript";
                          });

                        },
                      ),
                      FlatButton(
                        child: Text(  'Chango',
                          style: TextStyle(
                            fontSize: 15,
                            color:darkfont,

                            fontWeight: FontWeight.bold,
                            fontFamily: "Chango",
                          ),),

                        onPressed: (){
                          setState(() {

                            font = "Chango";
                          });

                        },
                      ),
                      FlatButton(
                        child: Text(  'DelaGothicOne',
                          style: TextStyle(
                            fontSize: 15,
                            color:darkfont,
                            fontWeight: FontWeight.bold,
                            fontFamily: "DelaGothicOne",
                          ),),
                        onPressed: (){
                          setState(() {

                            font = "DelaGothicOne";
                          });

                        },
                      ),
                      FlatButton(
                        child: Text(  'PermanentMarker',
                          style: TextStyle(
                            fontSize: 15,
                            color:darkfont,
                            fontWeight: FontWeight.bold,
                            fontFamily: "PermanentMarker",
                          ),),
                        onPressed: (){
                          setState(() {

                            font = "PermanentMarker";
                          });

                        },
                      ),
                      FlatButton(
                        child: Text(  'Lobster',
                          style: TextStyle(
                            fontSize: 15,
                            color:darkfont,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Lobster",
                          ),),
                        onPressed: (){
                          setState(() {

                            font = "Lobster";
                          });


                        },
                      ),
                      FlatButton(
                        child: Text(  'TrainOne',
                          style: TextStyle(
                            fontSize: 15,
                            color:darkfont,
                            fontWeight: FontWeight.bold,
                            fontFamily: "TrainOne",
                          ),),
                        onPressed: (){
                          setState(() {

                            font = "TrainOne";
                          });

                        },
                      ),

                      FlatButton(
                        child: Text(  'أميري',
                          style: TextStyle(
                            fontSize: 15,
                            color:darkfont,

                            fontWeight: FontWeight.bold,
                            fontFamily: "Amiri",
                          ),),

                        onPressed: (){
                          setState(() {

                            font = "Amiri";
                          });

                        },
                      ),
                      FlatButton(
                        child: Text(  'ريم كوفى',
                          style: TextStyle(
                            fontSize: 15,
                            color:darkfont,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ReemKufi",
                          ),),
                        onPressed: (){
                          setState(() {

                            font = "ReemKufi";
                          });

                        },
                      ),
                      FlatButton(
                        child: Text(  'كوفام',
                          style: TextStyle(
                            fontSize: 15,
                            color:darkfont,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Kufam",
                          ),),
                        onPressed: (){
                          setState(() {

                            font = "Kufam";
                          });

                        },
                      ),
                      FlatButton(
                        child: Text(  'جمهوري',
                          style: TextStyle(
                            fontSize: 15,
                            color:darkfont,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Jomhuria",
                          ),),
                        onPressed: (){
                          setState(() {

                            font = "Jomhuria";
                          });


                        },
                      ),
                      FlatButton(
                        child: Text(  'تشانجا',
                          style: TextStyle(
                            fontSize: 15,
                            color:darkfont,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Changa",
                          ),),
                        onPressed: (){
                          setState(() {

                            font = "Changa";
                          });

                        },
                      ),


                    ],),
                  ),
                  actions: [
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
                            });

                          },
                        ),
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();


                            },
                            child: Text("Close")),
                      ],

                    )    ],
                );
              });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // children: [
            //   Icon(
            //     Icons.font_download_outlined,
            //     color: darkfont,
            //   ),
            //   Text(
            //     title,
            //     style: TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.w500,
            //       color: darkfont,
            //       fontFamily: font,
            //     ),
            //   ),
            //   Icon(
            //     Icons.arrow_forward_ios,
            //     color:darkfont,
            //   ),
            // ],
          ),
        )); }
  Container buildAccountOptionRow5(BuildContext context, String title) {
    return Container(

        child:  Row(
        children:[
          Icon(
            Icons.language,
            color: darkfont,
          ),
          Padding( padding: EdgeInsets.all(8),
        child: DropdownButton( underline: SizedBox(),
        dropdownColor: darkAlert,
        hint: Text( title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color:darkfont,
            fontFamily: font,
          ),
        ),
       /* items: Language.languageList().map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(

          value: lang,
          child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[ Text(lang.name ,style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: darkfont,
              fontFamily: font,
            ),) ], ),)).toList(),
        onChanged: (Language lang) {
          _changeLanguage(lang);
        },*/ ), )])) ;

  }
  GestureDetector buildAccountOptionRow6(BuildContext context, String title) {
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
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isSwitched1?"Light" :"Dark",

                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color:darkfont,
                      ),
                    ),
                    Image(
                      image: AssetImage( isSwitched1?'assets/img/sun.png':'assets/img/moon.png',),
                      width:200,
                      height:100,
                    ),
                  ],
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        child: Text( 'Activatie',

                          ),
                        onPressed: (){
                          setState(() {
                            isSwitched1=!isSwitched1 ;
                           dark= isSwitched1? Colors.black:Colors.white;
                            darkfont=isSwitched1? Colors.white:Colors.black;
                            darkAlert=isSwitched1? Colors.grey[900]:Colors.white;
                          });

                        },
                      ),
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();


                          },
                          child: Text("Close")),
                    ],

                  )

                ],
              );
            });
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

 /* void _changeLanguage(Language lang) {
    Locale _temp;
    switch (lang.languageCode)
  { case 'en': _temp = Locale(lang.languageCode, '');
    break;
    case 'ar': _temp = Locale(lang.languageCode, '');
    break;
    default: _temp = Locale('en', 'US'); break; } MyApp.setLocale(context, _temp); }*/

}