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
