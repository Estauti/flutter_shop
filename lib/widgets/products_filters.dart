import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_filters_provider.dart';

class ProductsFilters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsFiltersProvider =
        Provider.of<ProductsFiltersProvider>(context, listen: false);

    return PopupMenuButton(
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
      onSelected: (value) => productsFiltersProvider.filterSelected(value),
    );
  }
}
