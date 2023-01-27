import 'package:flutter/cupertino.dart';
import 'package:shamoapp/models/product_model.dart';

class WishlistProvider with ChangeNotifier {
  List<ProductModel> _wishlist = [];
  List<ProductModel> get wishlist => _wishlist;

  set wishlist(List<ProductModel> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  setProduct(ProductModel product) {
    if (isWishlist(product)) {
      _wishlist.remove(product);
    } else {
      _wishlist.add(product);
    }
    notifyListeners();
  }

  isWishlist(ProductModel product) {
    if (_wishlist.contains(product)) {
      return true;
    } else {
      return false;
    }
  }
}
