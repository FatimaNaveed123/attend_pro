class UserModel {
  final String? uid;
  String? fullName;
  final String? email;

  UserModel({
    required this.uid,
    required this.fullName,
    required this.email,
  });

  UserModel.fromMap(Map<String, dynamic> map)
      : uid = map['uid'],
        fullName = map['fullName'],
        email = map['email'];

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'email': email,
    };
  }
}
