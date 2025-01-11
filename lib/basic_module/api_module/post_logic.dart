import 'package:flutter/material.dart';

import 'post_model.dart';
import 'post_service.dart';

class PostLogic extends ChangeNotifier{
  List<PostModel> _postList = [];
  List<PostModel> get postList => _postList;

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(){
    _loading = true;
    notifyListeners();
  }

  Future read() async{
    _postList = await PostService.getOnlineData();
    _loading = false;
    notifyListeners();
  }
}