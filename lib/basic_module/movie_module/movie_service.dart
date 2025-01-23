import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'movie_model.dart';

class MovieService {
  static Future read({
    required Function(Future<MovieModel>) onRes,
    required Function(Object?) onError,
  }) async {
    String url = "http://www.omdbapi.com/?apikey=211bf360&s=horror";
    try {
      http.Response response = await http.get(Uri.parse(url));
      final data = compute(movieModelFromJson, response.body);
      onRes(data);
      onError(null);
    } catch (e) {
      onError(e);
    }
  }

  static Future search({
    required String movieTitle,
    required Function(Future<MovieModel>) onRes,
    required Function(Object?) onError,
  }
  ) async {
    String url = "http://www.omdbapi.com/?apikey=211bf360&s=$movieTitle&page=1";
    try {
      http.Response response = await http.get(Uri.parse(url));
      final data = compute((movieModelFromJson, response.body);
      onRes(data);
      onError(null);
    } catch(e){
      onError(e);
    }

  }
}
