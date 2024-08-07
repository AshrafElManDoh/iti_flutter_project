import 'package:flutter/material.dart';
import 'package:iti_project/compnents/category_component.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key, required this.categories});

  final List? categories;

  @override
  Widget build(BuildContext context) {
    
    return  ListView.separated(
            itemBuilder: (context, index) {
              return CategoryComponent(categoryName: categories![index]);
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: categories!.length);
  }
}
