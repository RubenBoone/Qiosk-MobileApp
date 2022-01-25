class UserLogin {
  int userID;
  String email;
  String password;
  bool isActive; 
  bool isAdmin;
  String token;

  UserLogin({required this.userID, required this.email,this.password="",required this.isActive,required this.isAdmin,required this.token});
  
  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
      userID: json['userID'],
      email: json['email'],
      isActive: json['isActive'],
      isAdmin: json ['isAdmin'],
      token: json['token']
    );
  }

  Map<String, dynamic> toJson() =>
    {
      'userID':userID,
      'email': email,
      'password': password,
      'isActive': isActive,
      'isAdmin': isAdmin,
      'token': token
    };
}