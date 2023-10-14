// http://localhost:3000/achievements

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test_hackaton/Model/PhotoModel.dart';


List<Photo> photos = [];
  Future getPhotos() async {
    final url = Uri.parse(
        "${dotenv.env['DB_URL']}/photos");

    final response = await http.get(
      url,
    );
    try{
    if (response.statusCode == 200) {
       photos = photoFromJson(response.body);
         
          print(
              "Successed write ===>>> getPhotos > ${photos.toString()}");

          print("getPhotos: ${response.statusCode}");
      print('Photos успешно отправлены на сервер');
    } else {
      print('Ошибка при отправке Photo на сервер');
    }
    }catch(e) {
      print("exeptionPhoto: ${e}");
    }
    
  }
