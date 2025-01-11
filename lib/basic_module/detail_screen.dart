import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/basic_module/food_data.dart';


class DetailScreen extends StatelessWidget {
  //const DetailScreen({super.key});

  FoodModel item;
  DetailScreen(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Screen"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Image.network(this.widget.item.img),
          Text(
            this.widget.item.title,
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "${this.widget.item.price}",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "${this.widget.item.rate}",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "${this.widget.item.shop}",
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
