import 'package:flutter/material.dart';


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