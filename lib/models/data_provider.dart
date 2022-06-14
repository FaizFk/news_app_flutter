import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'news.dart';

class DataProvider {
  List<News> _newsList = [];

  Future<List<News>> get newsList async {
    var res = await http.get(
        Uri.parse("https://inshortsv2.vercel.app/news?type=all_news&limit=24"));
    var data = json.decode(res.body)['articles'];
    for (int i = 0; i < data.length; i++) {
      News news = News(
          title: data[i]['title'],
          description: data[i]['description'],
          image_url: data[i]['image_url']);
      _newsList.add(news);
    }
    print(_newsList);
    return [..._newsList];
  }
}
