import 'package:flutter/material.dart';
import 'package:structurepublic/src/pages/vereible.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
     children:[
        Container(
            color:changecolor,
            width: double.infinity,
            height: 200,
          padding: EdgeInsets.only(top: 20.0),

        ),
      Center(
       child :Image(



        image: AssetImage('assets/img/drawer.png'),
         width:300,
         height: 300,
    ),)
],);

}}