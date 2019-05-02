import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nyt_best_sellers/creds.dart';
import 'package:nyt_best_sellers/list_names_response.dart';
import 'package:nyt_best_sellers/lists_response.dart';

class Client {
  static const _HOST = "api.nytimes.com";
  static const _BASE_PATH = "svc/books/v3";
  static const _GET_LISTS_PATH = "$_BASE_PATH/lists.json";
  static const _GET_LIST_NAMES_PATH = "$_BASE_PATH/lists/names.json";

  Future<ListNamesResponse> getListNames() async {
    final response = await http.get(_buildUrl(_GET_LIST_NAMES_PATH, null));
    if (response.statusCode == 200) {
      return ListNamesResponse.fromJson(json.decode(response.body));
    }
    throw Exception();
  }

  Future<ListsResponse> getLists() async {
    final response = await http.get(_buildUrl(_GET_LISTS_PATH, null));
    if (response.statusCode == 200) {
      return ListsResponse.fromJson(json.decode(response.body));
    }
    throw Exception();
  }

  Uri _buildUrl(String path, Map<String, String> params) {
    var queryParam = {"api-key": API_TOKEN};
    if (params != null) {
      queryParam.addAll(params);
    }
    return Uri.https(_HOST, path, queryParam);
  }
}
