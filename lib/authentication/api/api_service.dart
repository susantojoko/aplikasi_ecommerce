import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    final apiUrl = Uri.parse('http://192.168.2.28:3000/api/users/login');
    final response = await http.post(
      apiUrl,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    final data = json.decode(response.body);
    return data;
  }

  static Future<Map<String, dynamic>> signup(
      String email, String name, String password) async {
    final apiUrl = Uri.parse('http://localhost:3000/api/users');
    final response = await http.post(
      apiUrl,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    final data = json.decode(response.body);
    return data;
  }

  static Future<List<Map<String, dynamic>>?> getProducts() async {
    final apiUrl = Uri.parse('http://localhost:3000/api/products');
    try {
      final response = await http.get(apiUrl);
      final productse = json.decode(response.body);
      return productse;
    } catch (e) {
      return null;
    }
  }
}
