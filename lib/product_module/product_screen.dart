import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_logic.dart';
import './product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Screen"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    Object? error = context.watch<ProductLogic>().error;
    bool loading = context.watch<ProductLogic>().loading;
    List<ProductModel> productList = context.watch<ProductLogic>().productList;

    if (loading) {
      return Center(child: CircularProgressIndicator());
    }

    if (error != null) {
      return _buildErrorMessage(error);
    } else {
      return _buildProductGridView(productList);
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
              context.read<ProductLogic>().setLoading();
              context.read<ProductLogic>().read();
            },
            child: Text("RETRY"),
          ),
        ],
      ),
    );
  }

  Widget _buildProductPageView(List<ProductModel> items) {
    return RefreshIndicator(
      onRefresh: () async{
        context.read<ProductLogic>().setLoading();
        context.read<ProductLogic>().read();
      },
      child: PageView.builder(
        itemCount: items.length,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return _buildProductItem(items[index]);
        },
      ),
    );
  }

  Widget _buildProductGridView(List<ProductModel> items) {
    return RefreshIndicator(
      onRefresh: () async{
        context.read<ProductLogic>().setLoading();
        context.read<ProductLogic>().read();
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
          return _buildProductItem(items[index]);
        },
      ),
    );
  }

  Widget _buildProductItem(ProductModel item) {
    return Image.network(
      item.image,
      width: double.maxFinite,
      fit: BoxFit.cover,
    );
  }
}
