import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../api/api.dart';

TextEditingController postController = TextEditingController();

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
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Image.file(
            photo!,
            height: context.width,
            width: context.width,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: postController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
                label: Text("Информация о фото"),
                contentPadding: EdgeInsets.all(8),
                border: InputBorder.none),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    String img = 'your_image_data';
                    String descriptions = 'your_descriptions';
                    double latitude = 42.3601;
                    double longitude = -71.0589;
                    int userId = 123; // Замените на фактический ID пользователя

                    NetworkUtils.sendLocationData(
                        img, descriptions, latitude, longitude, userId);
                  },
                  child: Text("Отправить")),
            ),
          )
        ]),
      ),
    );
  }
}
