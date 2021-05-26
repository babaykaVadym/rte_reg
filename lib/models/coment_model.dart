import 'dart:convert';

import 'package:get/get.dart';
import 'package:rte_cubit/models/user_model.dart';

List<ComentModel> comentModelFromJson(String str) => List<ComentModel>.from(
    json.decode(str).map((x) => ComentModel.fromJson(x)));

String comentModelToJson(List<ComentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ComentModel {
  ComentModel({
    this.id,
    this.comment,
    this.createdAt,
    this.user,
    this.likes,
  });

  var isLikedComent = false.obs;
  int id;
  String comment;
  DateTime createdAt;
  User user;
  List<Like> likes;

  factory ComentModel.fromJson(Map<String, dynamic> json) => ComentModel(
        id: json["id"],
        comment: json["comment"],
        createdAt: DateTime.parse(json["created_at"]),
        user: User.fromJson(json["user"]),
        likes: List<Like>.from(json["likes"].map((x) => Like.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "created_at": createdAt.toIso8601String(),
        //   "user": user.toJson(),
        //    "likes": List<dynamic>.from(likes.map((x) => x.toJson())),
      };
}

class Like {
  Like({
    this.id,
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
    this.createdAt,
    this.updatedAt,
    this.roleId,
    this.mailCreditBalance,
    this.customFields,
    this.isPrintSticker,
    this.isCheckIn,
    this.code,
    this.avatarUrl,
    this.telephoneFullNumber,
    this.pivot,
  });

  int id;
  String firstName;
  dynamic lastName;
  String email;
  int activeStatus;
  int darkMode;
  String messengerColor;
  dynamic avatar;
  dynamic company;
  String telephoneCode;
  String telephoneNumber;
  int verified;
  dynamic verificationToken;
  dynamic resetToken;
  int active;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int roleId;
  int mailCreditBalance;
  dynamic customFields;
  int isPrintSticker;
  int isCheckIn;
  dynamic code;
  String avatarUrl;
  String telephoneFullNumber;
  Pivot pivot;

  factory Like.fromJson(Map<String, dynamic> json) => Like(
        id: json["id"],
        firstName: json["first_name"] == null ? "" : json["first_name"],
        lastName: json["last_name"] == null ? "" : json["last_name"],
        email: json["email"],
        activeStatus: json["active_status"],
        darkMode: json["dark_mode"],
        messengerColor: json["messenger_color"],
        avatar: json["avatar"],
        company: json["company"],
        telephoneCode: json["telephone_code"],
        telephoneNumber: json["telephone_number"],
        verified: json["verified"],
        verificationToken: json["verification_token"],
        resetToken: json["reset_token"],
        active: json["active"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        roleId: json["role_id"],
        mailCreditBalance: json["mail_credit_balance"],
        customFields: json["custom_fields"],
        isPrintSticker: json["is_print_sticker"],
        isCheckIn: json["is_check_in"],
        code: json["code"],
        avatarUrl: json["avatar_url"],
        telephoneFullNumber: json["telephone_full_number"],
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "role_id": roleId,
        "mail_credit_balance": mailCreditBalance,
        "custom_fields": customFields,
        "is_print_sticker": isPrintSticker,
        "is_check_in": isCheckIn,
        "code": code,
        "avatar_url": avatarUrl,
        "telephone_full_number": telephoneFullNumber,
        "pivot": pivot.toJson(),
      };
}

class Pivot {
  Pivot({
    this.commentId,
    this.userId,
  });

  int commentId;
  int userId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        commentId: json["comment_id"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "comment_id": commentId,
        "user_id": userId,
      };
}

class User {
  User({
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
    this.zones,
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
  List<dynamic> zones;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"] == null ? "" : json["first_name"],
        lastName: json["last_name"] == null ? "" : json["last_name"],
        avatar: json["avatar"],
        telephoneCode:
            json["telephone_code"] == null ? null : json["telephone_code"],
        telephoneNumber:
            json["telephone_number"] == null ? null : json["telephone_number"],
        isCheckIn: json["is_check_in"],
        isPrintSticker: json["is_print_sticker"],
        telephoneFullNumber: json["telephone_full_number"],
        customFields: json["custom_fields"],
        events: List<dynamic>.from(json["events"].map((x) => x)),
        company: json["company"] == null ? "" : json["company"],
        parents: List<dynamic>.from(json["parents"].map((x) => x)),
        children: List<dynamic>.from(json["children"].map((x) => x)),
        email: json["email"],
        role: Role.fromJson(json["role"]),
        permissions: List<Permission>.from(
            json["permissions"].map((x) => Permission.fromJson(x))),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        verified: json["verified"],
        mailCreditBalance: json["mail_credit_balance"],
        logs: List<dynamic>.from(json["logs"].map((x) => x)),
        balanceInfo: List<dynamic>.from(json["balance_info"].map((x) => x)),
        scans: Scans.fromJson(json["scans"]),
        zones: List<dynamic>.from(json["zones"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName,
        "avatar": avatar,
        "telephone_code": telephoneCode == null ? null : telephoneCode,
        "telephone_number": telephoneNumber == null ? null : telephoneNumber,
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
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "verified": verified,
        "mail_credit_balance": mailCreditBalance,
        "logs": List<dynamic>.from(logs.map((x) => x)),
        "balance_info": List<dynamic>.from(balanceInfo.map((x) => x)),
        "zones": List<dynamic>.from(zones.map((x) => x)),
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
  Group group;

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        id: json["id"],
        name: json["name"],
        permission: json["permission"],
        group: Group.fromJson(json["group"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "permission": permission,
        "group": group.toJson(),
      };
}

class Group {
  Group({
    this.id,
    this.name,
    this.group,
  });

  int id;
  String name;
  String group;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
        group: json["group"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "group": group,
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
