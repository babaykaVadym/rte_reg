// To parse this JSON data, do
//
//     final upgradeTicketModel = upgradeTicketModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

List<UpgradeTicketModel> upgradeTicketModelFromJson(String str) =>
    List<UpgradeTicketModel>.from(
        json.decode(str).map((x) => UpgradeTicketModel.fromJson(x)));

String upgradeTicketModelToJson(List<UpgradeTicketModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UpgradeTicketModel {
  UpgradeTicketModel({
    this.tickets,
    this.optionUpgrades,
    this.ticketSchemaUpgrade,
  });

  Tickets tickets;
  List<OptionUpgrade> optionUpgrades;
  List<TicketSchemaUpgrade> ticketSchemaUpgrade;

  factory UpgradeTicketModel.fromJson(Map<String, dynamic> json) =>
      UpgradeTicketModel(
        tickets:
            json["tickets"] == null ? null : Tickets.fromJson(json["tickets"]),
        optionUpgrades: json["option_upgrades"] == null
            ? null
            : List<OptionUpgrade>.from(
                json["option_upgrades"].map((x) => OptionUpgrade.fromJson(x))),
        ticketSchemaUpgrade: json["ticket_schema_upgrade"] == null
            ? null
            : List<TicketSchemaUpgrade>.from(json["ticket_schema_upgrade"]
                .map((x) => TicketSchemaUpgrade.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tickets": tickets == null ? null : tickets.toJson(),
        "option_upgrades": optionUpgrades == null
            ? null
            : List<dynamic>.from(optionUpgrades.map((x) => x.toJson())),
        "ticket_schema_upgrade": ticketSchemaUpgrade == null
            ? null
            : List<dynamic>.from(ticketSchemaUpgrade.map((x) => x.toJson())),
      };
}

class OptionUpgrade {
  OptionUpgrade({
    this.id,
    this.option,
    this.price,
    this.isUpgradeOption,
  });
  var activeBtn = false.obs;
  int id;
  String option;
  String price;
  int isUpgradeOption;

  factory OptionUpgrade.fromJson(Map<String, dynamic> json) => OptionUpgrade(
        id: json["id"] == null ? null : json["id"],
        option: json["option"] == null ? null : json["option"],
        price: json["price"] == null ? null : json["price"],
        isUpgradeOption: json["is_upgrade_option"] == null
            ? null
            : json["is_upgrade_option"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "option": option == null ? null : option,
        "price": price == null ? null : price,
        "is_upgrade_option": isUpgradeOption == null ? null : isUpgradeOption,
      };
}

class TicketSchemaUpgrade {
  TicketSchemaUpgrade({
    this.id,
    this.price,
    this.active,
    this.title,
    this.description,
    this.allAvailableAmount,
    this.availableAmount,
  });
  var activeBtnSchema = false.obs;
  int id;
  String price;
  int active;
  String title;
  String description;
  int allAvailableAmount;
  int availableAmount;

  factory TicketSchemaUpgrade.fromJson(Map<String, dynamic> json) =>
      TicketSchemaUpgrade(
        id: json["id"] == null ? null : json["id"],
        price: json["price"] == null ? null : json["price"],
        active: json["active"] == null ? null : json["active"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        allAvailableAmount: json["all_available_amount"] == null
            ? null
            : json["all_available_amount"],
        availableAmount:
            json["available_amount"] == null ? null : json["available_amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "price": price == null ? null : price,
        "active": active == null ? null : active,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "all_available_amount":
            allAvailableAmount == null ? null : allAvailableAmount,
        "available_amount": availableAmount == null ? null : availableAmount,
      };
}

class Tickets {
  Tickets({
    this.id,
    this.hash,
    this.price,
    this.orderNumber,
    this.orderId,
    this.schemaId,
    this.holderId,
    this.discounted,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.promoCodeId,
    this.qrCodeUrl,
    this.barCodeUrl,
    this.externalId,
    this.orderHash,
    this.schema,
  });

  int id;
  int hash;
  String price;
  int orderNumber;
  int orderId;
  int schemaId;
  int holderId;
  int discounted;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic promoCodeId;
  String qrCodeUrl;
  String barCodeUrl;
  dynamic externalId;
  int orderHash;
  Schema schema;

  factory Tickets.fromJson(Map<String, dynamic> json) => Tickets(
        id: json["id"] == null ? null : json["id"],
        hash: json["hash"] == null ? null : json["hash"],
        price: json["price"] == null ? null : json["price"],
        orderNumber: json["order_number"] == null ? null : json["order_number"],
        orderId: json["order_id"] == null ? null : json["order_id"],
        schemaId: json["schema_id"] == null ? null : json["schema_id"],
        holderId: json["holder_id"] == null ? null : json["holder_id"],
        discounted: json["discounted"] == null ? null : json["discounted"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        promoCodeId: json["promo_code_id"],
        qrCodeUrl: json["qr_code_url"] == null ? null : json["qr_code_url"],
        barCodeUrl: json["bar_code_url"] == null ? null : json["bar_code_url"],
        externalId: json["external_id"],
        orderHash: json["order_hash"] == null ? null : json["order_hash"],
        schema: json["schema"] == null ? null : Schema.fromJson(json["schema"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "hash": hash == null ? null : hash,
        "price": price == null ? null : price,
        "order_number": orderNumber == null ? null : orderNumber,
        "order_id": orderId == null ? null : orderId,
        "schema_id": schemaId == null ? null : schemaId,
        "holder_id": holderId == null ? null : holderId,
        "discounted": discounted == null ? null : discounted,
        "deleted_at": deletedAt,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "promo_code_id": promoCodeId,
        "qr_code_url": qrCodeUrl == null ? null : qrCodeUrl,
        "bar_code_url": barCodeUrl == null ? null : barCodeUrl,
        "external_id": externalId,
        "order_hash": orderHash == null ? null : orderHash,
        "schema": schema == null ? null : schema.toJson(),
      };
}

class Schema {
  Schema({
    this.id,
    this.title,
    this.description,
    this.typeId,
    this.eventId,
    this.color,
    this.availableAmount,
    this.maxAmountPerOrder,
    this.minAmountPerOrder,
    this.startSale,
    this.endSale,
    this.price,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.moderationTypeId,
    this.allAvailableAmount,
    this.ticketEmailText,
    this.status,
  });

  int id;
  String title;
  String description;
  int typeId;
  int eventId;
  String color;
  int availableAmount;
  int maxAmountPerOrder;
  int minAmountPerOrder;
  DateTime startSale;
  DateTime endSale;
  String price;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int moderationTypeId;
  int allAvailableAmount;
  String ticketEmailText;
  int status;

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        typeId: json["type_id"] == null ? null : json["type_id"],
        eventId: json["event_id"] == null ? null : json["event_id"],
        color: json["color"] == null ? null : json["color"],
        availableAmount:
            json["available_amount"] == null ? null : json["available_amount"],
        maxAmountPerOrder: json["max_amount_per_order"] == null
            ? null
            : json["max_amount_per_order"],
        minAmountPerOrder: json["min_amount_per_order"] == null
            ? null
            : json["min_amount_per_order"],
        startSale: json["start_sale"] == null
            ? null
            : DateTime.parse(json["start_sale"]),
        endSale:
            json["end_sale"] == null ? null : DateTime.parse(json["end_sale"]),
        price: json["price"] == null ? null : json["price"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        moderationTypeId: json["moderation_type_id"] == null
            ? null
            : json["moderation_type_id"],
        allAvailableAmount: json["all_available_amount"] == null
            ? null
            : json["all_available_amount"],
        ticketEmailText: json["ticket_email_text"] == null
            ? null
            : json["ticket_email_text"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "type_id": typeId == null ? null : typeId,
        "event_id": eventId == null ? null : eventId,
        "color": color == null ? null : color,
        "available_amount": availableAmount == null ? null : availableAmount,
        "max_amount_per_order":
            maxAmountPerOrder == null ? null : maxAmountPerOrder,
        "min_amount_per_order":
            minAmountPerOrder == null ? null : minAmountPerOrder,
        "start_sale": startSale == null ? null : startSale.toIso8601String(),
        "end_sale": endSale == null ? null : endSale.toIso8601String(),
        "price": price == null ? null : price,
        "deleted_at": deletedAt,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "moderation_type_id":
            moderationTypeId == null ? null : moderationTypeId,
        "all_available_amount":
            allAvailableAmount == null ? null : allAvailableAmount,
        "ticket_email_text": ticketEmailText == null ? null : ticketEmailText,
        "status": status == null ? null : status,
      };
}
