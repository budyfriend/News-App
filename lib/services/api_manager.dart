import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api_flutter/constants/strings.dart';
import 'package:rest_api_flutter/models/newsinfo.dart';

class API_Manager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel = null;
    var response = await client.get(Strings.news_url);
    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exc) {
      return newsModel;
    }
    return newsModel;
  }
}
