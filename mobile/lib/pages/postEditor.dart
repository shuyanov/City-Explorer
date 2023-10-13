import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostEditor extends StatefulWidget {
  final XFile xPhoto;
  PostEditor({required this.xPhoto});

  @override
  State<PostEditor> createState() => _PostEditorState();
}

class _PostEditorState extends State<PostEditor> {
  File? photo;
  @override
  void initState() {
    photo = File(widget.xPhoto.path);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.file(photo!, height: context.width, width: context.width, fit: BoxFit.cover,),
          
        ]),
      ),
    );
  }
}