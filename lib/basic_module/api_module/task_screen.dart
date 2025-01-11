import 'dart:convert';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Screen"),
      ),
      body: _buildBody(),
    );
  }

  Future<String> _getOnlineData() async {
    String url =
        "https://fakestoreapi.com/products"; //"https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(Uri.parse(url));
    return response.body;
  }

  Future<String> _readFakeData() {
    return Future.delayed(
      Duration(seconds: 5),
      () {
        return "Some News";
      },
    );
  }

  Widget _buildBody() {
    return Center(
      child: FutureBuilder<String>(
        future: _getOnlineData(),
        builder: (context, snapshot) {
          //controll error, no internet connection
          if (snapshot.hasError) {
            return Text("${snapshot.error.toString()}");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return _buildOutput(snapshot.data!);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _buildOutput(String? data) {
    if (data == null) {
      return Icon(Icons.error);
    }
    List list = json.decode(data);
    List<Map<String, dynamic>> records =
        list.map((x) => x as Map<String, dynamic>).toList();

    return _buildListView(records);
  }

  Widget _buildListView(List<Map<String, dynamic>> records) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: records.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> item = records[index];
          return _buildItem(item);
        });
  }

  Widget _buildItem(Map<String, dynamic> item) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.face_2),
        title: Text("${item['title']}"),
        subtitle: Text("${item['body']}"),
        
        
      ),
    );
  }
}
