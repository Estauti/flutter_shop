import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products_filters_provider.dart';

import '../widgets/product_item.dart';

import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final onlyFavs = Provider.of<ProductsFiltersProvider>(context).favoriteOnly;
    final productsProvider = Provider.of<Products>(context);
    final products = onlyFavs
        ? productsProvider.favoriteProducts
        : productsProvider.products;

    return GridView.builder(
      padding: EdgeInsets.all(15),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItem(),
      ),
    );
  }
}
