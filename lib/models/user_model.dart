class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    firstName = json['firstName'] ?? '';
    lastName = json['lastName'] ?? '';
    email = json['email'] ?? '';
  }
}
