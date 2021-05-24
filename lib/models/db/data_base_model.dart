class DataBaseMaodel {
  int id;
  String _type;
  int _eventId;
  int _posts;
  int _userId;

  DataBaseMaodel(
    this._type,
    this._eventId,
    this._posts,
    this._userId,
  );
  DataBaseMaodel.map(dynamic obj) {
    this._type = obj["type"];
    this._eventId = obj["eventId"];
    this._posts = obj["posts"];
    this._userId = obj["userId"];
  }

  String get type => _type;
  int get eventId => _eventId;
  int get posts => _posts;
  int get userId => _userId;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["type"] = _type;
    map["eventId"] = _eventId;
    map["posts"] = _posts;
    map["userId"] = _userId;

    return map;
  }

  void setUserId(int id) {
    this.id = id;
  }
}
