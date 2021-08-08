class SoldData {
  SoldData({
    this.timesTamp,
    this.description_ar,
    this.description_en,
    this.hide,
    this.id,
    this.image,
    this.longDay,
    this.id_market,
    this.name_market_ar,
    this.name_market_en,
    this.name_ar,
    this.name_en,
    this.price,
    this.index,
    this.price_last,
    this.image_icon,
    this.timeSend
  });

  String description_ar;
  String description_en;
  bool hide;
  String id;
  String image;
  int longDay;
  int index;
  String id_market;
  String name_market_ar;
  String name_market_en;
  String name_ar;
  String name_en;
  int timesTamp;
  int price;
  int price_last;
  String image_icon;
  String timeSend;
  factory SoldData.fromJson(Map<String, dynamic> json) => SoldData(
    timesTamp: json["timesTamp"] == null ? null : json["timesTamp"],
    timeSend: json["timeSend"] == null ? null : json["timeSend"],
    description_ar: json["description_ar"] == null ? null : json["description_ar"],
    description_en: json["description_en"] == null ? null : json["description_en"],
    hide: json["hide"] == null ? null : json["hide"],
    id: json["id"] == null ? null : json["id"],
    id_market: json["id_market"] == null ? null : json["id_market"],
    image: json["image"] == null ? null : json["image"],
    longDay: json["longDay"] == null ? null : json["longDay"],
    name_market_ar: json["name_market_ar"] == null ? null : json["name_market_ar"],
    name_market_en: json["name_market_en"] == null ? null : json["name_market_en"],
    name_ar: json["name_ar"] == null ? null : json["name_ar"],
    name_en: json["name_en"] == null ? null : json["name_en"],
    price: json["price"] == null ? null : json["price"],
    price_last: json["lastPrice"] == null ? null : json["lastPrice"],
    image_icon: json["image_icon"] == null ? null : json["image_icon"],
  );

  Map<String, dynamic> toJson() => {
    "timesTamp": timesTamp == null ? null : timesTamp,
    "timeSend": timeSend == null ? null : timeSend,
    "description_ar":description_ar == null ? null : description_ar,
    "description_en": description_en == null ? null : description_en,
    "hide":hide == null ? null : hide,
    "image":image == null ? null : image,
    "id":id == null ? null : id,
    "longDay":longDay == null ? null : longDay,
    "id_market":id_market == null ? null : id_market,
    "name_market_ar":  name_market_ar == null ? null :  name_market_ar,
    "name_market_en":  name_market_en == null ? null :  name_market_en,
    "name_ar":  name_ar == null ? null :  name_ar,
    "name_en":  name_en == null ? null :  name_en,
    "price":  price == null ? null :  price,
    "lastPrice":  price_last == null ? null :  price_last,
    "image_icon":  image_icon == null ? null :  image_icon,
  };
}
