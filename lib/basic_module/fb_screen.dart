import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'food_data.dart';
import 'widget_util.dart';

class FbScreen extends StatelessWidget {
  // const FbScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("Facebook Screen"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _buildMainListView();
  }

  Widget _buildMainListView() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        _buildFoodStoryListView(foodModelList, 300, 180),
        _buildFoodSlideShow(),
        _buildFoodGridViewHorizontal(),
        _buildFoodListView(),
        _buildFoodStoryListView(foodModelList, 300, 180),
        _buildFoodListView(),
        _buildFoodStoryListView(foodModelList, 300, 180),
      ],
    );
  }

  Widget _buildFoodSlideShow() {
    return Container(
      height: 300,
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: foodModelList.length,
        pageSnapping: true,
        itemBuilder: (context, index) {
          return _buildSlideShowItem(foodModelList[index]);
        },
      ),
    );
  }

  Widget _navigateToDetailScreen(FoodModel item, {Widget? child}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => DetailScreen(item),
          ),
        );
      },
      child: child,
    );
  }

  Widget _buildFoodStoryItem(FoodModel item, width) {
    return _navigateToDetailScreen(
      item,
      child: Container(
        width: width,
        margin: EdgeInsets.only(right: 10),
        child: roundedImage(item.img),
      ),
    );
  }

  Widget _buildSlideShowItem(FoodModel item) {
    return _navigateToDetailScreen(
      item,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: roundedImage(item.img),
      ),
    );
  }

  Widget _buildGridFoodItem(FoodModel item) {
    return _navigateToDetailScreen(
      item,
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: roundedImage(item.img),
            ),
            Text("${item.title}", maxLines: 1),
            Text("USD ${item.price}", maxLines: 1),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodPageView() {
    return PageView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: foodModelList.length,
      itemBuilder: (context, index) {
        return Image.network(
          foodModelList[index].img,
          fit: BoxFit.cover,
        );
      },
    );
  }

  Widget _buildFoodGridViewHorizontal() {
    return Container(
      height: 400,
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(5),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 4 / 6,
        ),
        itemCount: foodModelList.length,
        itemBuilder: (context, index) {
          return _buildGridFoodItem(foodModelList[index]);
        },
      ),
    );
  }

  Widget _buildFoodGridView() {
    return GridView.builder(
      // physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 4 / 6,
      ),
      itemCount: foodModelList.length,
      itemBuilder: (context, index) {
        return _buildGridFoodItem(foodModelList[index]);
      },
    );
  }

  Widget _buildFoodListView() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: foodModelList.length,
      itemBuilder: (context, index) {
        return _buildFoodItem(foodModelList[index]);
      },
    );
  }

  Widget _buildFoodItem(FoodModel food) {
    return _navigateToDetailScreen(
      food,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 10,
        ),
        child: Column(
          children: [
            roundedImage(food.img),
            Text(
              food.title,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              "USD ${food.price}",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodStoryListView(
      List<FoodModel> items, double height, double width) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildFoodStoryItem(items[index], width);
        },
      ),
    );
  }
}
