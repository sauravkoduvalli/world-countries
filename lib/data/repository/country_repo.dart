import 'package:world_countries/services/api/api_service.dart';

import '../models/country_model.dart';

class CountryRepository {
  Future<Country> getCountries(String endpoint) async {
    try {
      final response = await ApiService.get(endpoint);
      return Country.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }
}
