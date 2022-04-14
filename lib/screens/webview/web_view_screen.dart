import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewNews extends StatelessWidget {
  String urlsite;
  WebViewNews({
    Key? key,
    required this.urlsite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'News App',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: WebView(
        initialUrl: urlsite,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
