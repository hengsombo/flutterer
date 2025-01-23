import 'package:flutter/material.dart';
import 'package:flutter_application_1/basic_module/random_user/product_app.dart';
import 'package:flutter_application_1/basic_module/random_user/random_user_logic.dart';
import 'package:provider/provider.dart';

Widget randomUserProvider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => RandomUserLogic()),
    ],
    child: ProductApp(),
  );
}
