import 'dart:convert';
import 'package:http/http.dart' as http;


class UserInfo
{
  String userName;
  UserInfo({
    required this.userName,

  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      userName: json['name'],
      // add other properties here, if necessary
    );
  }
}




Future<UserInfo> fetchUser(String userId) async {
  final response = await http.get(Uri.parse('http://your-api-url.com/users/$userId'));

  if (response.statusCode == 200) {
    return UserInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to fetch user');
  }
}
