import 'dart:convert';

import 'countries_provider.dart';
import 'models/country_model.dart';

class CountriesRepository {
  static Future<List<CountryData>> fetch() async {
    final response = await CountriesProviders.fetchCountries();
    return countriesFromJson(jsonEncode(response.data));
    // if (response.statusCode == 200) {
    //   return countriesFromJson(jsonEncode(response.data));
    // } else {
    //   throw Exception('Une erreur est survenue');
    // }
  }

  static Future<List<CountryData>> searchCountry(String term) async {
    final response = await CountriesProviders.searchCountry(term);
    if (response.statusCode == 200) {
      return countriesFromJson(jsonEncode(response.data));
    }else  if (response.statusCode == 404) {
      return [];
    } else {
      throw Exception('Une erreur est survenue');
    }
  }

  static Future<CountryData> searchDetails(String code) async {
    final response = await CountriesProviders.searchDetails(code);
    if (response.statusCode == 200) {
      return countryDataFromJson(jsonEncode(response.data));
    } else {
      throw Exception('Une erreur est survenue');
    }
  }
}
