import 'package:http/http.dart';
import 'package:flutter/material.dart';

class Parser {

  static void getData() async {
    String url = "https://www.google.ru/search?newwindow=1&q=xss&tbm=isch";

    List<String> url_list = [];

    Uri uri = Uri.parse(url);
    // RegExp exp = RegExp("img");
    var response = await get(
        uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8'
        }
    );
    
    // var t = exp.firstMatch(response.body);
    // print(t![0]);
    print(response.body.toString()[response.body.toString().indexOf("src")]);
  }
}