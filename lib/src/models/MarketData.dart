class MarketData {
  MarketData({
    this.image,
    this.imageIcon,
    this.hide,
    this.descriptionEn,
    this.descriptionAr,
    this.idSection,
    this.lat,
    this.long,
    this.nameAr,
    this.id,
    this.timesTampClose,
    this.timesTampOpen,
    this.nameEn,
    this.rate,
    this.active
  });

  String image;
  String imageIcon;
  String descriptionEn;
  String descriptionAr;
  String idSection;
  double long;
  int timesTampClose;
  int timesTampOpen;
  String timeOpen;
  String timeClose;
  bool hide;
  String nameAr;
  String id;
  String nameEn;
  String state;
  num rate;
  bool active;
  double lat; //location DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

  List<String> owners;

  double rating;



  factory MarketData.fromJson(Map<String, dynamic> json) => MarketData(
    image: json["image"] == null ? null : json["image"],
    rate: json["rating"] == null ? null : json["rating"],
    imageIcon: json["image_icon"] == null ? null : json["image_icon"],
    hide: json["hide"] == null ? null : json["hide"],
    descriptionEn: json["description_en"] == null ? null : json["description_en"],
    descriptionAr: json["description_ar"] == null ? null : json["description_ar"],
    idSection: json["id_section"] == null ? null : json["id_section"],
    lat: json["lat"] == null ? null : json["lat"],
    long: json["long"] == null ? null : json["long"],
    nameAr: json["name_ar"] == null ? null : json["name_ar"],
    id: json["id"] == null ? null : json["id"],
    timesTampClose: json["timesTampClose"] == null ? null : json["timesTampClose"],
    timesTampOpen: json["timesTampOpen"] == null ? null : json["timesTampOpen"],
    nameEn: json["name_en"] == null ? null : json["name_en"],
    active: json["active"] == null ? null : json["active"],
  );



  // Map<String, dynamic> toJson() => {
  //    "image": image == null ? null : image,
  //    "image_icon":imageIcon == null ? null : imageIcon,
  //    "hide": hide == null ? null : hide,
  //    "description_en":descriptionEn == null ? null : descriptionEn,
  //    "description_ar":descriptionAr == null ? null : descriptionAr,
  //    "id_section":idSection == null ? null : idSection,
  //    "lat":lat == null ? null : lat,
  //    "long":long == null ? null : long,
  //    "name_ar": nameAr == null ? null : nameAr,
  //    "id": id == null ? null : id,
  //    "timesTampClose":timesTampClose == null ? null : timesTampClose,
  //    "timesTampOpen":timesTampOpen == null ? null : timesTampOpen,
  //    "name_en": nameEn == null ? null : nameEn,
  //    "rating": rate == null ? null : rate,
  //    "active":active == null ? null : active,
  // };
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description_ar'] = this.descriptionAr;
    data['description_en'] = this.descriptionEn;
    data['hide'] = this.hide;
    data['id'] = this.id;
    data['id_section'] = this.idSection;
    data['image'] = this.image;
    data['image_icon'] = this.imageIcon;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['owners'] = this.owners;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['timesTampClose'] = this.timesTampClose;
    data['timesTampOpen'] = this.timesTampOpen;
    data['rating'] = this.rating.toDouble();
    data['active'] = this.active;
    return data;
  }
}
