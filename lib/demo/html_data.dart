import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHtmlWidget(
        htmlData:
        "<p><strong>fsdfsdf</strong></p>\n<ul>\n<li><strong>fsdsdf</strong></li>\n<li><strong>gfdgfdg</strong></li>\n<li><strong>dghfhg</strong></li>\n<li><strong>ghfhfg</strong></li>\n<li><strong>hghfg</strong></li>\n</ul>",
      ),
    );
  }
}

class MyHtmlWidget extends StatelessWidget {
  final String htmlData;

  MyHtmlWidget({required this.htmlData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTML Content'),
      ),
      body: SingleChildScrollView(
        child: Html(data: htmlData),
      ),
    );
  }
}
