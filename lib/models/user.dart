class User {
  int userID;
  String firstName;
  String lastName;
  String email;
  String? password;
  bool isActive;
  bool isAdmin;
  int companyID;

  User(
      {required this.userID,
      required this.firstName,
      required this.lastName,
      required this.email,
      this.password = "",
      required this.isActive,
      required this.isAdmin,
      required this.companyID});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userID: json['userID'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        password: json['password'],
        isActive: json['isActive'],
        isAdmin: json['isAdmin'],
        companyID: json['companyID']);
  }

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'isActive': isActive,
        'isAdmin': isAdmin,
        'companyID': companyID
      };
}
