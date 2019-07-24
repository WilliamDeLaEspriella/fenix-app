import 'dart:convert';

Platform postFromJson(String str) {
  final jsonData = json.decode(str);
  return Platform.fromJson(jsonData);
}

String postToJson(Platform data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

List<Platform> allPostsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Platform>.from(jsonData.map((x) => Platform.fromJson(x)));
}

String allPostsToJson(List<Platform> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Platform {
  String fullName;
  String email;
  String token;
  String compania;
  String apiKey;
  Platform({this.fullName, this.email, this.token, this.compania, this.apiKey});

  factory Platform.fromJson(Map<String, dynamic> parsedJson) {
    return Platform(
        fullName: parsedJson['full_name'],
        email: parsedJson['email'],
        token: parsedJson['token'],
        compania: parsedJson['compania'],
        apiKey: parsedJson['api_key']);
  }

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "email": email,
        "token": token,
        "compania": compania,
        "api_key": apiKey
      };
}
