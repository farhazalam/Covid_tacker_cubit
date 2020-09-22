import 'dart:io';

import 'package:covid_tracker/Model/Country.dart';
import 'package:dio/dio.dart';

abstract class CountryRepository {
  Future<Country> fetchCountryData();
}

class CountryRepositoryImplementation implements CountryRepository {
  @override
  Future<Country> fetchCountryData() async {
    try {
      final r = await InternetAddress.lookup('google.com');
      if (r.isNotEmpty && r[0].rawAddress.isNotEmpty) {
        Response response =
            await Dio().get("https://api.covid19india.org/data.json");

        Country country = Country.fromJson(response.data);
        return country;
      }
      return null;
    } on SocketException catch (_) {
      return null;
    }
  }
}

class NetworkException implements Exception {}
