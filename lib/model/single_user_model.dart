// To parse this JSON data, do
//
//     final singleUserModel = singleUserModelFromJson(jsonString);

import 'dart:convert';

SingleUserModel singleUserModelFromJson(String str) =>
    SingleUserModel.fromJson(json.decode(str));

String singleUserModelToJson(SingleUserModel data) =>
    json.encode(data.toJson());

class SingleUserModel {
  SingleUserModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  factory SingleUserModel.fromJson(Map<dynamic, dynamic> json) =>
      SingleUserModel(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
