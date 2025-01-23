import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'movie_logic.dart';
import 'movie_model.dart';
import 'movie_search_screen.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Screen"),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => MovieSearchScreen(),
                  ),
              );
            },
            icon: Icon.(Icons.search),
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  final _searchCtrl = TextEditingController();

  Widget _buildSearchBar (){
    return SearchBar(
      controller: _searchCtrl,
      hintText: "Search....",
      textInputAction: TextInputAction.search,
      trailing: [
        IconButton(
          onPressed:(){},
          icon: Icon(Icons.search),
          )
      ],
    );
  }
  


  Widget _buildBody() {
    Object? error = context.watch<MovieLogic>().error;
    bool loading = context.watch<MovieLogic>().loading;
    List<Search> records = context.watch<MovieLogic>().records;

    if (loading) {
      return Center(child: CircularProgressIndicator());
    }

    if (error != null) {
      return _buildErrorMessage(error);
    } else {
      return _buildGridView(records);
    }
  }

  Widget _buildErrorMessage(Object error) {
    debugPrint(error.toString());
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 50),
          Text("Something went wrong"),
          ElevatedButton(
            onPressed: () {
              context.read<MovieLogic>().setLoading();
              context.read<MovieLogic>().read();
            },
            child: Text("RETRY"),
          ),
        ],
      ),
    );
  }

  Widget _buildGridView(List<Search> items) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<MovieLogic>().setLoading();
        context.read<MovieLogic>().read();
      },
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 4 / 6,
        ),
        itemCount: items.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return _buildItem(items[index]);
        },
      ),
    );
  }

  Widget _buildItem(Search item) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                item.poster,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${item.title}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
