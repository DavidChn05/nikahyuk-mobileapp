import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullname;
  final String email;
  final String password;

  const UserModel({
    this.id,
    required this.fullname,
    required this.email,
    required this.password,
  });

  toJson() {
    return {
      "FullName": fullname,
      "Email": email,
      "Password": password,
    };
  }

  /// Map user fetched from firebase to UserModel
  factory UserModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      fullname: data["FullName"],
      email: data["Email"],
      password: data["Password"],
    );
  }
}
