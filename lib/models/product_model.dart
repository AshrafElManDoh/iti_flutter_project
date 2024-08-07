class ProductModel {
  final String image;
  final String name;
  final String? price;

  ProductModel({required this.image, required this.name, this.price});

  factory ProductModel.fromJson(json) {
    return ProductModel(
        image: json["image"], name: json["name"], price: json["price"]);
  }

  factory ProductModel.categoryFromJson(json) {
    return ProductModel(
        image: json["images"][0], name: json["title"], price: json["price"].toString());
  }
}
