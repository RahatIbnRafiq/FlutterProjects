import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavorites;

  ProductsGrid(this.showFavorites);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        this.showFavorites ? productsData.favorites : productsData.items;
    return GridView.builder(
      //why builder? only render whats on screen
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ), // how the grid should be structured
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(),
      ), //how each item should be built
    );
  }
}
