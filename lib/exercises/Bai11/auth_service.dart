import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static String _buildUrl(String path) {
    const base = 'https://dummyjson.com';
    if (kIsWeb) {
      // ⚠️ Nếu chạy Web, có thể cần proxy CORS
      return '$base$path';
    }
    return '$base$path';
  }

  // ================= LOGIN =================
  static Future<String> login(String username, String password) async {
    final uri = Uri.parse(_buildUrl('/auth/login'));

    final resp = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body);
      return data['token'];
    } else {
      final data = jsonDecode(resp.body);
      throw Exception(data['message'] ?? 'Đăng nhập thất bại');
    }
  }

  // ================= PROFILE =================
  static Future<Map<String, dynamic>> getProfile(String token) async {
    final uri = Uri.parse(_buildUrl('/auth/me'));

    final resp = await http.get(
      uri,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (resp.statusCode == 200) {
      return jsonDecode(resp.body);
    } else {
      throw Exception('Không lấy được thông tin người dùng');
    }
  }
}
