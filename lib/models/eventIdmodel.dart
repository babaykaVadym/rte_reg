// To parse this JSON data, do
//
//     final eventIdModel = eventIdModelFromJson(jsonString);

import 'dart:convert';

EventIdModel eventIdModelFromJson(String str) =>
    EventIdModel.fromJson(json.decode(str));

String eventIdModelToJson(EventIdModel data) => json.encode(data.toJson());

class EventIdModel {
  EventIdModel(
      {this.id,
      this.title,
      this.description,
      this.address,
      this.addressLat,
      this.addressLng,
      this.registrationStart,
      this.registrationEnd,
      this.eventStart,
      this.eventEnd,
      this.logo,
      this.logoType,
      this.subwayStation,
      this.locationName,
      this.createdAt,
      this.updatedAt,
      this.domain,
      this.speakers,
      this.organizer});

  int id;
  String title;
  String description;
  String address;
  dynamic addressLat;
  dynamic addressLng;
  DateTime registrationStart;
  DateTime registrationEnd;
  DateTime eventStart;
  DateTime eventEnd;
  String logo;
  String logoType;
  String subwayStation;
  String locationName;
  DateTime createdAt;
  DateTime updatedAt;
  Domain domain;
  Speakers speakers;
  int organizer;

  factory EventIdModel.fromJson(Map<String, dynamic> json) => EventIdModel(
      id: json["id"] == null ? null : json["id"],
      title: json["title"] == null ? null : json["title"],
      description: json["description"] == null ? null : json["description"],
      address: json["address"] == null ? "" : json["address"],
      addressLat: json["address_lat"],
      addressLng: json["address_lng"],
      registrationStart: json["registration_start"] == null
          ? ""
          : DateTime.parse(json["registration_start"]),
      registrationEnd: json["registration_end"] == null
          ? ""
          : DateTime.parse(json["registration_end"]),
      eventStart: json["event_start"] == null
          ? null
          : DateTime.parse(json["event_start"]),
      eventEnd:
          json["event_end"] == null ? null : DateTime.parse(json["event_end"]),
      logo: json["logo"] == null ? null : json["logo"],
      logoType: json["logo_type"] == null ? null : json["logo_type"],
      subwayStation:
          json["subway_station"] == null ? null : json["subway_station"],
      locationName: json["location_name"] == null ? "" : json["location_name"],
      createdAt: json["created_at"] == null
          ? null
          : DateTime.parse(json["created_at"]),
      updatedAt: json["updated_at"] == null
          ? null
          : DateTime.parse(json["updated_at"]),
      domain: json["domain"] == null ? null : Domain.fromJson(json["domain"]),
      speakers:
          json["speakers"] == null ? null : Speakers.fromJson(json["speakers"]),
      organizer: json['organizer']);

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "address": address == null ? null : address,
        "address_lat": addressLat,
        "address_lng": addressLng,
        "registration_start": registrationStart == null
            ? null
            : registrationStart.toIso8601String(),
        "registration_end":
            registrationEnd == null ? null : registrationEnd.toIso8601String(),
        "event_start": eventStart == null ? null : eventStart.toIso8601String(),
        "event_end": eventEnd == null ? null : eventEnd.toIso8601String(),
        "logo": logo == null ? null : logo,
        "logo_type": logoType == null ? null : logoType,
        "subway_station": subwayStation == null ? null : subwayStation,
        "location_name": locationName == null ? null : locationName,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "domain": domain == null ? null : domain.toJson(),
      };
}

class Domain {
  Domain({
    this.id,
    this.domainName,
    this.eventId,
    this.image,
    this.isProgram,
    this.programTitle,
    this.programHtml,
    this.isSpeakers,
    this.speakersTitle,
    this.speakersHtml,
    this.isYoutube,
    this.youtubeTitle,
    this.isSocial,
    this.socialTitle,
    this.isAbout,
    this.aboutTitle,
    this.youtube,
    this.facebook,
    this.instagram,
    this.telegram,
    this.isMap,
    this.map,
    this.createdAt,
    this.updatedAt,
    this.formType,
    this.href,
  });

  int id;
  String domainName;
  int eventId;
  String image;
  int isProgram;
  String programTitle;
  String programHtml;
  int isSpeakers;
  String speakersTitle;
  String speakersHtml;
  int isYoutube;
  String youtubeTitle;
  int isSocial;
  String socialTitle;
  int isAbout;
  String aboutTitle;
  String youtube;
  dynamic facebook;
  dynamic instagram;
  dynamic telegram;
  int isMap;
  String map;
  DateTime createdAt;
  DateTime updatedAt;
  String formType;
  String href;

  factory Domain.fromJson(Map<String, dynamic> json) => Domain(
        id: json["id"] == null ? null : json["id"],
        domainName: json["domain_name"] == null ? null : json["domain_name"],
        eventId: json["event_id"] == null ? null : json["event_id"],
        image: json["image"] == null ? null : json["image"],
        isProgram: json["is_program"] == null ? null : json["is_program"],
        programTitle:
            json["program_title"] == null ? null : json["program_title"],
        programHtml: json["program_html"] == null ? null : json["program_html"],
        isSpeakers: json["is_speakers"] == null ? null : json["is_speakers"],
        speakersTitle:
            json["speakers_title"] == null ? null : json["speakers_title"],
        speakersHtml:
            json["speakers_html"] == null ? null : json["speakers_html"],
        isYoutube: json["is_youtube"] == null ? null : json["is_youtube"],
        youtubeTitle:
            json["youtube_title"] == null ? null : json["youtube_title"],
        isSocial: json["is_social"] == null ? null : json["is_social"],
        socialTitle: json["social_title"] == null ? null : json["social_title"],
        isAbout: json["is_about"] == null ? null : json["is_about"],
        aboutTitle: json["about_title"] == null ? null : json["about_title"],
        youtube: json["youtube"] == null ? null : json["youtube"],
        facebook: json["facebook"],
        instagram: json["instagram"],
        telegram: json["telegram"],
        isMap: json["is_map"] == null ? null : json["is_map"],
        map: json["map"] == null ? null : json["map"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        formType: json["form_type"] == null ? null : json["form_type"],
        href: json["href"] == null ? null : json["href"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "domain_name": domainName == null ? null : domainName,
        "event_id": eventId == null ? null : eventId,
        "image": image == null ? null : image,
        "is_program": isProgram == null ? null : isProgram,
        "program_title": programTitle == null ? null : programTitle,
        "program_html": programHtml == null ? null : programHtml,
        "is_speakers": isSpeakers == null ? null : isSpeakers,
        "speakers_title": speakersTitle == null ? null : speakersTitle,
        "speakers_html": speakersHtml == null ? null : speakersHtml,
        "is_youtube": isYoutube == null ? null : isYoutube,
        "youtube_title": youtubeTitle == null ? null : youtubeTitle,
        "is_social": isSocial == null ? null : isSocial,
        "social_title": socialTitle == null ? null : socialTitle,
        "is_about": isAbout == null ? null : isAbout,
        "about_title": aboutTitle == null ? null : aboutTitle,
        "youtube": youtube == null ? null : youtube,
        "facebook": facebook,
        "instagram": instagram,
        "telegram": telegram,
        "is_map": isMap == null ? null : isMap,
        "map": map == null ? null : map,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "form_type": formType == null ? null : formType,
        "href": href == null ? null : href,
      };
}

class Speakers {
  Speakers({
    this.data,
  });

  List<Datum> data;

  factory Speakers.fromJson(Map<String, dynamic> json) => Speakers(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    this.id,
    this.info,
  });

  int id;
  Info info;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
      );
}

class Info {
  Info(
      {this.id,
      this.verified,
      this.events,
      this.firstName,
      this.lastName,
      this.avatarUrl,
      this.telephoneCode,
      this.telephoneNumber,
      this.isCheckIn,
      this.isPrintSticker,
      this.telephoneFullNumber,
      this.email,
      this.role,
      this.company});

  int id;
  int verified;
  List<dynamic> events;
  String firstName;
  dynamic lastName;
  String avatarUrl;
  String telephoneCode;
  String telephoneNumber;
  int isCheckIn;
  int isPrintSticker;
  String telephoneFullNumber;
  String email;
  String company;
  Role role;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
      id: json["id"] == null ? null : json["id"],
      verified: json["verified"] == null ? null : json["verified"],
      events: json["events"] == null
          ? null
          : List<dynamic>.from(json["events"].map((x) => x)),
      firstName: json["first_name"] == null ? "" : json["first_name"],
      lastName: json["last_name"] == null ? "" : json["last_name"],
      avatarUrl: json["avatar"] == null ? "" : json["avatar"],
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
      email: json["email"] == null ? null : json["email"],
      role: json["role"] == null ? null : Role.fromJson(json["role"]),
      company: json["company"] == null ? null : json["company"]);
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
