
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class MainKhmerMenu extends StatefulWidget {
  const MainKhmerMenu({super.key});

  @override
  State<MainKhmerMenu> createState() => _MainKhmerMenuState();
}

class _MainKhmerMenuSate extends State<MainKhmerMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Digital Menu"),
      ),
      body: _buildBody(),
    );
  }
}

Future<String> _getOnlineData() async {
  String url = "https://localhost:4000";
  http.Response response = await http.get(Uri.parse(url));
  return response.body;
}

Widget _buildBody() {
  return _buildBody();
}
