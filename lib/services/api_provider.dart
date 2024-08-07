

import 'package:dio/dio.dart';
import 'package:iti_project/models/product_model.dart';

class ApiProvider {
  Future<List<String>> getCategoryList() async {
    Response response =
        await Dio().get('https://dummyjson.com/products/category-list');

    List<dynamic> categoriesdynamic = response.data;

    List<String> categories = [];

    for (var category in categoriesdynamic) {
      categories.add(category);
    }

    return categories;
  }

  Future<List<ProductModel>> getChoosenCategory(
      {required String categoryName}) async {
    Response response = await Dio().get(
      "https://dummyjson.com/products/category/$categoryName",
    );

    Map<String, dynamic> jsonData = response.data;
    List<dynamic> items = jsonData['products'];
    List<ProductModel> itemObject = [];
    for (var item in items) {
      ProductModel itemModel = ProductModel.categoryFromJson(item);
      itemObject.add(itemModel);
    }
    return itemObject;
  }
}
