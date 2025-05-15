import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final String baseUrl =
      'http://localhost:5000/api/auth'; // Ganti dengan URL backend Anda jika diperlukan

  // Fungsi untuk register
  Future<Map<String, dynamic>> register(
    String name,
    String email,
    String password,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'name': name, 'email': email, 'password': password}),
      );

      if (response.statusCode == 201) {
        return json.decode(response.body); // Return the decoded response
      } else {
        throw Exception('Failed to register: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
      return {'message': 'Error: $e'};
    }
  }

  // Fungsi untuk login
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body); // Return the decoded response
      } else {
        throw Exception('Failed to login: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
      return {'message': 'Error: $e'};
    }
  }
}
