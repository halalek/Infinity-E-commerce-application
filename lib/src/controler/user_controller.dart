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
import 'package:structurepublic/src/models/route_argument.dart';
import 'package:structurepublic/src/repository/login_repository.dart';

import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import '../repository/user_repository.dart' as repository;
import 'package:structurepublic/src/repository/login_repository.dart' as repo;

class UserController extends ControllerMVC {
  Userss user = new Userss();
  bool loading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;

  UserController() {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();

  }


  @override
  void initState() {
    super.initState();
    getUsers();
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

}
