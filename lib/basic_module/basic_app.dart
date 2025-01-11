

import 'package:flutter/material.dart';
import 'package:flutter_application_1/basic_module/theme_logic.dart';
import 'package:provider/provider.dart';

import 'counter_logic.dart';
import 'simple_state_screen.dart';
import 'language_logic.dart';


Widget providerBasicApp() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CounterLogic()),
      ChangeNotifierProvider(create: (context) => ThemeLogic()),
      ChangeNotifierProvider(create: (context) => LanguageLogic())

    ],
    child: BasicApp(),
  );
}
class BasicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //bool dark = context.watch<ThemeLogic>().dark;
    ThemeMode mode = context.watch<ThemeLogic>().mode;

    Color lightColor = Color.fromARGB(255, 22, 103, 8);
    Color darkColor = Colors.blueGrey.shade900;

    double size = context.watch<CounterLogic>().counter.toDouble();

    return MaterialApp(
      home: SimpleStateScreen(),
      themeMode: mode, // ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(//theme data
        brightness: Brightness.light,
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 18 + size),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: darkColor,
          foregroundColor: Colors.white,
        ),
        drawerTheme: DrawerThemeData(backgroundColor: lightColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: lightColor,
          foregroundColor: Colors.white,
        )),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          foregroundColor: lightColor,
          side: BorderSide(color: lightColor),
        )),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
          textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 18 + size),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: darkColor,
          foregroundColor: Colors.white,
        ),
        drawerTheme: DrawerThemeData(backgroundColor: darkColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade800,
          foregroundColor: Colors.white,
        )),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.white),
        )),
      ),
    );
  }
}
