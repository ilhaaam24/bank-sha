class UserEditFormModel {
  final String username;
  final String name;
  final String email;
  final String password;
  UserEditFormModel(
      {required this.username,
      required this.name,
      required this.email,
      required this.password});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'name': name,
      'email': email,
      'password': password
    };
  }
}
