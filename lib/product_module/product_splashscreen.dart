import 'package:flutter/material.dart';

class ProductSplashscreen extends StatelessWidget {
  const ProductSplashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(Icons.shop, size: 100),
      ),
    );
  }
}
