import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:html/parser.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';

class SearchService {

  static final _dio = Dio();
  static const String _url = "https://www.google.com/search?&hl=EN&tbm=isch&q=";


  static Future<List<String>> getData(String input) async {

    List<String> urlList = [];
    final response = await _dio.get(
        _url + input,
        options: Options(
            headers: {"Accept": "application/json"}
        )
    );

    var doc = parse(response.data);

    final tags = [];
    tags.addAll(doc
        .getElementsByTagName("img")
        .map((e) => e.outerHtml)
    );

    RegExp exp = RegExp(r"https://\S+");
    for (int i = 0; i < tags.length; i++) {
      final match = exp.firstMatch(tags[i]);
      if (match != null) {
        urlList.add(match[0]!.split("\"")[0]);
      }
    }

    return urlList;
  }


  static void saveImage(String path) async {
    Directory? save_dir = await getTemporaryDirectory();
    final temp_path = '${save_dir.path}/${const Uuid().v4()}.png';

    await _dio.download(path, temp_path);
    GallerySaver.saveImage(temp_path);
  }
}

