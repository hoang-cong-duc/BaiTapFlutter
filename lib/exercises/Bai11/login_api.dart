import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginApi {
  Future<int?> login(String username, String password) async {
    if (username.isNotEmpty && password.isNotEmpty) {
      return 1; 
    }
    return null;
  }

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
