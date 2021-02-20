import 'package:flutter/material.dart';
import 'post.dart';
import 'postList.dart';
import 'textInputWidget.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];
  void newPost(String text) {
    this.setState(() {
      posts.add(new Post(text, "Asli"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Message App"),
      ),
      body: Column(
        children: <Widget>[

          Expanded(child: PostList(this.posts)
          ),
          Expanded(child: TextInputWidget(this.newPost)),
        ],
      ),
    );
  }
}