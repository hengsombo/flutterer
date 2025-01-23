import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_1/basic_module/movie_module1/movie_logic.dart';
import './movie_model.dart';

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
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    Object? error = context.watch<MovieLogic>().error;
    bool loading = context.watch<MovieLogic>().loading;
    List<MovieModel> movieList = context.watch<MovieLogic>().movieList;

    if (loading) {
      return Center(child: CircularProgressIndicator());
    }

    if (error != null) {
      return _buildErrorMessage(error);
    } else {
      return _buildMovieGridView(movieList);
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

  Widget _buildMoviePageView(List<MovieModel> items) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<MovieLogic>().setLoading();
        context.read<MovieLogic>().read();
      },
      child: PageView.builder(
        itemCount: items.length,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return _buildMovieItem(items[index]);
        },
      ),
    );
  }

  Widget _buildMovieGridView(List<MovieModel> items) {
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
          return _buildMovieItem(items[index]);
        },
      ),
    );
  }

  Widget _buildMovietItem(MovieModel item) {
    return Image.network(
      item.image,
      width: double.maxFinite,
      fit: BoxFit.cover,
    );
  }
}
