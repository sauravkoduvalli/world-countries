import 'package:world_countries/services/api/api_service.dart';

import '../models/country_model.dart';

class CountryRepository {
  // static const String baseUrl = 'https://restcountries.com/v3.1/';

  Future<List<Country>> getCountries(String endpoint) async {
    try {
      final response = await ApiService.get(endpoint);
      return countryFromJson(response);
    } catch (e) {
      throw Exception('Failed to load countries $e');
    }
  }
}
