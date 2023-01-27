import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shamoapp/models/product_model.dart';

class ProductService {
  String baseUrl = 'https://shamoapp.ardhanurfan.my.id/api';

  Future<List<ProductModel>> getProducts() async {
    var url = Uri.parse('$baseUrl/products');
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];

      List<ProductModel> products = [];

      for (var product in data) {
        products.add(ProductModel.fromJson(product));
      }

      return products;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }
}
