



class Sucursal {
  int? id;
  String? name;
  String? address;
  String? horary;
  bool? open;
  String? latlong;


  Sucursal({
    this.id,
    this.name,
    this.address,
    this.horary,
    this.open,
    this.latlong,
  });


  factory Sucursal.fromJson(Map<String, dynamic> json) => Sucursal(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    horary: json["horary"],
    open: json["open"],
    latlong: json["latlong"],
  );

  //tojson

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "horary": horary,
    "open": open,
    "latlong": latlong,
  };

  //fromjsonlist
  static List<Sucursal> fromJsonList(List<dynamic> jsonList) {
    List<Sucursal> sucursales = [];
    if (jsonList == null) return [];
    for (var item in jsonList) {
      sucursales.add(Sucursal.fromJson(item));
    }
    return sucursales;
  }


  //tojsonlist
  static List<dynamic> toJsonList(List<Sucursal> sucursales) {
    List<dynamic> sucursalesList = [];
    if (sucursales == null) return [];
    for (var item in sucursales) {
      sucursalesList.add(item.toJson());
    }
    return sucursalesList;
  }


}