import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:app/config.dart';

class FetchDataService {
  FetchDataService._privateConstructor();
  static final FetchDataService _instance =
      FetchDataService._privateConstructor();

  factory FetchDataService() {
    return _instance;
  }
  static const tkn = apiTkn;
  static final dio = Dio();

  Future<dynamic> fetchAppVersion() async {
    dynamic data;
    Map<String, String> q = {};
    const String str = "app-version";
    Uri uri = Uri.https(baseUri, apiEndpoint + str, q);
    var response =
        await dio.get(uri.toString(), options: Options(headers: {"tkn": tkn}));
    if (response.statusCode == 200) {
      data = response.data;
    } else {
      throw Exception('Failed to load data');
    }
    return data;
  }
}
