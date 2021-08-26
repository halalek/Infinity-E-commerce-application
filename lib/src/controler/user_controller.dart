// import 'package:flutter/material.dart';
// import 'package:mvc_pattern/mvc_pattern.dart';
// import 'package:structurepublic/src/models/route_argument.dart';
// import 'package:structurepublic/src/repository/login_repository.dart';
//
// import '../../generated/l10n.dart';
// import '../helpers/helper.dart';
// import '../models/user.dart';
// import '../repository/user_repository.dart' as repository;
// import 'package:structurepublic/src/repository/login_repository.dart' as repo;
//
// class UserController extends ControllerMVC {
//    Userss user = new Userss();
//   bool loading = false;
//   GlobalKey<ScaffoldState> scaffoldKey;
//   OverlayEntry loader;
//
//   UserController() {
//     loader = Helper.overlayLoader(context);
//     this.scaffoldKey = new GlobalKey<ScaffoldState>();
//
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//     getUsers();
//   }
//   getUsers() async {
//     //  setState((){
//     //    user.;
//     //  }
//     // );
//
//     await repo.getUser().then((value){
//       // setState(() async {
//       // });
//
//       if(value==null)
//       {print("error user");}
//       else{
//
//         user=value;
//
//       }
//       return user;
//     }
//
//
//     );
//
//     return user;
//
//
//
//   }
//
// }













import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/controler/page_trollery_controller.dart';
import 'package:structurepublic/src/models/DemandData.dart';
import 'package:structurepublic/src/models/route_argument.dart';
import 'package:structurepublic/src/pages/vereible.dart';
import 'package:structurepublic/src/repository/login_repository.dart';
import 'package:structurepublic/src/repository/page_trollery_repository.dart'
as repo;
import '../../generated/l10n.dart';
import '../../main.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import '../repository/user_repository.dart' as repository;
import 'package:structurepublic/src/repository/login_repository.dart' as repo;

class UserController extends ControllerMVC {
  Userss user = new Userss();
  bool loading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  List<DemandData> list = [];
  UserController() {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();

  }

  int pricetotal;
  @override
  void initState() {
    super.initState();
    getUsers();
  }



  void getCouponPrice() async {
    BuildContext context2;
   // _onLoading(context2);
    list.clear();
   pricetotal=0;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await repo
        .getmyDemand(preferences.getString('userID'))
        .then((value) => setState(() {
      list.addAll(value);

    }));
    print(list.length);
    print("wwwwwwwwwwwwwwwwwwwwwwwwwwww");
    for (int i = 0; i < list.length; i++) {
      if(list[i].iscoupon==false)
      {
        pricetotal+=list[i].priceTotal;
      }
    }
    print(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;");
    print(pricetotal);
   pricetotal= (50000-pricetotal);
//Navigator.pop(context);
    _onLoadingPrice();
  }

  getUsers() async {
    //  setState((){
    //    user.;
    //  }
    // );
    await repo.getUser().then((value){
      setState((){
        if(value==null)
        {print("error user");}
        else{

          user=value;

        }

      }


      );
      return user;
    }


    );

    return user;



  }



  getToken() async {

    await repo.addtokenuser();


  }


  Widget _onLoading(BuildContext context1) {


        return Dialog(
          child: new Container(
            decoration: new BoxDecoration(
             color: Colors.black12,
              //   borderRadius: new BorderRadius.circular(10.0)
            ),
            width: 150.0,
            height: 100.0,
            alignment: AlignmentDirectional.center,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Center(
                  child: new SizedBox(
                    height: 30.0,
                    width: 30.0,
                    child: new CircularProgressIndicator(
                        value: null,
                        strokeWidth: 7.0,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red)
                    ),
                  ),
                ),
              ],
            ),
          ),

        );

    // new Future.delayed(new Duration(seconds: 20), () {
    //
    //  Navigator.pop(context1); //pop dialog
    //
    // }
    // );
  }



 Widget _onLoadingPrice() {

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Container(
            decoration: new BoxDecoration(
              color: Colors.black12,
              //   borderRadius: new BorderRadius.circular(10.0)
            ),
            width: 900.0,
            height: 300.0,
            alignment: AlignmentDirectional.center,
            child: new Column(
             // crossAxisAlignment: CrossAxisAlignment.center,
             // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/img/coupon.jpg",),
              SizedBox(height: 20,),
              new SizedBox(
                   // height: 200.0,
                    width: 900.0,
                    child: Center(child:new Text(language1=="en" ? "When the total of your orders that do not include discount reach 50000 SYP  you will receive a voucher 20000 SYP" :"عندما يصل مجموع طلباتك الغير متضمنة حسومات  \n        إلى  50000 أو اكثر ستحصل على قسيمة حسم \n            تتراوح بين   5000 إلى 20000  ",textDirection: TextDirection.rtl,
                    ),)
                  ),

                new Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: new Center(
                    child: new Text((language1=="en" ? "Remaining amount " :" المتبقي ") +
                      pricetotal.toString() + (language1=="en" ? " SYP" :" ل.س"),
                      style: new TextStyle(color: Colors.red, fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
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
    new Future.delayed(new Duration(seconds: 5), () {
    //  Navigator.pop(context);
     // Navigator.pop(context);
      // if (!loading) {
      //     // Navigator.pop(context); //pop dialog
      // }


    });
  }
}
