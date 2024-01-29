import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? role;
  String? email;
  String? name;
  String? lastName;
  String? phone;
  String? image;
  String? password;
  String? authToken;
  bool? isNumberPhoneVerified;
  String? status;

  User({
    this.id,
    this.role,
    this.email,
    this.name,
    this.lastName,
    this.phone,
    this.image,
    this.password,
    this.authToken,
    this.isNumberPhoneVerified,
    this.status,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"].toString(),
    role: json["role"],
    email: json["email"],
    name: json["name"],
    lastName: json["last_name"],
    phone: json["phone"],
    image: json["image"],
    password: json["password"],
    authToken: json["auth_token"],
    isNumberPhoneVerified: json["is_number_phone_verified"]?? false,
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "role": role,
    "email": email,
    "name": name,
    "last_name": lastName,
    "phone": phone,
    "image": image,
    "password": password,
    "auth_token": authToken,
    "is_number_phone_verified": isNumberPhoneVerified,
    "status": status,
  };
}
