import 'package:flutter/material.dart';
import 'package:world_countries/data/models/country_model.dart';
import 'package:world_countries/data/repository/country_repo.dart';

class CountryProvider extends ChangeNotifier {
  List<Country> _countries = [];
  bool _isLoading = false;
  String _errorMessage = "";

  List<Country> get countries => _countries;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCountries() async {
    try {
      _isLoading = true;
      _countries = await CountryRepository().getCountries('all');
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
