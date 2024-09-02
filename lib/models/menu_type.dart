import 'dart:convert';

MenuType menuTypeFromJson(String str) => MenuType.fromJson(json.decode(str));

String menuTypeToJson(MenuType data) => json.encode(data.toJson());

class MenuType {
  String? title;
  List<TypeFood>? types;

  MenuType({
    this.title,
    this.types,
  });

  factory MenuType.fromJson(Map<String, dynamic> json) => MenuType(
    title: json["title"],
    types: List<TypeFood>.from(json["types"].map((x) => TypeFood.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "types": List<dynamic>.from(types!.map((x) => x.toJson())),
  };

  static List<MenuType> fromJsonList(List<dynamic> jsonList) {
    List<MenuType> menuTypes = [];
    if (jsonList == null) return [];
    for (var item in jsonList) {
      menuTypes.add(MenuType.fromJson(item));
    }
    return menuTypes;
  }
}

class TypeFood {
  String? name;
  String? imageUrl;
  List<Datum>? data;

  TypeFood({
     this.name,
     this.imageUrl,
     this.data
  });

  factory TypeFood.fromJson(Map<String, dynamic> json) => TypeFood(
    name: json["name"],
    imageUrl: json["image_url"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image_url": imageUrl,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? name;
  String? imageUrl;
  List<Size>? sizes;

  Datum({
    this.name,
    this.imageUrl,
    this.sizes,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    imageUrl: json["image_url"],
    sizes: List<Size>.from(json["sizes"].map((x) => Size.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image_url": imageUrl,
    "sizes": List<dynamic>.from(sizes!.map((x) => x.toJson())),
  };
}

class Size {
  String? size;
  String? calories;
  int? price;

  Size({
    this.size,
    this.calories,
    this.price,
  });

  factory Size.fromJson(Map<String, dynamic> json) => Size(
    size: json["size"],
    calories: json["calories"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "size": size,
    "calories": calories,
    "price": price,
  };



}