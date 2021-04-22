import '../helpers/custom_trace.dart';

class Users {
  String id;
  String name;
  String email;
  String password;
  String apiToken;
  String deviceToken;
  double lat;
  double longe;
  String role;
  double timesTamp;
  String phone;
  String verify_code;
  //String address;
  //String bio;
  // used for indicate if client logged in or not
  bool auth;

//  String role;

  Users();

  Users.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      name = jsonMap['name'] != null ? jsonMap['name'] : '';
      email = jsonMap['email'] != null ? jsonMap['email'] : '';
      apiToken = jsonMap['api_token'];
      password=jsonMap['password'];
      timesTamp=jsonMap['timesTamp'];
      role=jsonMap['role'];
      lat=jsonMap['lat'];
      longe=jsonMap['longe'];
      deviceToken = jsonMap['device_token'];
      try {
        phone = jsonMap['custom_fields']['phone']['view'];
      } catch (e) {
        phone = "";
      }
      if (phone == null){
        try {
          phone = jsonMap['phone'];
        } catch (e) {
          phone = "";
        }
      }
      if (phone == null){
        phone = "";
      }
      // try {
      //   address = jsonMap['custom_fields']['address']['view'];
      // } catch (e) {
      //   address = "";
      // }
      // try {
      //   bio = jsonMap['custom_fields']['bio']['view'];
      // } catch (e) {
      //   bio = "";
      // }
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: e));
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["email"] = email;
    map["name"] = name;
    map["password"] = password;
    map["api_token"] = apiToken;
    map["longe"]=longe;
    map["lat"]=lat;
    map["role"]=role;
    map["timesTamp"]=timesTamp;



    if (deviceToken != null) {
      map["device_token"] = deviceToken;
    }
    map["phone"] = phone;
    map["verification_code"] = verify_code;

  //  map["address"] = address;
  //  map["bio"] = bio;
    return map;
  }

  @override
  String toString() {
    var map = this.toMap();
    map["auth"] = this.auth;
    return map.toString();
  }

  bool profileCompleted() {
    //return address != null && address != '' && phone != null && phone != '';
  }
}
