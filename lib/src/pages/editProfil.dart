import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/controler/login_controller.dart';
import 'package:structurepublic/src/controler/user_controller.dart';
import 'package:structurepublic/src/elements/cardFavorite.dart';
import 'package:structurepublic/src/models/user.dart';
import 'package:structurepublic/src/pages/contact_support.dart';
import 'package:structurepublic/src/pages/profil.dart';
import 'package:structurepublic/src/pages/sharedPref.dart';
import 'package:structurepublic/src/pages/vereible.dart';
import 'package:structurepublic/src/pages/vereible.dart';
import 'package:structurepublic/src/repository/login_repository.dart'as repo;
class editProfilePage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _editProfilePage();
  }

}

String labelText1,  placeholder;
bool cheak=false;
SharedPref sharedPref=SharedPref();
class  _editProfilePage extends StateMVC<editProfilePage> {
  UserController _con;
  TextEditingController nameController1= TextEditingController();
  String fullName1;
  TextEditingController nameController2= TextEditingController();
  String fullName2;
  TextEditingController nameController3= TextEditingController();
  var fullName3;

  _editProfilePage() : super(UserController()) {
    // _con = controller;
    _con = controller;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,


      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),

              SizedBox(
                height: 35,
              ),

              Padding(

                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  onSubmitted: (text){
                  setState(() {fullName1=text;});
                   print(fullName1);
                },
                   controller: nameController1,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: darkfont), ),
                      focusedBorder: UnderlineInputBorder( borderSide: BorderSide(color: changecolor), ),



                     // contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: labelText1="Full Name",
                     labelStyle: TextStyle(
                  color: const Color(0XFF424242),
                          ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText:  _con.user.name,
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),


                ),
              ),

              Padding(

                padding: const EdgeInsets.only(bottom: 35.0),

                child: TextField(
                  onSubmitted: (text){
                    setState(() {fullName2=text;});
                    print(fullName2);
                  },
                  controller: nameController2,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: darkfont), ),
                      focusedBorder: UnderlineInputBorder( borderSide: BorderSide(color: changecolor), ),



                      // contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: labelText1="E-mail",
                      labelStyle: TextStyle(
                        color: const Color(0XFF424242),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText:  _con.user.email,
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),


                ),
              ),
              Padding(

                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  onSubmitted: (text){
                    setState(() {fullName3=text;});
                    print(fullName3);
                  },
                  controller: nameController3,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: darkfont), ),
                      focusedBorder: UnderlineInputBorder( borderSide: BorderSide(color: changecolor), ),

                      labelText: labelText1="Phone",
                      labelStyle: TextStyle(
                        color: const Color(0XFF424242),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText:  _con.user.phone.toString(),
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),


                ),
              ),

              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {    Navigator.of(context).pop();},
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  

                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        if(fullName1!=null){
                        _con.user.name=fullName1;
                      print(fullName1);
                      print( _con.user.name);}
                        if(fullName2!=null){
                      _con.user.email=fullName2;}
                        if(fullName3!=null){
                      _con.user.phone=int.parse(fullName3);}
                     
                    sharedPref.save('user', _con.user);
                      repo.updateUser(_con.user);


                        Navigator.pop(context,_con.user.name);
                       Navigator.pushNamed(context, '/b');
                      });


                    },
                    color: changecolor,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}