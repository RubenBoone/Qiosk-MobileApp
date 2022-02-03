class Kiosk {
  int kioskID;
  String name;
  String description;
  String coordinate;

  Kiosk(
      {required this.kioskID,
      required this.name,
      required this.description,
      required this.coordinate});

  factory Kiosk.fromJson(Map<String, dynamic> json) {
    return Kiosk(
        kioskID: json['kioskID'],
        name: json['name'],
        description: json['description'],
        coordinate: json['coordinate']);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'coordinate': coordinate,
      };
}
