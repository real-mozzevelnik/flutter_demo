import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:flutter/material.dart';

class Parser {

  static void getData() async {
    
    final dio = Dio();
    String url = "https://www.google.com/search?&hl=EN&tbm=isch&q=hello";

    List<String> url_list = [];
    final response = await dio.get(
        url,
        options: Options(
        headers: {"Accept":"application/json"}
      )
    );

    var doc = parse(response.data);

    final tags = [];
    tags.addAll(doc.getElementsByTagName("img").map((e) => e.outerHtml));
    RegExp exp = RegExp(r"https://\S+");
    for (int i = 0; i < tags.length; i++) {
      final match = exp.firstMatch(tags[i]);
      if (match != null) {
        url_list.add(match[0]!.split("\"")[0]);
      }
    }

    print(url_list);

  }
}

