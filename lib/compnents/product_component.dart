import 'package:flutter/material.dart';
import 'package:iti_project/constants.dart';
import 'package:iti_project/models/product_model.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            color: kSecondaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${productModel.price}",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: -50,
            child: Image.network(
              productModel.image,
              height: 110,
              width: 110,
            ),
          )
        ],
      ),
    );
  }
}
