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
  List<Producto>? data;

  TypeFood({
     this.name,
     this.imageUrl,
     this.data
  });

  factory TypeFood.fromJson(Map<String, dynamic> json) => TypeFood(
    name: json["name"],
    imageUrl: json["image_url"],
    data: List<Producto>.from(json["data"].map((x) => Producto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image_url": imageUrl,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Producto {
  String? name;
  String? imageUrl;
  String? grupo;
  String? descripcion;
  List<Size>? sizes;
  List<ExtraProducto>? extras;

  Producto({
    this.name,
    this.imageUrl,
    this.grupo,
    this.descripcion,
    this.sizes,
    this.extras
  });

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
    name: json["name"],
    imageUrl: json["image_url"],
    grupo: json["grupo"],
    descripcion: json["descripcion"],
    sizes: List<Size>.from(json["sizes"].map((x) => Size.fromJson(x))),
    extras: List<ExtraProducto>.from(json["extras"].map((x) => ExtraProducto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image_url": imageUrl,
    "grupo": grupo,
    "descripcion": descripcion,
    "sizes": List<dynamic>.from(sizes!.map((x) => x.toJson())),
    "extras": List<dynamic>.from(extras!.map((x) => x.toJson())),
  };
}

class ExtraProducto {
  String? name;
  double? price;

  ExtraProducto({
    this.name,
    this.price,
  });

  factory ExtraProducto.fromJson(Map<String, dynamic> json) => ExtraProducto(
    name: json["nombre"],
    price: json["precio"],
  );

  Map<String, dynamic> toJson() => {
    "nombre": name,
    "precio": price,
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