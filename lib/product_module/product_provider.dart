import 'package:flutter/material.dart';
import 'package:flutter_application_1/product_module/product_app.dart';
import 'package:flutter_application_1/product_module/product_logic.dart';
import 'package:provider/provider.dart';

Widget productProvider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProductLogic()),
    ],
    child: ProductApp(),
  );
}
