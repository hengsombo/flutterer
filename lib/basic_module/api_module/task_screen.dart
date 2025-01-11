import 'package:flutter/material.dart';
import 'package:flutter_application_1/basic_module/api_module/post_logic.dart';
import 'package:provider/provider.dart';
import 'post_model.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  
  final _scroller = ScrollController();
  bool _showUpButton = false;

  @override
  void initState() {
    super.initState();
    _scroller.addListener(_scrollListener);
  }

  _scrollListener() {
    setState(() {
      if (_scroller.hasClients && _scroller.position.pixels >= 1000) {
        _showUpButton = true;
      } else {
        _showUpButton = false;
      }
    });
  }

  @override
  void dispose() {
    _scroller.removeListener(_scrollListener);
    super.dispose();
  }

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
      floatingActionButton: _showUpButton ? _buildUpButton() : null,
    );
  }

  Widget _buildUpButton() {
    return FloatingActionButton(
      child: Icon(Icons.arrow_upward),
      onPressed: () {
        _scroller.animateTo(
          0.0,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  Widget _buildBody() {
    List<PostModel> postList = context.watch<PostLogic>().postList;
    bool loading = context.watch<PostLogic>().loading;

    if (loading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return _buildListView(postList);
    }
  }

  Widget _buildListView(List<PostModel> records) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<PostLogic>().setLoading();
        context.read<PostLogic>().read();
      },
      child: ListView.builder(
        controller: _scroller,
        physics: BouncingScrollPhysics(),
        itemCount: records.length,
        itemBuilder: (context, index) {
          return _buildItem(records[index]);
        },
      ),
    );
  }

  Widget _buildItem(PostModel post) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.face),
        title: Text(post.title),
        subtitle: Text("${post.body}"),
      ),
    );
  }
}
