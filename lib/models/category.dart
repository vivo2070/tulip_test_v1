import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

import '../Widgets/catWidgets.dart';

class Category {

   String categoriesName;
   String categoriesImages;


  Category({
    required this.categoriesName,
    required this.categoriesImages
  });

   factory Category.fromJson(Map<String, dynamic> json) {
     return Category(
         categoriesName: json['categoriesName'],
         categoriesImages: json['categoriesImages'],

     );
   }
}


Future<List<Category>> fetchCategory() async {
  var apiUrl = 'https://www.tulipm.net/api/Categories/GetAll';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final categoryJson = data['data'] as List<dynamic>;
    final categories = categoryJson.map((json) => Category.fromJson(json)).toList();
    return categories;
  } else {
    throw Exception('Failed to load services');
  }
}


class CategoryTile extends StatelessWidget {
  final Category category;

  CategoryTile({required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Image.network(
                  category.categoriesImages,
                  fit: BoxFit.cover,
                  height: 170,
                  width: 191,
                  errorBuilder: (context, error, stackTrace) =>
                      Center(child: Icon(Icons.error)),
                ),
                Positioned(

                  bottom: 0,
                  child: Container(
                    width: 191,
                    height: 40,
                    decoration: BoxDecoration(

                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/btn.png')
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Center(
                        child: Text(
                          category.categoriesName,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 17,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}



class categoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Center(
        child: FutureBuilder<List<Category>>(
          future: fetchCategory(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final categories = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CategoriesGridView(categories: categories),
              );
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: CategoriesGridView(categories: []),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
// class CategoriesGridView extends StatelessWidget {
//   final List<Category> categories;
//
//   CategoriesGridView({required this.categories});
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       crossAxisCount: 2,
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       children: List.generate(
//         6,
//             (index) => CatNormal(),
//       ),
//     );
//   }
// }

class CategoriesGridView extends StatelessWidget {
  final List<Category> categories;

  CategoriesGridView({required this.categories});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      itemCount:categories.length,
      gridDelegate: categories.length == 7
      // Use a rectangular grid with a single row and full width items for 7 categories
          ? SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width,
        childAspectRatio: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      )
      // Use a square grid with two columns for all other cases
          : SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (BuildContext context, int index) {
        return CategoryTile(category: categories[index]);
      },
    );
  }
}
