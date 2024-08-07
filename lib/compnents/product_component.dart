import 'package:flutter/material.dart';
import 'package:iti_project/constants.dart';
import 'package:iti_project/models/product_model.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
          color: kSecondaryColor, borderRadius: BorderRadius.circular(40)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            productModel.image,
            fit: BoxFit.fill,
            height: 250,
            width: 250,
          ),
          Text(
            productModel.name,
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          productModel.price == null
              ? const Text("")
              : Text("${productModel.price} \$",
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
        ],
      ),
    );
  }
}
