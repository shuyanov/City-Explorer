import 'package:flutter/material.dart';
import 'package:test_hackaton/util/post.dart';

class DetalPostPage extends StatelessWidget {
  final String userAvatar;
  final String user;
  final String image;
  final bool like;
  final String about;
  DetalPostPage(
      {required this.userAvatar,
      required this.user,
      required this.image,
      required this.like,
      required this.about});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Post(
              userAvatar: userAvatar,
              user: user,
              image: image,
              like: like,
              about: about)),
    );
  }
}
