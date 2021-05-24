import 'dart:convert';

TicketModel ticketModelFromJson(String str) =>
    TicketModel.fromJson(json.decode(str));

String ticketModelToJson(TicketModel data) => json.encode(data.toJson());

class TicketModel {
  TicketModel({
    this.data,
    this.totalTicketCount,
    this.pagination,
  });

  List<DatumData> data;
  int totalTicketCount;
  Pagination pagination;

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        data: List<DatumData>.from(
            json["data"].map((x) => DatumData.fromJson(x))),
        totalTicketCount: json["total_ticket_count"],
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total_ticket_count": totalTicketCount,
        "pagination": pagination.toJson(),
      };
}

class DatumData {
  DatumData({
    this.id,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.agentInfo,
    this.creator,
    this.event,
    this.status,
    this.tickets,
  });

  String id;
  String price;
  DateTime createdAt;
  DateTime updatedAt;
  String agentInfo;
  Creator creator;
  Event event;
  Status status;
  List<Ticket> tickets;

  factory DatumData.fromJson(Map<String, dynamic> json) => DatumData(
        id: json["id"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        agentInfo: json["agent_info"] == null ? null : json["agent_info"],
        creator: Creator.fromJson(json["creator"]),
        event: Event.fromJson(json["event"]),
        status: Status.fromJson(json["status"]),
        tickets:
            List<Ticket>.from(json["tickets"].map((x) => Ticket.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "agent_info": agentInfo == null ? null : agentInfo,
        "creator": creator.toJson(),
        "event": event.toJson(),
        "status": status.toJson(),
        "tickets": List<dynamic>.from(tickets.map((x) => x.toJson())),
      };
}

class Creator {
  Creator({
    this.firstName,
    this.email,
    this.telephoneFullNumber,
  });

  String firstName;
  String email;
  String telephoneFullNumber;

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        // firstName: json["first_name"] == null ? "null" : json["first_name"],
        email: json["email"],
        telephoneFullNumber: json["telephone_full_number"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName == null ? null : firstName,
        "email": emailValues.reverse[email],
        "telephone_full_number":
            telephoneFullNumberValues.reverse[telephoneFullNumber],
      };
}

enum Email { ASDASD_ASD_ASD, RTEADMIN_GMAIL_COM }

final emailValues = EnumValues({
  "asdasd@asd.asd": Email.ASDASD_ASD_ASD,
  "rteadmin@gmail.com": Email.RTEADMIN_GMAIL_COM
});

enum TelephoneFullNumber { THE_380111111111, EMPTY, THE_380980346408 }

final telephoneFullNumberValues = EnumValues({
  "": TelephoneFullNumber.EMPTY,
  "380111111111": TelephoneFullNumber.THE_380111111111,
  "380980346408": TelephoneFullNumber.THE_380980346408
});

class Event {
  Event({
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
    this.owner,
    //  this.setting,
    this.logoUrl,
    this.logoType,
    //   this.subwayStation,
    this.locationName,
    this.createdAt,
    this.updatedAt,
    this.fillStep,
    this.statistics,
    this.finances,
  });

  int id;
  String title;
  String description;
  String address;
  String addressLat;
  String addressLng;
  DateTime registrationStart;
  DateTime registrationEnd;
  DateTime eventStart;
  DateTime eventEnd;
  Creator owner;
//  Setting setting;
  String logoUrl;
  String logoType;
  // String subwayStation;
  String locationName;
  DateTime createdAt;
  DateTime updatedAt;
  FillStep fillStep;
  List<dynamic> statistics;
  List<dynamic> finances;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
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
        owner: Creator.fromJson(json["owner"]),
        //  setting: Setting.fromJson(json["setting"]),
        logoUrl: json["logo"],
        logoType: json["logo_type"],
        //    subwayStation: json["subway_station"],
        locationName: json["location_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        fillStep: FillStep.fromJson(json["fill_step"]),
        statistics: List<dynamic>.from(json["statistics"].map((x) => x)),
        finances: List<dynamic>.from(json["finances"].map((x) => x)),
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
        "owner": owner.toJson(),
        //  "setting": setting.toJson(),
        "logo": logoUrl,
        "logo_type": logoType,
        //   "subway_station": subwayStation,
        "location_name": locationName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "fill_step": fillStep.toJson(),
        "statistics": List<dynamic>.from(statistics.map((x) => x)),
        "finances": List<dynamic>.from(finances.map((x) => x)),
      };
}

class FillStep {
  FillStep({
    this.id,
    this.mainSettingStep,
    this.ticketSchemaStep,
    this.mailTestStep,
    this.registerFormStep,
    this.siteEventStep,
    this.paymentMethodStep,
    this.eventId,
    this.createdAt,
    this.updatedAt,
    this.promoCodesStep,
    this.streamingLinksStep,
  });

  int id;
  int mainSettingStep;
  int ticketSchemaStep;
  int mailTestStep;
  int registerFormStep;
  int siteEventStep;
  int paymentMethodStep;
  int eventId;
  DateTime createdAt;
  DateTime updatedAt;
  int promoCodesStep;
  int streamingLinksStep;

  factory FillStep.fromJson(Map<String, dynamic> json) => FillStep(
        id: json["id"],
        mainSettingStep: json["main_setting_step"],
        ticketSchemaStep: json["ticket_schema_step"],
        mailTestStep: json["mail_test_step"],
        registerFormStep: json["register_form_step"],
        siteEventStep: json["site_event_step"],
        paymentMethodStep: json["payment_method_step"],
        eventId: json["event_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        promoCodesStep: json["promo_codes_step"],
        streamingLinksStep: json["streaming_links_step"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main_setting_step": mainSettingStep,
        "ticket_schema_step": ticketSchemaStep,
        "mail_test_step": mailTestStep,
        "register_form_step": registerFormStep,
        "site_event_step": siteEventStep,
        "payment_method_step": paymentMethodStep,
        "event_id": eventId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "promo_codes_step": promoCodesStep,
        "streaming_links_step": streamingLinksStep,
      };
}

class Setting {
  Setting({
    this.status,
    this.category,
    this.subject,
    this.recountCurrency,
    this.paymentCurrency,
    // this.checkIn,
    this.language,
    this.country,
    this.fixCommission,
    this.percentCommission,
    this.selfSystemCommissionIncludedPayment,
    this.paymentSystemCommissionIncludedPayment,
    this.paymentActivated,
    this.ticketDescriptionTop,
    this.ticketDescriptionBottom,
    this.contactEmail,
    this.isContactEmailVerified,
    this.contactPhone,
    this.contactName,
    this.offerText,
    this.affiliateText,
    this.registrationFirstStepText,
    this.ticketWithText,
    this.onlineText,
    this.eventUrl,
    this.fbLinkGroup,
    this.availableDuplicateContacts,
    this.useTicketSchemaEmails,
  });

  Status status;
  Category category;
  Subject subject;
  dynamic recountCurrency;
  Language paymentCurrency;
  // CheckIn checkIn;
  Language language;
  Country country;
  dynamic fixCommission;
  String percentCommission;
  bool selfSystemCommissionIncludedPayment;
  bool paymentSystemCommissionIncludedPayment;
  bool paymentActivated;
  String ticketDescriptionTop;
  String ticketDescriptionBottom;
  String contactEmail;
  int isContactEmailVerified;
  String contactPhone;
  String contactName;
  String offerText;
  dynamic affiliateText;
  String registrationFirstStepText;
  String ticketWithText;
  dynamic onlineText;
  String eventUrl;
  String fbLinkGroup;
  int availableDuplicateContacts;
  int useTicketSchemaEmails;

  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
        status: Status.fromJson(json["status"]),
        category: Category.fromJson(json["category"]),
        subject: Subject.fromJson(json["subject"]),
        recountCurrency: json["recount_currency"],
        paymentCurrency: Language.fromJson(json["payment_currency"]),
        /*  checkIn: json["check_in"] == null
            ? null
            : CheckIn.fromJson(json["check_in"]),*/
        language: Language.fromJson(json["language"]),
        country: Country.fromJson(json["country"]),
        fixCommission: json["fix_commission"],
        percentCommission: json["percent_commission"] == null
            ? null
            : json["percent_commission"],
        selfSystemCommissionIncludedPayment:
            json["self_system_commission_included_payment"],
        paymentSystemCommissionIncludedPayment:
            json["payment_system_commission_included_payment"],
        paymentActivated: json["payment_activated"],
        ticketDescriptionTop: json["ticket_description_top"],
        ticketDescriptionBottom: json["ticket_description_bottom"],
        contactEmail:
            json["contact_email"] == null ? null : json["contact_email"],
        isContactEmailVerified: json["is_contact_email_verified"],
        contactPhone:
            json["contact_phone"] == null ? null : json["contact_phone"],
        contactName: json["contact_name"] == null ? null : json["contact_name"],
        offerText: json["offer_text"] == null ? null : json["offer_text"],
        affiliateText: json["affiliate_text"],
        registrationFirstStepText: json["registration_first_step_text"],
        ticketWithText:
            json["ticket_with_text"] == null ? null : json["ticket_with_text"],
        onlineText: json["online_text"],
        eventUrl: json["event_url"],
        fbLinkGroup: json["fb_link_group"],
        availableDuplicateContacts: json["available_duplicate_contacts"],
        useTicketSchemaEmails: json["use_ticket_schema_emails"],
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "category": category.toJson(),
        "subject": subject.toJson(),
        "recount_currency": recountCurrency,
        "payment_currency": paymentCurrency.toJson(),
        //  "check_in": checkIn == null ? null : checkIn.toJson(),
        "language": language.toJson(),
        "country": country.toJson(),
        "fix_commission": fixCommission,
        "percent_commission":
            percentCommission == null ? null : percentCommission,
        "self_system_commission_included_payment":
            selfSystemCommissionIncludedPayment,
        "payment_system_commission_included_payment":
            paymentSystemCommissionIncludedPayment,
        "payment_activated": paymentActivated,
        "ticket_description_top": ticketDescriptionTop,
        "ticket_description_bottom": ticketDescriptionBottom,
        "contact_email": contactEmail == null ? null : contactEmail,
        "is_contact_email_verified": isContactEmailVerified,
        "contact_phone": contactPhone == null ? null : contactPhone,
        "contact_name": contactName == null ? null : contactName,
        "offer_text": offerText == null ? null : offerText,
        "affiliate_text": affiliateText,
        "registration_first_step_text": registrationFirstStepText,
        "ticket_with_text": ticketWithText == null ? null : ticketWithText,
        "online_text": onlineText,
        "event_url": eventUrl,
        "fb_link_group": fbLinkGroup,
        "available_duplicate_contacts": availableDuplicateContacts,
        "use_ticket_schema_emails": useTicketSchemaEmails,
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.category,
  });

  int id;
  String name;
  String category;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
      };
}

class Country {
  Country({
    this.id,
    this.name,
    this.country,
    this.isoCode,
    this.languages,
    this.currencies,
  });

  int id;
  String name;
  String country;
  String isoCode;
  List<Language> languages;
  List<Language> currencies;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        isoCode: json["iso_code"],
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
        currencies: List<Language>.from(
            json["currencies"].map((x) => Language.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "iso_code": isoCode,
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
        "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
      };
}

class Language {
  Language({
    this.id,
    this.name,
    this.currency,
    this.isoCode,
    this.language,
  });

  int id;
  String name;
  String currency;
  String isoCode;
  String language;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        name: json["name"],
        currency: json["currency"] == null ? null : json["currency"],
        isoCode: json["iso_code"],
        language: json["language"] == null ? null : json["language"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "currency": currency == null ? null : currency,
        "iso_code": isoCode,
        "language": language == null ? null : language,
      };
}

class Status {
  Status({
    this.id,
    this.name,
    this.status,
  });

  int id;
  String name;
  String status;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        name: json["name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
      };
}

class Subject {
  Subject({
    this.id,
    this.name,
    this.subject,
  });

  int id;
  String name;
  String subject;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        name: json["name"],
        subject: json["subject"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "subject": subject,
      };
}

class Ticket {
  Ticket({
    this.id,
    this.hash,
    this.order,
    this.schema,
    this.holder,
    this.price,
    this.createdAt,
    this.updatedAt,
    //  this.checkIn,
  });

  int id;
  String hash;
  Order order;
  Schema schema;
  Holder holder;
  String price;
  DateTime createdAt;
  DateTime updatedAt;
  // List<dynamic> checkIn;

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: json["id"],
        hash: json["hash"],
        order: Order.fromJson(json["order"]),
        schema: Schema.fromJson(json["schema"]),
        holder: Holder.fromJson(json["holder"]),
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        //  checkIn: List<dynamic>.from(json["check_in"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        //  "id": id,
        //  "hash": hash,
        // "order": order.toJson(),
        //  "schema": schema.toJson(),
        "holder": holder.toJson(),
        //   "price": price,
        //   "created_at": createdAt.toIso8601String(),
        //   "updated_at": updatedAt.toIso8601String(),
        //  "check_in": List<dynamic>.from(checkIn.map((x) => x)),
      };
}

class Holder {
  Holder({
    this.id,
    this.firstName,
    this.lastName,
    this.telephoneCode,
    this.telephoneNumber,
    this.telephoneFullNumber,
    this.email,
    this.company,
    this.position,
    this.profileImage1,
    this.profileImage2,
    this.profileImage3,
    this.fbLink,
    this.tgLink,
    this.myBenefit,
    this.viberLink,
    this.searchPurpose,
    this.promocode,
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
  String profileImage1;
  dynamic profileImage2;
  dynamic profileImage3;
  String fbLink;
  String tgLink;
  String myBenefit;
  String viberLink;
  String searchPurpose;
  dynamic promocode;

  factory Holder.fromJson(Map<String, dynamic> json) => Holder(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        telephoneCode:
            json["telephone_code"] == null ? "" : json["telephone_code"],
        telephoneNumber:
            json["telephone_number"] == null ? "" : json["telephone_number"],
        telephoneFullNumber: json["telephone_full_number"],
        email: json["email"] == null ? '' : json["email"],
        company: json["company"] == null ? "" : json["company"],
        position: json["position"] == null ? "" : json["position"],
        profileImage1:
            json["profile_image1"] == null ? "" : json["profile_image1"],
        profileImage2: json["profile_image2"],
        profileImage3: json["profile_image3"],
        fbLink: json["fb_link"] == null ? "" : json["fb_link"],
        tgLink: json["tg_link"] == null ? "" : json["tg_link"],
        myBenefit: json["my_benefit"] == null ? "" : json["my_benefit"],
        viberLink: json["viber_link"] == null ? "" : json["viber_link"],
        searchPurpose:
            json["search_purpose"] == null ? "" : json["search_purpose"],
        promocode: json["promocode"],
      );

  Map<String, dynamic> toJson() => {
        //  "id": id,
        "first_name": firstName,
        "last_name": lastName,
        //    "telephone_code": telephoneCode == null ? "" : telephoneCode,
        //    "telephone_number": telephoneNumber == null ? "" : telephoneNumber,
        "telephone_full_number": telephoneFullNumber,
        "email": email,
        "company": company == null ? "" : company,
        "position": position == null ? "" : position,
        //   "profile_image1": profileImage1 == null ? "" : profileImage1,
        //   "profile_image2": profileImage2,
        //    "profile_image3": profileImage3,
        //   "fb_link": fbLink == null ? "" : fbLink,
        //   "tg_link": tgLink == null ? "" : tgLink,
        //     "my_benefit": myBenefit == null ? "" : myBenefit,
        //      "viber_link": viberLink == null ? "" : viberLink,
        //     "search_purpose": searchPurpose == null ? "" : searchPurpose,
        //     "promocode": promocode,
      };
}

class Order {
  Order({
    this.id,
    this.hash,
    this.eventId,
    this.price,
    this.createdAt,
    this.updatedAt,
    //  this.creator,
    this.status,
  });

  int id;
  String hash;
  int eventId;
  String price;
  DateTime createdAt;
  DateTime updatedAt;
  // Creator creator;
  Status status;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        hash: json["hash"],
        eventId: json["event_id"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        // creator: Creator.fromJson(json["creator"]),
        status: Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hash": hash,
        "event_id": eventId,
        "price": price,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        //  "creator": creator.toJson(),
        "status": status.toJson(),
      };
}

class Schema {
  Schema({
    this.id,
    this.title,
    this.description,
    this.typeId,
  });

  int id;
  String title;
  String description;
  int typeId;

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        typeId: json["type_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "type_id": typeId,
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
  String perPage;

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
