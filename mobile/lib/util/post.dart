import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../pages/ImageViewer.dart';


class Post extends StatefulWidget {
  final String userAvatar;
  final String user;
  final String image;
  final bool like;
  final String about;
  Post(
      {required this.userAvatar,
      required this.user,
      required this.image,
      required this.like,
      required this.about});

  @override
  State<Post> createState() => _PostState();
}


class _PostState extends State<Post> {
bool isLiked = false;
  @override
  void initState() {
    isLiked = widget.like;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: GestureDetector(
        onDoubleTap: () {
          setState(() {
          isLiked = true;
            
          });
        },
        child: Material(
          elevation: 5,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        child: CircleAvatar(
                          backgroundColor: Colors.purple,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(widget.user)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                  Get.to(
                    ImageViewer(imageUrl: widget.image,)
                  );
      
                  },
                  child: Container(
                      width: context.width,
                      height: context.width,
                      child: CachedNetworkImage(
                        imageUrl: widget.image,
                        fit: BoxFit.cover,
                      )),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.black45,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.about),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
