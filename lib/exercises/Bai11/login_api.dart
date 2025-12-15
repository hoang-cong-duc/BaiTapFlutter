import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginApi {
  /// GIẢ LẬP LOGIN
  Future<int?> login(String username, String password) async {
    if (username.isNotEmpty && password.isNotEmpty) {
      return 1; // userId giả (luôn tồn tại)
    }
    return null;
  }

  /// LẤY PROFILE THẬT
  Future<Map<String, dynamic>?> getUser(int id) async {
    final res = await http.get(
      Uri.parse('https://dummyjson.com/users/$id'),
    );

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    return null;
  }
}

final loginApi = LoginApi();
