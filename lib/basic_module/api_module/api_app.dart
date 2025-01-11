import 'package:flutter/material.dart';
import 'package:flutter_application_1/basic_module/api_module/task_screen.dart';

class ApiApp extends StatelessWidget {
  const ApiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskScreen(),
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      )),
    );
  }
}
