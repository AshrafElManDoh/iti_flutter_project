import 'package:flutter/material.dart';
import 'package:iti_project/compnents/product_component.dart';
import 'package:iti_project/constants.dart';
import 'package:iti_project/models/product_model.dart';
import 'package:iti_project/services/api_provider.dart';

class OneCategoryScreen extends StatefulWidget {
  const OneCategoryScreen({super.key, required this.categoryName});
  final String categoryName;

  @override
  State<OneCategoryScreen> createState() => _OneCategoryScreenState();
}

class _OneCategoryScreenState extends State<OneCategoryScreen> {
  bool isLoading = true;
  var myList;

  @override
  void initState() {
    super.initState();
    getItems();
  }

  getItems() async {
    myList = await ApiProvider()
        .getChoosenCategory(categoryName: widget.categoryName);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Our",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Text(
              "Store",
              style: TextStyle(color: Colors.blue, fontSize: 30),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      backgroundColor: kPrimaryColor,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                itemCount: myList!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return ProductComponent(
                      productModel: ProductModel(
                          image: "${myList![index].image}",
                          name: "${myList![index].name}",
                          price: "${myList![index].price}"));
                },
              )),
    );
  }
}
