import 'package:flutter/material.dart';
import 'package:iti_project/constants.dart';
import 'package:iti_project/screens/one_category_screen.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OneCategoryScreen(categoryName: categoryName),
        ));
      },
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            categoryName,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
