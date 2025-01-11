import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'post_model.dart';
import 'package:http/http.dart' as http;


class PostService {
  static Future<List<PostModel>> getOnlineData () async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(Uri.parse(url));
    return compute(_convert,response.body);
  }

  static List<PostModel> _convert(String body) {
    List list = json.decode(body);
    List<PostModel> records = list.map((x) => PostModel.fromMap(x)).toList();
    return records;
  }
}
