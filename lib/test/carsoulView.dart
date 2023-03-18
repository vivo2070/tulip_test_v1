import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';

class CategoryCarousel extends StatefulWidget {
  @override
  _CategoryCarouselState createState() => _CategoryCarouselState();
}

class _CategoryCarouselState extends State<CategoryCarousel> {
  Future<List<String>> fetchData() async {
    final response = await http.get(Uri.parse('https://www.tulipm.net/api/Carousel/GetAll'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body)['data'] as List;
      final imageUrls = jsonData.map((json) => json['image'] as String).toList();
      return imageUrls;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final imageUrls = snapshot.data!;
          return CarouselSlider(
            items: imageUrls.map((imageUrl) {
              return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),

                  ),
                  child: Image.asset('images/Card 2.png', fit: BoxFit.fitWidth,width: MediaQuery.of(context).size.width,));
            }).toList(),
            options: CarouselOptions(
              height: 180,
              aspectRatio: 16/9,
              viewportFraction:1.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class Category {
  // final int id;
// final String name;
  final String imageUrl;

  Category({required this.imageUrl});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      imageUrl: json['image'],
    );
  }
}
