class ContactDataBaseMaodel {
  int id;
  int _userId;

  ContactDataBaseMaodel(
    this._userId,
  );

  ContactDataBaseMaodel.map(dynamic obj) {
    this._userId = obj["userId"];
  }

  int get userId => _userId;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["userId"] = _userId;
    return map;
  }

  void setUserId(int id) {
    this.id = id;
  }
}
