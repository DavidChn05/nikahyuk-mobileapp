class UserModel {
  final String? id;
  final String fullname;
  final String email;
  final String password;

  const UserModel(
      {this.id,
      required this.fullname,
      required this.email,
      required this.password});

  toJson() {
    return {
      "FullName": fullname,
      "Email": email,
      "Password": password,
    };
  }
}
