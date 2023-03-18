import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class FacebookPostView extends StatelessWidget {
  final String postUrl;

  FacebookPostView({required this.postUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: postUrl,

      ),

      appBar: AppBar(
        title: Text("Facebook Post"),
      ),
    );
  }
}
