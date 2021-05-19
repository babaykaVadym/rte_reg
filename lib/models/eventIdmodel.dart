// To parse this JSON data, do
//
//     final eventIdModel = eventIdModelFromJson(jsonString);

import 'dart:convert';

EventIdModel eventIdModelFromJson(String str) =>
    EventIdModel.fromJson(json.decode(str));

String eventIdModelToJson(EventIdModel data) => json.encode(data.toJson());

class EventIdModel {
  EventIdModel({
    this.id,
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
    this.webHooks,
    this.schema,
  });

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
  List<dynamic> webHooks;
  dynamic schema;

  factory EventIdModel.fromJson(Map<String, dynamic> json) => EventIdModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        address: json["address"],
        addressLat: json["address_lat"],
        addressLng: json["address_lng"],
        registrationStart: DateTime.parse(json["registration_start"]),
        registrationEnd: DateTime.parse(json["registration_end"]),
        eventStart: DateTime.parse(json["event_start"]),
        eventEnd: DateTime.parse(json["event_end"]),
        logo: json["logo"],
        logoType: json["logo_type"],
        subwayStation: json["subway_station"],
        locationName:
            json["location_name"] == null ? "" : json["location_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        domain: json["domain"] == null ? null : Domain.fromJson(json["domain"]),
        webHooks: List<dynamic>.from(json["web_hooks"].map((x) => x)),
        schema: json["schema"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "address": address,
        "address_lat": addressLat,
        "address_lng": addressLng,
        "registration_start": registrationStart.toIso8601String(),
        "registration_end": registrationEnd.toIso8601String(),
        "event_start": eventStart.toIso8601String(),
        "event_end": eventEnd.toIso8601String(),
        "logo": logo,
        "logo_type": logoType,
        "subway_station": subwayStation,
        "location_name": locationName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        //  "domain": domain.toJson(),
        "web_hooks": List<dynamic>.from(webHooks.map((x) => x)),
        "schema": schema,
      };
}

class Domain {
  Domain({
    //this.id,
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

//  int id;
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
        //  id: json["id"],
        //  domainName: json["domain_name"] == null ? "" : json["domain_name"],
        eventId: json["event_id"] == null ? "" : json["event_id"],
        image: json["image"] == null ? "" : json["image"],
        isProgram: json["is_program"] == null ? "" : json["is_program"],
        programTitle:
            json["program_title"] == null ? "" : json["program_title"],
        programHtml: json["program_html"] == null ? "" : json["program_html"],
        isSpeakers: json["is_speakers"] == null ? "" : json["is_speakers"],
        speakersTitle: json["speakers_title"],
        speakersHtml: json["speakers_html"],
        isYoutube: json["is_youtube"],
        youtubeTitle: json["youtube_title"],
        isSocial: json["is_social"],
        socialTitle: json["social_title"],
        isAbout: json["is_about"],
        aboutTitle: json["about_title"],
        youtube: json["youtube"],
        facebook: json["facebook"],
        instagram: json["instagram"],
        telegram: json["telegram"],
        isMap: json["is_map"],
        map: json["map"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        formType: json["form_type"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "domain_name": domainName,
        "event_id": eventId,
        "image": image,
        "is_program": isProgram,
        "program_title": programTitle,
        "program_html": programHtml,
        "is_speakers": isSpeakers,
        "speakers_title": speakersTitle,
        "speakers_html": speakersHtml,
        "is_youtube": isYoutube,
        "youtube_title": youtubeTitle,
        "is_social": isSocial,
        "social_title": socialTitle,
        "is_about": isAbout,
        "about_title": aboutTitle,
        "youtube": youtube,
        "facebook": facebook,
        "instagram": instagram,
        "telegram": telegram,
        "is_map": isMap,
        "map": map,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "form_type": formType,
        "href": href,
      };
}
