import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hackaton/util/post.dart';



class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Post(userAvatar: "", user: "user1", image: 'https://cdn1.ozone.ru/s3/multimedia-0/6108964908.jpg', like: false, about: "about"),
          Post(userAvatar: "", user: "user2", image: 'https://cdn1.ozone.ru/s3/multimedia-0/6108964908.jpg', like: false, about: "about"),
          Post(userAvatar: "", user: "user3", image: 'https://cdn1.ozone.ru/s3/multimedia-0/6108964908.jpg', like: false, about: "about"),
          Post(userAvatar: "", user: "user1", image: 'https://cdn1.ozone.ru/s3/multimedia-0/6108964908.jpg', like: false, about: "about"),
          Post(userAvatar: "", user: "user2", image: 'https://cdn1.ozone.ru/s3/multimedia-0/6108964908.jpg', like: false, about: "about"),
          Post(userAvatar: "", user: "user1", image: 'https://cdn1.ozone.ru/s3/multimedia-0/6108964908.jpg', like: false, about: "about"),
        ],
      ),
    );
  }
}
