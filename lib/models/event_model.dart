import 'dart:convert';

import 'package:get/get.dart';

EventModel eventModelFromJson(String str) =>
    EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
  EventModel({
    this.data,
  });

  List<DatumComent> data;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        data: List<DatumComent>.from(
            json["data"].map((x) => DatumComent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DatumComent {
  DatumComent({
    this.id,
    this.title,
    this.description,
    this.commentsCount,
    this.event,
    this.user,
    this.likes,
    this.imageUrl,
    this.type,
    this.createAt,
    this.updateAt,
  });
  final cometntCounts = 0.obs;

  int id;
  String title;
  String description;
  int commentsCount;
  Event event;
  User user;
  List<User> likes;
  dynamic imageUrl;
  dynamic type;
  DateTime createAt;
  DateTime updateAt;

  factory DatumComent.fromJson(Map<String, dynamic> json) => DatumComent(
        id: json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"],
        commentsCount: json["comments_count"],
        event: Event.fromJson(json["event"]),
        user: User.fromJson(json["user"]),
        likes: List<User>.from(json["likes"].map((x) => User.fromJson(x))),
        imageUrl: json["image_url"],
        createAt: DateTime.parse(json["create_at"]),
        updateAt: DateTime.parse(json["update_at"]),
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "title": title == null ? '' : title,
        "description": description == null ? '' : description,
        // "comments_count": commentsCount,
        // "event": event.toJson(),
        // "user": user.toJson(),
        // "likes": List<dynamic>.from(likes.map((x) => x.toJson())),
        "type": type,
        "image": imageUrl,
        // "create_at": createAt.toIso8601String(),
        //  "update_at": updateAt.toIso8601String(),
      };

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DatumComentTxt {
  DatumComentTxt({
    this.title,
    this.description,
  });

  String title;
  String description;

  Map<String, dynamic> toJson() => {
        "title": title == null ? '' : title,
        "description": description == null ? '' : description,
      };

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Event {
  Event({
    this.id,
    this.title,
    this.description,
    this.address,
    this.addressLat,
    this.addressLng,
    this.settingId,
    this.registrationStart,
    this.registrationEnd,
    this.eventStart,
    this.eventEnd,
    this.subwayStation,
    this.locationName,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.logoUrl,
    // this.logo,
  });

  int id;
  String title;
  String description;
  String address;
  dynamic addressLat;
  dynamic addressLng;
  int settingId;
  DateTime registrationStart;
  DateTime registrationEnd;
  DateTime eventStart;
  DateTime eventEnd;
  String subwayStation;
  dynamic locationName;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String logoUrl;
  // Logo logo;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        address: json["address"],
        addressLat: json["address_lat"],
        addressLng: json["address_lng"],
        settingId: json["setting_id"],
        registrationStart: DateTime.parse(json["registration_start"]),
        registrationEnd: DateTime.parse(json["registration_end"]),
        eventStart: DateTime.parse(json["event_start"]),
        eventEnd: DateTime.parse(json["event_end"]),
        subwayStation: json["subway_station"],
        locationName: json["location_name"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        logoUrl: json["logo_url"],
        // logo: Logo.fromJson(json["logo"]),
      );
}

/*class Logo {
  Logo({
    this.id,
    this.type,
    this.itemType,
    this.itemId,
    this.fileName,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String type;
  String itemType;
  int itemId;
  String fileName;
  DateTime createdAt;
  DateTime updatedAt;

  factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        id: json["id"],
        type: json["type"],
        itemType: json["item_type"],
        itemId: json["item_id"],
        fileName: json["file_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "item_type": itemType,
        "item_id": itemId,
        "file_name": fileName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}*/

class User {
  User({
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
  });
  var isLiked = false.obs;
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

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"] == null ? "" : json["first_name"],
        lastName: json["last_name"] == null ? "" : json["last_name"],
        email: json["email"],
        activeStatus: json["active_status"],
        darkMode: json["dark_mode"],
        messengerColor: json["messenger_color"],
        avatar: json["avatar"],
        company: json["company"] == null ? "" : json["company"],
        telephoneCode:
            json["telephone_code"] == null ? null : json["telephone_code"],
        telephoneNumber:
            json["telephone_number"] == null ? null : json["telephone_number"],
        verified: json["verified"],
        verificationToken: json["verification_token"],
        resetToken: json["reset_token"],
        active: json["active"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        roleId: json["role_id"],
        mailCreditBalance: json["mail_credit_balance"],
        customFields: json["custom_fields"],
        isPrintSticker: json["is_print_sticker"],
        isCheckIn: json["is_check_in"],
        code: json["code"],
        avatarUrl: json["avatar_url"],
        telephoneFullNumber: json["telephone_full_number"],
      );
}
