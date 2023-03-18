import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:chewie/chewie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

import '../test/facebookPost.dart';

class Post {
  String centerName;
  String postTopOne;
  String details;
  int likes;
  int comments;


  Post({required this.centerName,required this.postTopOne,required this.details,required this.likes,required this.comments});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        centerName: json['centerName'],
        postTopOne: json['postTopOne'],
        details: json['details'],
      likes: json['likesCount'],
      comments: json['commentCount'],

    );
  }
}
class postList extends StatefulWidget {
  @override
  _postListState createState() => _postListState();
}

class _postListState extends State<postList> {
  late Future<List<Post>> futureReel;


  @override
  void initState() {
    super.initState();
    futureReel = fetchPosts();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Post>>(
        future: fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final posts = snapshot.data!;
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return FacebookPost(
                  name: posts[index].centerName,
                  content: posts[index].centerName,
                  avatarImageUrl: posts[index].postTopOne,
                  comments: posts[index].comments,
                  likes: posts[index].likes,
                  date: 'قبل ساعتين',
                  showcaseImageUrls: [
                    'https://i.pinimg.com/564x/84/f6/4c/84f64c9b921267d550046c69c1f497d9.jpg'

                  ],
                );
              },
            );

          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Future<List<Post>> fetchPosts() async {
  var apiUrl = 'https://www.tulipm.net/api/Posts/GetAll';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final postJson = data['data'] as List<dynamic>;
    final posts = postJson.map((json) => Post.fromJson(json)).toList();
    return posts;
  } else {
    throw Exception('Failed to load services');
  }
}

