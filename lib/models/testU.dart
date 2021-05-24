// To parse this JSON data, do
//
//     final userFotoUpdate = userFotoUpdateFromJson(jsonString);

import 'dart:convert';

UserFotoUpdate userFotoUpdateFromJson(String str) =>
    UserFotoUpdate.fromJson(json.decode(str));

String userFotoUpdateToJson(UserFotoUpdate data) => json.encode(data.toJson());

class UserFotoUpdate {
  UserFotoUpdate({
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
    this.uScanned,
    this.uScannedBy,
    this.zones,
    this.userHash,
    this.promoCodeOptions,
    this.ticketSchemas,
    this.quizHistory,
    this.coins,
  });

  int id;
  String firstName;
  dynamic lastName;
  String avatar;
  String telephoneCode;
  String telephoneNumber;
  int isCheckIn;
  int isPrintSticker;
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
  List<Map<String, UScanned>> uScanned;
  List<List<dynamic>> uScannedBy;
  List<dynamic> zones;
  dynamic userHash;
  List<dynamic> promoCodeOptions;
  List<dynamic> ticketSchemas;
  List<dynamic> quizHistory;
  int coins;

  factory UserFotoUpdate.fromJson(Map<String, dynamic> json) => UserFotoUpdate(
        id: json["id"] == null ? null : json["id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        telephoneCode:
            json["telephone_code"] == null ? null : json["telephone_code"],
        telephoneNumber:
            json["telephone_number"] == null ? null : json["telephone_number"],
        isCheckIn: json["is_check_in"] == null ? null : json["is_check_in"],
        isPrintSticker:
            json["is_print_sticker"] == null ? null : json["is_print_sticker"],
        telephoneFullNumber: json["telephone_full_number"] == null
            ? null
            : json["telephone_full_number"],
        customFields: json["custom_fields"],
        events: json["events"] == null
            ? null
            : List<dynamic>.from(json["events"].map((x) => x)),
        company: json["company"],
        parents: json["parents"] == null
            ? null
            : List<dynamic>.from(json["parents"].map((x) => x)),
        children: json["children"] == null
            ? null
            : List<dynamic>.from(json["children"].map((x) => x)),
        email: json["email"] == null ? null : json["email"],
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
        permissions: json["permissions"] == null
            ? null
            : List<Permission>.from(
                json["permissions"].map((x) => Permission.fromJson(x))),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        verified: json["verified"] == null ? null : json["verified"],
        mailCreditBalance: json["mail_credit_balance"] == null
            ? null
            : json["mail_credit_balance"],
        logs: json["logs"] == null
            ? null
            : List<dynamic>.from(json["logs"].map((x) => x)),
        balanceInfo: json["balance_info"] == null
            ? null
            : List<dynamic>.from(json["balance_info"].map((x) => x)),
        scans: json["scans"] == null ? null : Scans.fromJson(json["scans"]),
        uScanned: json["u_scanned"] == null
            ? null
            : List<Map<String, UScanned>>.from(json["u_scanned"].map((x) =>
                Map.from(x).map((k, v) =>
                    MapEntry<String, UScanned>(k, UScanned.fromJson(v))))),
        uScannedBy: json["u_scanned_by"] == null
            ? null
            : List<List<dynamic>>.from(json["u_scanned_by"]
                .map((x) => List<dynamic>.from(x.map((x) => x)))),
        zones: json["zones"] == null
            ? null
            : List<dynamic>.from(json["zones"].map((x) => x)),
        userHash: json["user_hash"],
        promoCodeOptions: json["promo_code_options"] == null
            ? null
            : List<dynamic>.from(json["promo_code_options"].map((x) => x)),
        ticketSchemas: json["ticket_schemas"] == null
            ? null
            : List<dynamic>.from(json["ticket_schemas"].map((x) => x)),
        quizHistory: json["quiz_history"] == null
            ? null
            : List<dynamic>.from(json["quiz_history"].map((x) => x)),
        coins: json["coins"] == null ? null : json["coins"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName,
        "avatar": avatar == null ? null : avatar,
        "telephone_code": telephoneCode == null ? null : telephoneCode,
        "telephone_number": telephoneNumber == null ? null : telephoneNumber,
        "is_check_in": isCheckIn == null ? null : isCheckIn,
        "is_print_sticker": isPrintSticker == null ? null : isPrintSticker,
        "telephone_full_number":
            telephoneFullNumber == null ? null : telephoneFullNumber,
        "custom_fields": customFields,
        "events":
            events == null ? null : List<dynamic>.from(events.map((x) => x)),
        "company": company,
        "parents":
            parents == null ? null : List<dynamic>.from(parents.map((x) => x)),
        "children": children == null
            ? null
            : List<dynamic>.from(children.map((x) => x)),
        "email": email == null ? null : email,
        "role": role == null ? null : role.toJson(),
        "permissions": permissions == null
            ? null
            : List<dynamic>.from(permissions.map((x) => x.toJson())),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "verified": verified == null ? null : verified,
        "mail_credit_balance":
            mailCreditBalance == null ? null : mailCreditBalance,
        "logs": logs == null ? null : List<dynamic>.from(logs.map((x) => x)),
        "balance_info": balanceInfo == null
            ? null
            : List<dynamic>.from(balanceInfo.map((x) => x)),
        "scans": scans == null ? null : scans.toJson(),
        "u_scanned": uScanned == null
            ? null
            : List<dynamic>.from(uScanned.map((x) => Map.from(x)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
        "u_scanned_by": uScannedBy == null
            ? null
            : List<dynamic>.from(
                uScannedBy.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "zones": zones == null ? null : List<dynamic>.from(zones.map((x) => x)),
        "user_hash": userHash,
        "promo_code_options": promoCodeOptions == null
            ? null
            : List<dynamic>.from(promoCodeOptions.map((x) => x)),
        "ticket_schemas": ticketSchemas == null
            ? null
            : List<dynamic>.from(ticketSchemas.map((x) => x)),
        "quiz_history": quizHistory == null
            ? null
            : List<dynamic>.from(quizHistory.map((x) => x)),
        "coins": coins == null ? null : coins,
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
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        permission: json["permission"] == null ? null : json["permission"],
        group:
            json["group"] == null ? null : GroupClass.fromJson(json["group"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "permission": permission == null ? null : permission,
        "group": group == null ? null : group.toJson(),
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
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : nameValues.map[json["name"]],
        group:
            json["group"] == null ? null : groupEnumValues.map[json["group"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : nameValues.reverse[name],
        "group": group == null ? null : groupEnumValues.reverse[group],
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

class Scans {
  Scans({
    this.data,
    this.pagination,
  });

  List<UScanned> data;
  Pagination pagination;

  factory Scans.fromJson(Map<String, dynamic> json) => Scans(
        data: json["data"] == null
            ? null
            : List<UScanned>.from(
                json["data"].map((x) => UScanned.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination == null ? null : pagination.toJson(),
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
        total: json["total"] == null ? null : json["total"],
        currentPage: json["current_page"] == null ? null : json["current_page"],
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        count: json["count"] == null ? null : json["count"],
        perPage: json["per_page"] == null ? null : json["per_page"],
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "current_page": currentPage == null ? null : currentPage,
        "total_pages": totalPages == null ? null : totalPages,
        "count": count == null ? null : count,
        "per_page": perPage == null ? null : perPage,
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
