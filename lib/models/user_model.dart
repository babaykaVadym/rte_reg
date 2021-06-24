// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.avatarUrl,
    this.telephoneCode,
    this.telephoneNumber,
    this.isCheckIn,
    this.isPrintSticker,
    this.telephoneFullNumber,
    this.customFields,
    this.events,
    this.company,
    this.parents,
    this.uScanned,
    this.uScannedBy,
    this.children,
    this.email,
    this.createdAt,
    this.verified,
    this.mailCreditBalance,
    this.logs,
    this.balanceInfo,
    this.scans,
  });

  int id;
  String firstName;
  dynamic lastName;
  dynamic avatarUrl;
  String telephoneCode;
  String telephoneNumber;
  int isCheckIn;
  int isPrintSticker;
  List<UScanned> uScanned;
  List<dynamic> uScannedBy;
  String telephoneFullNumber;
  dynamic customFields;
  List<dynamic> events;
  dynamic company;
  List<dynamic> parents;
  List<dynamic> children;
  String email;

  DateTime createdAt;
  int verified;
  int mailCreditBalance;
  List<dynamic> logs;
  List<dynamic> balanceInfo;
  Scans scans;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstName: json["first_name"] == null ? "" : json["first_name"],
        lastName: json["last_name"] == null ? "" : json["last_name"],
        avatarUrl: json["avatar"],
        telephoneCode: json["telephone_code"],
        telephoneNumber: json["telephone_number"],
        isCheckIn: json["is_check_in"],
        isPrintSticker: json["is_print_sticker"],
        telephoneFullNumber: json["telephone_full_number"] == null
            ? ""
            : json["telephone_full_number"],
        customFields: json["custom_fields"],
        events: List<dynamic>.from(json["events"].map((x) => x)),
        company: json["company"] == null ? "" : json["company"],
        parents: List<dynamic>.from(json["parents"].map((x) => x)),
        children: List<dynamic>.from(json["children"].map((x) => x)),
        email: json["email"] == null ? "" : json["email"],
        createdAt: DateTime.parse(json["created_at"]),
        verified: json["verified"],
        mailCreditBalance: json["mail_credit_balance"],
        logs: List<dynamic>.from(json["logs"].map((x) => x)),
        balanceInfo: List<dynamic>.from(json["balance_info"].map((x) => x)),
        uScanned: json["u_scanned"] == null
            ? ""
            : List<UScanned>.from(
                json["u_scanned"].map((x) => UScanned.fromJson(x))),
        uScannedBy: json["u_scanned_by"] == null
            ? ""
            : List<dynamic>.from(json["u_scanned_by"].map((x) => x)),
        scans: Scans.fromJson(json["scans"]),
      );
}

/*class Permission {
  Permission({
    this.id,
    this.name,
    this.permission,
    this.group,
  });

  int id;
  String name;
  String permission;
  GroupClass group;

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        id: json["id"],
        name: json["name"],
        permission: json["permission"],
        group: GroupClass.fromJson(json["group"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "permission": permission,
        "group": group.toJson(),
      };
}*/

/*class GroupClass {
  GroupClass({
    this.id,
    this.name,
    this.group,
  });

  int id;
  Name name;
  GroupEnum group;

  factory GroupClass.fromJson(Map<String, dynamic> json) => GroupClass(
        id: json["id"],
        name: nameValues.map[json["name"]],
        group: groupEnumValues.map[json["group"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "group": groupEnumValues.reverse[group],
      };
}*/

//enum GroupEnum { EVENT, EVENT_ORDER, EVENT_PROMO_CODE }

/*
final groupEnumValues = EnumValues({
  "event": GroupEnum.EVENT,
  "event_order": GroupEnum.EVENT_ORDER,
  "event_promo_code": GroupEnum.EVENT_PROMO_CODE
});
*/

//enum Name { EVENTS, EVENT_ORDER_GROUP, EVENT_PROMO_CODE_GROUP }

/*final nameValues = EnumValues({
  "Events": Name.EVENTS,
  "Event order group": Name.EVENT_ORDER_GROUP,
  "Event promo code group": Name.EVENT_PROMO_CODE_GROUP
});*/

/*class Role {
  Role({
    this.id,
    this.name,
    this.role,
  });

  int id;
  String name;
  String role;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
      };
}*/

class Scans {
  Scans({
    this.data,
  });

  List<Datum> data;

  factory Scans.fromJson(Map<String, dynamic> json) => Scans(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    this.id,
    this.firstName,
    this.lastName,
    this.telephoneCode,
    this.telephoneNumber,
    this.telephoneFullNumber,
    this.email,
    this.company,
    this.position,
    this.avatarUrl,
  });

  int id;
  String firstName;
  String lastName;
  String telephoneCode;
  String telephoneNumber;
  String telephoneFullNumber;
  String email;
  String company;
  String position;
  String avatarUrl;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"] == null ? "" : json["last_name"],
        telephoneCode: json["telephone_code"],
        telephoneNumber: json["telephone_number"],
        telephoneFullNumber: json["telephone_full_number"],
        email: json["email"],
        company: json["company"] == null ? '' : json["company"],
        position: json["position"] == null ? '' : json["position"],
        avatarUrl: json["avatar"] == null
            ? "https://a3.rte.im/storage/avatar.png"
            : json["avatar"],
      );
}

class UScanned {
  UScanned({
    this.id,
    this.firstName,
    this.lastName,
    this.telephoneCode,
    this.telephoneNumber,
    this.telephoneFullNumber,
    this.email,
    this.company,
    this.position,
    this.avatarUrl,
  });

  int id;
  String firstName;
  String lastName;
  String telephoneCode;
  String telephoneNumber;
  String telephoneFullNumber;
  String email;
  String company;
  String position;
  String avatarUrl;

  factory UScanned.fromJson(Map<String, dynamic> json) => UScanned(
        id: json["id"] == null ? null : json["id"],
        firstName: json["first_name"] == null ? "" : json["first_name"],
        lastName: json["last_name"] == null ? "" : json["last_name"],
        telephoneCode:
            json["telephone_code"] == null ? "" : json["telephone_code"],
        telephoneNumber:
            json["telephone_number"] == null ? "" : json["telephone_number"],
        telephoneFullNumber: json["telephone_full_number"] == null
            ? ""
            : json["telephone_full_number"],
        email: json["email"] == null ? "" : json["email"],
        company: json["company"] == null ? "" : json["company"],
        position: json["position"] == null ? "" : json["position"],
        avatarUrl: json["avatar"] == null ? "" : json["avatar"],
      );
}

class UserFotoUpdate {
  UserFotoUpdate({
    this.avatar,
    this.type,
  });

  String avatar;
  String type;

  Map<String, dynamic> toJson() => {
        "avatar": avatar == null ? "" : avatar,
        "type": type == null ? "" : type,
      };
}

class UserUodate {
  UserUodate(
      {this.firstName,
      this.lastName,
      this.telephoneCode,
      this.telephoneNumber,
      this.company});

  String firstName;
  String lastName;
  String telephoneCode;
  String telephoneNumber;
  String company;
  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "telephone_code": telephoneCode,
        "telephone_number": telephoneNumber,
        "company": company,
      };
}

class UserUodatePass {
  UserUodatePass(
      {this.firstName,
      this.lastName,
      this.password,
      this.telephoneCode,
      this.telephoneNumber,
      this.company});

  String firstName;
  String lastName;
  String password;
  String telephoneCode;
  String telephoneNumber;
  String company;

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "password": password,
        "telephone_code": telephoneCode,
        "telephone_number": telephoneNumber,
        "company": company,
      };
}
