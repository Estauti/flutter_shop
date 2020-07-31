import 'package:flutter/foundation.dart';

enum FilterOptions { Favorites, All }

class ProductsFiltersProvider with ChangeNotifier {
  bool _favoriteOnly = false;

  void filterSelected(FilterOptions option) {
    _updateFavoriteOnlyFilter(option);
  }

  void _updateFavoriteOnlyFilter(FilterOptions option) {
    if (option == FilterOptions.Favorites) {
      _favoriteOnly = true;
    } else if (option == FilterOptions.All) {
      _favoriteOnly = false;
    }
    notifyListeners();
  }

  bool get favoriteOnly {
    return _favoriteOnly;
  }
}
