class FavorityData {

  FavorityData({
    this.id,
  });

  String id;


  factory FavorityData.fromJson(Map<String, dynamic> json) => FavorityData(

    id: json["idproduct"] == null ? null : json["idproduct"],

  );

  Map<String, dynamic> toJson() => {
    "idproduct": id == null ? null : id,
  };
}
