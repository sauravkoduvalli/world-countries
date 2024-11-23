import 'dart:convert';

import 'package:world_countries/data/dummy_data.dart';
import 'package:world_countries/services/api/api_service.dart';

import '../models/country_model.dart';
import 'package:http/http.dart' as http;

class CountryRepository {
  final _client = http.Client();
  static const String baseUrl = 'https://restcountries.com/v3.1/';
  Future<List<Country>> getCountries(String endpoint) async {
    try {
      final response = await ApiService.get(endpoint);
      return countryFromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Country>> fetchCountries(String endpoint) async {
    final url = Uri.parse(baseUrl + endpoint);
    try {
      final response = await _client.get(url);
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => Country.fromJson(item)).toList();
      } else {
        final List<Country> dummyData =
            data.map((item) => Country.fromJson(item)).toList();
        return dummyData;
      }
    } catch (error) {
      throw Exception('failed to fetch countries');
    }
  }
}
