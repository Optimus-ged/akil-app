import '../../../../dio/dio_services.dart';
import '../../../../dio/endpoints.dart';
import 'package:dio/dio.dart';

class CountriesProviders {
  static Future<Response<dynamic>> fetchCountries() async {
    final Response response = await DioService().request(
      HttpMethode.get,
      EndPoints.countries,
    );
    return response;
  }

  static Future<Response<dynamic>> searchCountry(String term) async {
    final Response response = await DioService().request(
      HttpMethode.get,
      "${EndPoints.searchCountry}/$term?fields=name,flags,population,cca2,capital",
    );
    return response;
  }

  static Future<Response<dynamic>> searchDetails(String code) async {
    final Response response = await DioService().request(
      HttpMethode.get,
      "${EndPoints.fetchDetails}/$code?fields=name,flags,population,capital,region,subregion,area,timezones",
    );
    return response;
  }
}
