import 'dart:convert';

Promo promoFromJson(String str) => Promo.fromJson(json.decode(str));

String promoToJson(Promo data) => json.encode(data.toJson());

class Promo {
  String? title;
  String? body;
  String? url;
  String? imagenUrl;

  Promo({
    this.title,
    this.body,
    this.url,
    this.imagenUrl,
  });

  factory Promo.fromJson(Map<String, dynamic> json) => Promo(
    title: json["title"],
    body: json["body"],
    url: json["url"],
    imagenUrl: json["imagen_url"]
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
    "url": url,
    "imagen_url": imagenUrl,
  };

  static List<Promo> fromJsonList(List<dynamic> jsonList) {
    List<Promo> promos = [];
    if (jsonList == null) return [];
    for (var item in jsonList) {
      promos.add(Promo.fromJson(item));
    }
    return promos;
  }
}