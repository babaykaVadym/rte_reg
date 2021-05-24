// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.avatar,
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
    this.role,
    this.permissions,
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
  dynamic avatar;
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
  Role role;
  List<Permission> permissions;
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
        avatar: json["avatar"],
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
        role: Role.fromJson(json["role"]),
        permissions: List<Permission>.from(
            json["permissions"].map((x) => Permission.fromJson(x))),
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
        "telephone_code": telephoneCode,
        "telephone_number": telephoneNumber,
        "is_check_in": isCheckIn,
        "is_print_sticker": isPrintSticker,
        "telephone_full_number": telephoneFullNumber,
        "custom_fields": customFields,
        "events": List<dynamic>.from(events.map((x) => x)),
        "company": company,
        "parents": List<dynamic>.from(parents.map((x) => x)),
        "children": List<dynamic>.from(children.map((x) => x)),
        "email": email,
        "role": role.toJson(),
        "permissions": List<dynamic>.from(permissions.map((x) => x.toJson())),
        "created_at": createdAt.toIso8601String(),
        "verified": verified,
        "mail_credit_balance": mailCreditBalance,
        "logs": List<dynamic>.from(logs.map((x) => x)),
        "balance_info": List<dynamic>.from(balanceInfo.map((x) => x)),
        "scans": scans.toJson(),
      };
}

class Permission {
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
}

class GroupClass {
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
}

enum GroupEnum { EVENT, EVENT_ORDER, EVENT_PROMO_CODE }

final groupEnumValues = EnumValues({
  "event": GroupEnum.EVENT,
  "event_order": GroupEnum.EVENT_ORDER,
  "event_promo_code": GroupEnum.EVENT_PROMO_CODE
});

enum Name { EVENTS, EVENT_ORDER_GROUP, EVENT_PROMO_CODE_GROUP }

final nameValues = EnumValues({
  "Events": Name.EVENTS,
  "Event order group": Name.EVENT_ORDER_GROUP,
  "Event promo code group": Name.EVENT_PROMO_CODE_GROUP
});

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
        id: json["id"],
        name: json["name"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
      };
}

class Scans {
  Scans({
    this.data,
    this.pagination,
  });

  List<Datum> data;
  Pagination pagination;

  factory Scans.fromJson(Map<String, dynamic> json) => Scans(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
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
    this.avatar,
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
  String avatar;

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
        avatar: json["avatar"] == null
            ? "https://a3.rte.im/storage/avatar.png"
            : json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstNameValues.reverse[firstName],
        "last_name": lastName == null ? null : lastNameValues.reverse[lastName],
        "telephone_code": emailValues.reverse[telephoneCode],
        "telephone_number": emailValues.reverse[telephoneNumber],
        "telephone_full_number": emailValues.reverse[telephoneFullNumber],
        "email": emailValues.reverse[email],
        "company": company == null ? null : companyValues.reverse[company],
        "position": position == null ? null : positionValues.reverse[position],
      };
}

enum Company { EMPTY, ASD }

final companyValues =
    EnumValues({"asd": Company.ASD, "ТОВ \"Ромашка\"": Company.EMPTY});

enum Email { EMPTY }

final emailValues = EnumValues({"***********": Email.EMPTY});

enum FirstName { EMPTY, FIRST_NAME, ASDASDASD, ASD, MY_NEW_FIRSTNAME2 }

final firstNameValues = EnumValues({
  "asd": FirstName.ASD,
  "asdasdasd": FirstName.ASDASDASD,
  "Настюшка": FirstName.EMPTY,
  "Виталий": FirstName.FIRST_NAME,
  "my new firstname2": FirstName.MY_NEW_FIRSTNAME2
});

enum LastName { EMPTY, LAST_NAME }

final lastNameValues =
    EnumValues({"Писечкина": LastName.EMPTY, "ВЕТАЛИЙ": LastName.LAST_NAME});

enum Position { EMPTY, ASD }

final positionValues =
    EnumValues({"asd": Position.ASD, "Светило ног": Position.EMPTY});

class Pagination {
  Pagination({
    this.total,
    this.currentPage,
    this.totalPages,
    this.count,
    this.perPage,
  });

  int total;
  int currentPage;
  int totalPages;
  int count;
  int perPage;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
        count: json["count"],
        perPage: json["per_page"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "current_page": currentPage,
        "total_pages": totalPages,
        "count": count,
        "per_page": perPage,
      };
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
    this.avatar,
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
  String avatar;

  factory UScanned.fromJson(Map<String, dynamic> json) => UScanned(
        id: json["id"] == null ? null : json["id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        telephoneCode:
            json["telephone_code"] == null ? null : json["telephone_code"],
        telephoneNumber:
            json["telephone_number"] == null ? null : json["telephone_number"],
        telephoneFullNumber: json["telephone_full_number"] == null
            ? null
            : json["telephone_full_number"],
        email: json["email"] == null ? null : json["email"],
        company: json["company"] == null ? null : json["company"],
        position: json["position"] == null ? null : json["position"],
        avatar: json["avatar"] == null ? null : json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "telephone_code": telephoneCode == null ? null : telephoneCode,
        "telephone_number": telephoneNumber == null ? null : telephoneNumber,
        "telephone_full_number":
            telephoneFullNumber == null ? null : telephoneFullNumber,
        "email": email == null ? null : email,
        "company": company == null ? null : company,
        "position": position == null ? null : position,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
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
      {this.email,
      this.firstName,
      this.lastName,
      this.telephoneCode,
      this.telephoneNumber,
      this.company});

  String email;
  String firstName;
  String lastName;
  String telephoneCode;
  String telephoneNumber;
  String company;
  Map<String, dynamic> toJson() => {
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "telephone_code": telephoneCode,
        "telephone_number": telephoneNumber,
        "company": company,
      };
}

class UserUodatePass {
  UserUodatePass(
      {this.email,
      this.firstName,
      this.lastName,
      this.password,
      this.telephoneCode,
      this.telephoneNumber,
      this.company});

  String email;
  String firstName;
  String lastName;
  String password;
  String telephoneCode;
  String telephoneNumber;
  String company;

  Map<String, dynamic> toJson() => {
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "password": password,
        "telephone_code": telephoneCode,
        "telephone_number": telephoneNumber,
        "company": company,
      };
}
