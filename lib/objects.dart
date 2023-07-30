class User {}

class WellnessEntry {
  String name = "";
  String datetime = "";
  String id = "";

  WellnessEntry(String _id, String _name, String _datetime) {
    this.id = _id;
    this.name = _name;
    this.datetime = _datetime;
  }

  static WellnessEntry empty() {
    return WellnessEntry("", "", "");
  }

  @override
  String toString() {
    return "$datetime - $name";
  }
}

class GuideObj {
  int id = 0;
  String title = "";
  String body = "";
  String type = "";
  List<GuideEntryObj> entries = [];

  GuideObj(int _id, String _title, String _body, String _type) {
    this.id = _id;
    this.title = _title;
    this.body = _body;
    this.type = _type;
    this.entries = [];
  }

  static GuideObj empty() {
    return GuideObj(0, "", "", "");
  }

  @override
  String toString() {
    return title;
  }

  static GuideObj fromJson(Map<String, dynamic> json) {
    final int theid = parseInteger(json['id']) ?? 0;
    GuideObj go = GuideObj(theid, json['title'].toString(),
        json['body'].toString(), json['type'].toString());
    if (!json['entries'].isEmpty) {
      List<dynamic> inputList = json['entries'];
      List<GuideEntryObj> processed =
          inputList.map((en) => GuideEntryObj.fromJson(en)).toList();
      go.entries = processed;
    }
    return go;
  }
}

class GuideEntryObj {
  int id = 0;
  String name = "";
  String description = "";
  String qrcode = "";
  String location = "";

  GuideEntryObj(int _id, String _name, String _description, String _qrcode,
      String _location) {
    this.id = _id;
    this.name = _name;
    this.description = _description;
    this.qrcode = _qrcode;
    this.location = _location;
  }

  static GuideEntryObj empty() {
    return GuideEntryObj(0, "", "", "", "");
  }

  @override
  String toString() {
    return name;
  }

  static GuideEntryObj fromJson(Map<String, dynamic> json) {
    final int theid = parseInteger(json['id']) ?? 0;
    return GuideEntryObj(
        theid,
        json['name'].toString(),
        json['description'].toString(),
        json['qrcode'].toString(),
        json['location'].toString());
  }
}

int? parseInteger(dynamic value) {
  if (value is int) {
    return value;
  }

  if (value is String) {
    try {
      return int.parse(value);
    } catch (e) {
      print('Could not parse the string into an integer: $e');
    }
  }

  return null; // Return null or some default value if parsing fails
}
