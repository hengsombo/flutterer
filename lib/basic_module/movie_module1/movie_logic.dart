import 'package:flutter/material.dart';

import 'movie_model.dart';
import 'movie_service.dart';

class MovieLogic extends ChangeNotifier {
  List<MovieModel> _movieList = [];
  List<MovieModel> get movieList => _movieList;

  bool _loading = false;
  bool get loading => _loading;

  Object? _error;
  Object? get error => _error;

  void setLoading() {
    _loading = true;
    notifyListeners();
  }

  Future read() async{
    await MovieService.read(
      onRes: (items)  async{
        _movieList = await items;
        _loading = false;
        notifyListeners();
      },
      onError: (err) {
        _error = err;
        _loading = false;
        notifyListeners();
      },
    );
  }
}
