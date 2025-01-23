import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/basic_module/movie_module1/movie_app.dart';
import 'package:flutter_application_1/basic_module/movie_module1/movie_logic.dart';
import 'package:provider/provider.dart';



Widget movieProvider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MovieLogic()),
    ],
    child: MovieApp(),
  );
}

