import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/products_filters.dart';
import '../widgets/products_grid.dart';

import '../providers/products_filters_provider.dart';

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductsFiltersProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('MyShop'),
          actions: <Widget>[
            ProductsFilters(),
          ],
        ),
        body: ProductsGrid(),
      ),
    );
  }
}
