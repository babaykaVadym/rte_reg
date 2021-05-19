// To parse this JSON data, do
//
//     final eventContact = eventContactFromJson(jsonString);

import 'dart:convert';

List<EventContact> eventContactFromJson(String str) => List<EventContact>.from(
    json.decode(str).map((x) => EventContact.fromJson(x)));

String eventContactToJson(List<EventContact> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventContact {
  EventContact({
    this.id,
    this.firstName,
    this.lastName,
    this.avatar,
    this.telephoneCode,
    this.telephoneNumber,
    this.company,
    this.email,
    this.role,
  });

  int id;
  String firstName;
  String lastName;
  String avatar;
  String telephoneCode;
  String telephoneNumber;
  dynamic company;
  String email;
  Role role;

  factory EventContact.fromJson(Map<String, dynamic> json) => EventContact(
        id: json["id"] == null ? null : json["id"],
        firstName: json["first_name"] == null ? "" : json["first_name"],
        lastName: json["last_name"] == null ? "" : json["last_name"],
        avatar: json["avatar"] == null ? "" : json["avatar"],
        telephoneCode:
            json["telephone_code"] == null ? "" : json["telephone_code"],
        telephoneNumber:
            json["telephone_number"] == null ? "" : json["telephone_number"],
        company: json["company"],
        email: json["email"] == null ? "" : json["email"],
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "avatar": avatar == null ? null : avatar,
        "telephone_code": telephoneCode == null ? null : telephoneCode,
        "telephone_number": telephoneNumber == null ? null : telephoneNumber,
        "company": company,
        "email": email == null ? null : email,
        "role": role == null ? null : role.toJson(),
      };
}

class Role {
  Role({
    this.id,
    this.name,
    this.role,
  });

  int id;
  String name;
  String role;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        role: json["role"] == null ? null : json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "role": role == null ? null : role,
      };
}
