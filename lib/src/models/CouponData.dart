class CouponData {
  CouponData({
    this.code,
    this.id,
    this.iduser,
    this.iscoupon,
    this.value
  });


  String code;
  String id;
  String iduser;
  bool iscoupon;
  String state;
  int value;
  // ignore: non_constant_identifier_names

  factory  CouponData.fromJson(Map<String, dynamic> json) => CouponData(
    code: json["code"] == null ? null : json["code"],
    id: json["id"] == null ? null : json["id"],
    iduser: json["iduser"] == null ? null : json["iduser"],
    iscoupon: json["iscoupon"] == null ? null : json["iscoupon"],
    value: json["value"] == null ? null : json["value"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "id": id == null ? null : id,
    "iduser":iduser == null ? null : iduser,
    "iscoupon": iscoupon == null ? null : iscoupon,
    "value": value == null ? null : value,
  };
}
