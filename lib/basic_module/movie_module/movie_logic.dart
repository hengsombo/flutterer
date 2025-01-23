import 'package:flutter/material.dart';

import 'movie_model.dart';
import 'movie_service.dart';


class MovieLogic extends ChangeNotifier {
  List<Search> _records = [];
  List<Search> get records => _records;

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
      onRes: (value)  async{
        final data = await value;
        _records = data.search;
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
