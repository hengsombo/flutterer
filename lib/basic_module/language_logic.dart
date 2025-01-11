import 'package:flutter/material.dart';
import 'package:flutter_application_1/basic_module/language_data.dart';

class LanguageLogic extends ChangeNotifier {
  Language _lang = Khmer();
  Language get lang => _lang;
  int _langIndex = 0;
  int get langIndex => _langIndex;

  void changeToKhmer() {
    _lang = Khmer();
    _langIndex = 0;
    notifyListeners();
  }

  void changeToEnglish() {
    _lang = Language();
    _langIndex = 1;
    notifyListeners();
  }

  void changeToChinese() {
    _lang = Chinese();
    _langIndex = 2;
    notifyListeners();
  }
}
