import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  // initilaizing the base url as static variable
  static const String baseUrl = 'https://restcountries.com/v3.1/';

  static final _client = http.Client();

  static Future<dynamic> get(String endpoint) async {
    try {
      final url = Uri.parse(baseUrl + endpoint);
      final response = await _client.get(url);
      if (response.statusCode == 200) {
        final jsonData = response.body;
        return jsonDecode(jsonData);
      }
    } catch (error) {
      throw Exception('Get method exception');
    }
  }


  static Future<dynamic> post(
      String endpoint, Map<String, dynamic> body) async {
    try {
      final url = Uri.parse(baseUrl + endpoint);
      final response = await _client.post(
        url,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (error) {
      throw Exception('Post method exception');
    }
  }

  static Future<dynamic> put(String endpoint, Map<String, dynamic> body) async {
    try {
      final url = Uri.parse(baseUrl + endpoint);
      final response = await _client.put(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (error) {
      throw Exception('Put method exception');
    }
  }

  static Future<dynamic> delete(String endpoint) async {
    try {
      final url = Uri.parse(baseUrl + endpoint);
      final response = await _client.delete(url);
      if (response.statusCode == 204) {
        return jsonDecode(response.body);
      }
    } catch (error) {
      throw Exception('Delete method exception');
    }
  }
}
