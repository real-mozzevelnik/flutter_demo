import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:flutter/material.dart';

class SearchService {

  static final _dio = Dio();
  static String _url = "https://www.google.com/search?&hl=EN&tbm=isch&q=";

  static Future<List<String>> getData(String input) async {
    _url += input;

    List<String> urlList = [];
    final response = await _dio.get(
        _url,
        options: Options(
            headers: {"Accept": "application/json"}
        )
    );

    var doc = parse(response.data);

    final tags = [];
    tags.addAll(doc.getElementsByTagName("img").map((e) => e.outerHtml));
    RegExp exp = RegExp(r"https://\S+");
    for (int i = 0; i < tags.length; i++) {
      final match = exp.firstMatch(tags[i]);
      if (match != null) {
        urlList.add(match[0]!.split("\"")[0]);
      }
    }

    return urlList;
  }
}

