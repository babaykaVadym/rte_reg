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
    this.email,
    this.activeStatus,
    this.darkMode,
    this.messengerColor,
    this.avatar,
    this.company,
    this.telephoneCode,
    this.telephoneNumber,
    this.verified,
    this.verificationToken,
    this.resetToken,
    this.active,
    this.deletedAt,
    this.roleId,
    this.mailCreditBalance,
    this.customFields,
    this.isPrintSticker,
    this.isCheckIn,
    this.code,
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
  String email;
  int activeStatus;
  int darkMode;
  String messengerColor;
  String avatar;
  dynamic company;
  String telephoneCode;
  String telephoneNumber;
  int verified;
  dynamic verificationToken;
  dynamic resetToken;
  int active;
  dynamic deletedAt;
  int roleId;
  int mailCreditBalance;
  dynamic customFields;
  int isPrintSticker;
  int isCheckIn;
  dynamic code;

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
        email: json["email"],
        activeStatus: json["active_status"],
        darkMode: json["dark_mode"],
        messengerColor: json["messenger_color"],
        avatar: json["avatar"].toString(),
        company: json["company"],
        telephoneCode: json["telephone_code"],
        telephoneNumber: json["telephone_number"],
        verified: json["verified"],
        verificationToken: json["verification_token"],
        resetToken: json["reset_token"],
        active: json["active"],
        deletedAt: json["deleted_at"],
        roleId: json["role_id"],
        mailCreditBalance: json["mail_credit_balance"],
        customFields: json["custom_fields"],
        isPrintSticker: json["is_print_sticker"],
        isCheckIn: json["is_check_in"],
        code: json["code"],
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
        "email": email,
        "active_status": activeStatus,
        "dark_mode": darkMode,
        "messenger_color": messengerColor,
        "avatar": avatar,
        "company": company,
        "telephone_code": telephoneCode,
        "telephone_number": telephoneNumber,
        "verified": verified,
        "verification_token": verificationToken,
        "reset_token": resetToken,
        "active": active,
        "deleted_at": deletedAt,
        "role_id": roleId,
        "mail_credit_balance": mailCreditBalance,
        "custom_fields": customFields,
        "is_print_sticker": isPrintSticker,
        "is_check_in": isCheckIn,
        "code": code,
      };
}
