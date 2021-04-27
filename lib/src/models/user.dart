import '../helpers/custom_trace.dart';

class Userss {
  String id;
  String name;
  String email;
 // int password;
  String token;
  //String deviceToken;
  double lat;
  double long;
  String role;
  int timesTamp;
  int phone;
 // String verify_code;
  //String address;
  //String bio;
  // used for indicate if client logged in or not
 // bool auth;

//  String role;

  Userss({
    this.token,
    this.lat,
    this.long,
    this.role,
    this.phone,
   // this.password,
    this.email,
    this.id,
    this.timesTamp,
    this.name,
  });

 void Usersslogin(String id, String name, String email, int phone)
 {this.id=id; this.name=name; this.email=email; this.phone=phone;}


  void UserssSign(String id, String name, String email, int phone,String token,String role)
  {this.id=id; this.name=name; this.email=email; this.phone=phone;this.token=token;this.role=role;}


  factory Userss.fromJson(Map<String, dynamic> json) => Userss(
    name: json["name"] == null ? null : json["name"],
     id: json["id"] == null ? null : json["id"],
     token: json["token"] == null ? null : json["token"],
     lat: json["lat"] == null ? null : json["lat"],
     long: json["long"] == null ? null : json["long"],
     role: json["role"] == null ? null : json["role"],
     phone: json["phone"] == null ? null : json["phone"],
     email: json["email"] == null ? null : json["email"],
     timesTamp: json["timesTamp"] == null ? null : json["timesTamp"],
  );

  Map<String, dynamic> toJson() => {
    "long": long == null ? null :long,
    "token": token == null ? null :token,
    "lat":  lat == null ? null :  lat,
    "role": role == null ? null : role,
    "phone":  phone == null ? null :  phone,
    "email": email == null ? null : email,
    "id": id == null ? null : id,
    "timesTamp": timesTamp == null ? null : timesTamp,
    "name": name == null ? null : name,
  };


  @override
  String toString() {
   // var map = this.toMap();
   // map["auth"] = this.auth;
   // return map.toString();
  }

  bool profileCompleted() {
    return email != null  ;
    //return address != null && address != '' && phone != null && phone != '';
  }
}
