class UserModel {
  String? uId;
  String? name;
  String? email;
  String? phone;
  String? gender;

  UserModel({required this.uId,
      required this.name,
      required this.email,
      required this.phone,
      required this.gender,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
    };
  }
}
