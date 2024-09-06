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
  String? authToken;
  String? tokenPush;
  bool? isNumberPhoneVerified;


  User({
    this.id,
    this.role,
    this.email,
    this.name,
    this.lastName,
    this.phone,
    this.authToken,
    this.tokenPush,
    this.isNumberPhoneVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"].toString(),
    role: json["role"],
    email: json["email"],
    name: json["name"],
    lastName: json["last_name"],
    phone: json["phone"],
    authToken: json["auth_token"],
    tokenPush: json["token_push"],
    isNumberPhoneVerified: json["is_number_phone_verified"]?? false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "role": role,
    "email": email,
    "name": name,
    "last_name": lastName,
    "phone": phone,
    "auth_token": authToken,
    "token_push": tokenPush,
    "is_number_phone_verified": isNumberPhoneVerified,
  };
}
