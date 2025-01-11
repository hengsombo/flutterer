import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'post_model.dart';

class PostService {
  static Future<List<PostModel>> getOnlineData() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(Uri.parse(url));
    return compute(postModelFromJson, response.body);
  }
}
