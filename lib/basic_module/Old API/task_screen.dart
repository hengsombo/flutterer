
import 'package:flutter/material.dart';
import 'post_model.dart';
import 'post_service.dart';

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
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Hello"),
                ),
              );
            },
            icon: Icon(Icons.share),
          ),
        ],
      ),
      drawer: Drawer(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: FutureBuilder<List<PostModel>>(
        future: PostService.getOnlineData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error.toString()}");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return _buildListView(snapshot.data ?? []);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  // Widget _buildOutput(String? data) {
  //   if (data == null) {
  //     return Icon(Icons.error);
  //   }

    // List list = json.decode(data);
    // List<PostModel> records = list.map((x) => PostModel.fromMap(x)).toList();

  //   return _buildListView(records);
  // }

  Widget _buildListView(List<PostModel> records) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: records.length,
      itemBuilder: (context, index) {
        return _buildItem(records[index]);
      },
    );
  }

  Widget _buildItem(PostModel post) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.face),
        title: Text(post.title),
        subtitle: Text("${post.body}"),
        trailing: Text("${post.userId}"),
      ),
    );
  }
}