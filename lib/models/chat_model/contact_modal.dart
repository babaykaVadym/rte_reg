// To parse this JSON data, do
//
//     final contactModel = contactModelFromJson(jsonString);

import 'dart:convert';

List<ContactModel> contactModelFromJson(String str) => List<ContactModel>.from(
    json.decode(str).map((x) => ContactModel.fromJson(x)));

String contactModelToJson(List<ContactModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContactModel {
  ContactModel({
    this.id,
    this.type,
    this.fromId,
    this.toId,
    this.body,
    this.attachment,
    this.seen,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  int id;
  String type;
  int fromId;
  int toId;
  String body;
  dynamic attachment;
  int seen;
  DateTime createdAt;
  DateTime updatedAt;
  String firstName;
  String lastName;

  String avatar;

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        id: json["id"],
        type: json["type"],
        fromId: json["from_id"],
        toId: json["to_id"],
        body: json["body"],
        attachment: json["attachment"],
        seen: json["seen"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        firstName: json["first_name"],
        lastName: json["last_name"] == null ? "" : json["last_name"],
        avatar: json["avatar"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "from_id": fromId,
        "to_id": toId,
        "body": body,
        "attachment": attachment,
        "seen": seen,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "first_name": firstName,
        "last_name": lastName == null ? null : lastName,
        "avatar": avatar,
      };
}
