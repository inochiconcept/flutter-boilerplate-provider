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

  Future<dynamic> fetchDataList() async {
    dynamic data;
    Map<String, String> q = {};
    const String str = "people";
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

  Future<dynamic> fetchDataItem(int id) async {
    dynamic data;
    Map<String, String> q = {};
    final String str = "people/$id";
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
