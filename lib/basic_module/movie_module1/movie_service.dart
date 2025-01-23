import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'movie_model.dart';

class MovieService {
  static.Future read({
    required Function(Future<List<MovieModel>>) onRes,
    required Function(Object?) onError,
  }) async {
    String url = "http://www.omdbapi.com/?apikey=211bf360&s=fast+furious";
    try {
      http.Response response = await http.get(Uri.parse(url));
      final data = compute((movieModelFromJson, response.body);
      onRes(data);
      onError(null);
    } catch(e) {
      onError(e);
    }


  }
}


