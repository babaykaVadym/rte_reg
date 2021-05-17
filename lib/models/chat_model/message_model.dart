// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'dart:convert';

List<MessageModel> messageModelFromJson(String str) => List<MessageModel>.from(
    json.decode(str).map((x) => MessageModel.fromJson(x)));

String messageModelToJson(List<MessageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageModel {
  MessageModel({
    this.id,
    this.type,
    this.fromId,
    this.toId,
    this.body,
    this.attachment,
    this.seen,
    this.createdAt,
    this.updatedAt,
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

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        id: json["id"],
        type: json["type"],
        fromId: json["from_id"],
        toId: json["to_id"],
        body: json["body"],
        attachment: json["attachment"],
        seen: json["seen"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
      };
}

class IdModel {
  IdModel({
    this.id,
  });

  int id;

  factory IdModel.fromJson(Map<String, dynamic> json) => IdModel(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
