import 'kiosk.dart';

class UserKiosk {
  int userKioskID;
  int userID;
  int kioskID;
  String begin;
  String end;

  UserKiosk({
    required this.userKioskID,
    required this.userID,
    required this.kioskID,
    required this.begin,
    required this.end,
  });

  factory UserKiosk.fromJson(Map<String, dynamic> json) {
    return UserKiosk(
        userKioskID: json['userKioskID'],
        userID: json['userID'],
        kioskID: json['kioskID'],
        end: json['end'],
        begin: json['begin']);
  }

  Map<String, dynamic> toJson() => {
        'userKioskID': userKioskID,
        'userID': userID,
        'kioskID': kioskID,
        'begin': begin,
        'end': end,
      };
}
