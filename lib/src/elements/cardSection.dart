import 'package:flutter/material.dart';
import 'package:structurepublic/src/controler/page_Main_controller.dart';
import 'package:structurepublic/src/models/SectionData.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key key,this.sectionData}) : super(key: key);

  final SectionData sectionData;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 200,
      width: double.maxFinite,
      child:
      Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child:  GestureDetector(child: Container(
          child:
          Center(child: RaisedButton(
            onPressed: () {
              //  navigetor("");
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80.0),),
            padding: EdgeInsets.all(6.0),
            color: Colors.black12,
            child: Ink(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white70,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.black12,//pink
              ),
              child: Container(
                constraints:
                BoxConstraints(maxWidth: 100.0, minHeight: 40.0,maxHeight: 50),
                alignment: Alignment.center,
                child: Text(
                  sectionData.nameAr,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),

              ),

            ),

          ),
          ),




          decoration: BoxDecoration(
            image: DecorationImage(
              image: new NetworkImage(sectionData.image),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
          onTap: () {
            // navigetor("");
          },
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),

      ),
    );
  }
}


