import 'dart:convert';

import 'package:http/http.dart' as http;

// Post Method
class GetAvatar {
  late String name, job, createdAt;

  GetAvatar({required this.createdAt, required this.job, required this.name});

  static Future<GetAvatar> connectAPI(String name, String job) async {
    Uri url = Uri.parse("https://reqres.in/api/users");

    var hasilResponse = await http.post(
      url,
      body: {"name": name, "job": job},
    );

    var data = json.decode(hasilResponse.body);

    return GetAvatar(
      createdAt: data["createdAt"],
      job: data["job"],
      name: data["name"],
    );
  }
}

// Get Method
class GetAvatarGet {
  String id, avatar, fullname, email;

  GetAvatarGet(
      {required this.avatar,
      required this.id,
      required this.email,
      required this.fullname});

  static Future<GetAvatarGet> connectAPIGet(String id) async {
    var url = Uri.parse("https://reqres.in/api/users/$id");

    var hasilGet = await http.get(url);

    var data = (json.decode(hasilGet.body) as Map<String, dynamic>)["data"];

    return GetAvatarGet(
      id: data["id"].toString(),
      avatar: data["avatar"],
      fullname: data["first_name"],
      email: data["email"],
    );
  }
}
