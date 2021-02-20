import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Post {
  String body;
  String author;
  int likes = 0;
  bool userliked = false;
  Post(this.body, this.author);
  void likePost() {
    this.userliked = !this.userliked;
    if (this.userliked) {
      this.likes += 1;
    } else {
      this.likes += 1;
    }
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Message App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

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

          Expanded(child: PostList()
              ),
          Expanded(child: TextInputWidget(this.newPost)),
        ],
      ),
    );
  }
}

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;
  TextInputWidget([this.callback]);
  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    widget.callback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.message),
          labelText: "Type a message",
          suffixIcon: IconButton(
            icon: Icon(Icons.send),
            splashColor: Colors.blue,
            tooltip: "Post message",
            onPressed: this.click,
          )),
    );
  }
}

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
