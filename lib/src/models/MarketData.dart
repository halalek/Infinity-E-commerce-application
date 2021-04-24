class MarketData {
  MarketData({
    this.image,
    this.imageIcon,
    this.hide,
    this.descriptionEn,
    this.descriptionAr,
    this.idSection,
  this.let,
    this.long,
    this.nameAr,
    this.id,
    this.timesTampClose,
    this.timesTampOpen,
    this.nameEn,
  });

  String image;
  String imageIcon;
  String descriptionEn;
  String descriptionAr;
  String idSection;
  double let;
  double long;
  int timesTampClose;
  int timesTampOpen;
  bool hide;
  String nameAr;
  String id;
  String nameEn;

  factory MarketData.fromJson(Map<String, dynamic> json) => MarketData(
    image: json["image"] == null ? null : json["image"],
    hide: json["hide"] == null ? null : json["hide"],
    nameAr: json["name_ar"] == null ? null : json["name_ar"],
    id: json["id"] == null ? null : json["id"],
  //  timesTamp: json["timesTamp"] == null ? null : json["timesTamp"],
    nameEn: json["name_en"] == null ? null : json["name_en"],
  );

  Map<String, dynamic> toJson() => {
    "image": image == null ? null : image,
    "hide": hide == null ? null : hide,
    "name_ar": nameAr == null ? null : nameAr,
    "id": id == null ? null : id,
   // "timesTamp": timesTamp == null ? null : timesTamp,
    "name_en": nameEn == null ? null : nameEn,
  };
}
