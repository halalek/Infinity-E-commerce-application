import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:structurepublic/src/controler/coupon_controller.dart';
import 'package:structurepublic/src/controler/page_market_controller.dart';
import 'package:structurepublic/src/controler/page_trollery_controller.dart';
import 'package:structurepublic/src/elements/cardCoupon.dart';
import 'package:structurepublic/src/elements/cardmarketWidget.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/repository/page_trollery_repository.dart';

import '../../main.dart';

class PageCoupon extends StatefulWidget
{




  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageCoupon();
  }
}

class  _PageCoupon extends StateMVC< PageCoupon>
{

  PageCouponController _con2;

  _PageCoupon() : super( PageCouponController()) {
    // _con = controller;
    _con2 = controller;
  }

  @override
  Widget build(BuildContext context) {
    d.product=[];
    remov();



    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(language1=="en" ? "My Vouchers" : "حسوماتي"),
        backgroundColor: Theme.of(context).primaryColorDark,

      ),
      body: ListView.builder(
          itemCount: _con2.listCoupon.length,
          // itemBuilder: (context, i) {
          //      return CardMarketWidget(marketData: _con2.listMarket[i],);
          //
          // },
          itemBuilder: (BuildContext context, int index) =>
              CardCouponWidget( _con2.listCoupon[index],),
      ),

    ) ;
  }

}













// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   TextEditingController field = TextEditingController();
//   String pasteValue='';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 SizedBox(
//                   height: 100,
//                 ),
//                 TextFormField(
//                   controller: field,
//                   decoration: InputDecoration(
//                       hintText: 'Enter text'
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     InkWell(
//                       onTap: (){
//                         if(field.text.trim() == ""){
//                           print('enter text');
//                         } else {
//                           print(field.text);
//                           FlutterClipboard.copy(field.text).then(( value ) =>
//                               print('copied'));
//                         }
//                       },
//                       child: Container(
//                         width: 100,
//                         height: 50,
//                         decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.circular(15)
//                         ),
//                         child: Center(child: Text('COPY')),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: (){
//                         FlutterClipboard.paste().then((value) {
//                           setState(() {
//                             field.text = value;
//                             pasteValue = value;
//                           });
//                         });
//                       },
//                       child: Container(
//                         width: 100,
//                         height: 50,
//                         decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.circular(15)
//                         ),
//                         child: Center(child: Text('PASTE')),
//                       ),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text('Clipboard Text: $pasteValue',style: TextStyle(fontSize: 20),)
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }