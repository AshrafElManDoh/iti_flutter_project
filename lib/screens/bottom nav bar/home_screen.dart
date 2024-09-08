import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:iti_project/compnents/product_component.dart';
import 'package:iti_project/models/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Stream<QuerySnapshot> productStream =
      FirebaseFirestore.instance.collection("products").snapshots();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: StreamBuilder(
          stream: productStream,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data!.docs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return ProductComponent(productModel: ProductModel(image: "${snapshot.data!.docs[index]["image"]}",
                            name: "${snapshot.data!.docs[index]["name"]}",
                            price: "${snapshot.data!.docs[index]["price"]}"));
                },
              );
            } else {
              return const Center(child: Text("There is an error!"));
            }
          }),
    );
  }
}
