class LoadDopModel {
  LoadDopModel({
    this.data,
    this.totalGroups,
    this.pagination,
  });

  List<Datum> data;
  int totalGroups;
  List<dynamic> pagination;

  factory LoadDopModel.fromJson(Map<String, dynamic> json) => LoadDopModel(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        totalGroups: json["total_groups"] == null ? null : json["total_groups"],
        pagination: json["pagination"] == null
            ? null
            : List<dynamic>.from(json["pagination"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "total_groups": totalGroups == null ? null : totalGroups,
        "pagination": pagination == null
            ? null
            : List<dynamic>.from(pagination.map((x) => x)),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.title,
    this.url,
    this.file,
    this.description,
  });

  int id;
  String name;
  dynamic title;
  dynamic url;
  String file;
  dynamic description;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        title: json["title"],
        url: json["url"],
        file: json["file"] == null ? null : json["file"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "title": title,
        "url": url,
        "file": file == null ? null : file,
        "description": description,
      };
}
