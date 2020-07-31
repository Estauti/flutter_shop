import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _favoriteOnly = false;

  void _filterSelected(FilterOptions option) {
    setState(() {
      _updateFavoriteOnlyFilter(option);
    });
  }

  void _updateFavoriteOnlyFilter(FilterOptions option) {
    if (option == FilterOptions.Favorites) {
      _favoriteOnly = true;
    } else if (option == FilterOptions.All) {
      _favoriteOnly = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Only favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('All products'),
                value: FilterOptions.All,
              ),
            ],
            icon: Icon(Icons.more_vert),
            onSelected: (value) => _filterSelected(value),
          ),
        ],
      ),
      body: ProductsGrid(_favoriteOnly),
    );
  }
}
