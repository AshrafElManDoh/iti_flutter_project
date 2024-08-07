import 'package:flutter/material.dart';

import 'package:iti_project/compnents/category_list_view.dart';

import 'package:iti_project/services/api_provider.dart';

// class CategoriesScreen extends StatefulWidget {
//   const CategoriesScreen({super.key});

//   @override
//   State<CategoriesScreen> createState() => _CategoriesScreenState();
// }

// class _CategoriesScreenState extends State<CategoriesScreen> {
//   final Stream<QuerySnapshot> productStream =
//       FirebaseFirestore.instance.collection("categories").snapshots();
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: StreamBuilder(
//           stream: productStream,
//           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasData) {
//               return ListView.separated(
//                   itemBuilder: (context, index) {
//                     return ProductComponent(
//                         productModel: ProductModel(
//                             image: snapshot.data!.docs[index]['image'],
//                             name: snapshot.data!.docs[index]['name']));
//                   },
//                   separatorBuilder: (context, i) {
//                     return const SizedBox(
//                       height: 15,
//                     );
//                   },
//                   itemCount: snapshot.data!.docs.length);

//             }if(snapshot.connectionState==ConnectionState.waiting)
//             {
//               return const Center(child: CircularProgressIndicator());
//             } else {
//               return const Center(child: Text("There is an error!"));
//             }
//           }),
//     );
//   }
// }

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var future;
  @override
  void initState() {
    super.initState();
    future = ApiProvider().getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CategoryListView(categories: snapshot.data);
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return const Text("Error");
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
