import 'package:flutter/material.dart';
import 'package:flutter_application_1/basic_module/api_module/api_app.dart';
import 'package:flutter_application_1/basic_module/api_module/post_logic.dart';
import 'package:provider/provider.dart';

Widget providerApiApp() {
  return MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => PostLogic())],
    child: ApiSplashScreen(),
  );
}

class ApiSplashScreen extends StatelessWidget {
  const ApiSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<PostLogic>().read(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ApiApp();
        } else {
          return _buildLoadingScreen();
        }
      },
    );
  }

  Widget _buildLoadingScreen() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Icon(Icons.face, size: 100,),
        ),
      ),
    );
  }
}
