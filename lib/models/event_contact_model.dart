// To parse this JSON data, do
//
//     final eventContact = eventContactFromJson(jsonString);

import 'dart:convert';

List<EventContact> eventContactFromJson(String str) => List<EventContact>.from(
    json.decode(str).map((x) => EventContact.fromJson(x)));

class EventContact {
  EventContact({
    this.id,
    this.firstName,
    this.lastName,
    this.avatarUrl,
    this.telephoneCode,
    this.telephoneNumber,
    this.company,
    this.email,
  });

  int id;
  String firstName;
  String lastName;
  String avatarUrl;
  String telephoneCode;
  String telephoneNumber;
  dynamic company;
  String email;

  factory EventContact.fromJson(Map<String, dynamic> json) => EventContact(
        id: json["id"] == null ? null : json["id"],
        firstName: json["first_name"] == null ? "" : json["first_name"],
        lastName: json["last_name"] == null ? "" : json["last_name"],
        avatarUrl: json["avatar"] == null ? "" : json["avatar"],
        telephoneCode:
            json["telephone_code"] == null ? "" : json["telephone_code"],
        telephoneNumber:
            json["telephone_number"] == null ? "" : json["telephone_number"],
        company: json["company"] == null ? "" : json["company"],
        email: json["email"] == null ? "" : json["email"],
      );
}
