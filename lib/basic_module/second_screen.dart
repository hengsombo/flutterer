import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Second Screen"),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: _buildBody(),
      //bottomMenu: _buildTopMenu(),
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  Widget _buildBody() {
    return Center(
        child: Row(
      children: [
        Container(width: 80, height: 40, color: Colors.red),
        Container(width: 90, height: 90, color: Colors.blue),
        Container(width: 30, height: 80, color: Colors.yellow),
        Container(width: 70, height: 30, color: Colors.red),
        Container(width: 50, height: 90, color: Colors.pink),
      ],
    ));
  }

  // Widget _buildTopMenu() {
  //   return Row(
  //     mainAxisSize: MainAxisAligment.spaceAround,
  //     children: [
  //       IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
  //       IconButton(onPressed: () {}, icon: Icon(Icons.bookmark)),
  //       IconButton(onPressed: () {}, icon: Icon(Icons.shopping_basket)),
  //       IconButton(onPressed: () {}, icon: Icon(Icons.currency_bitcoin)),
  //     ],
  //   );
  // }

  Widget _buildBottomAppBar() {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.home)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
        ],
      ),
    );
  }
}
