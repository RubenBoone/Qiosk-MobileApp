class User {
  int userID;
  String name;
  String email;
  String password;
  bool isActive;
  bool isAdmin;
  int companyID;

  User(
      {required this.userID,
      required this.name,
      required this.email,
      required this.password,
      required this.isActive,
      required this.isAdmin,
      required this.companyID});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['userID'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      isActive: json['isActive'],
      isAdmin: json['isAdmin'],
      companyID: json['companyID']
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'isActive': isActive,
        'isAdmin': isAdmin,
        'companyID': companyID
      };
}
