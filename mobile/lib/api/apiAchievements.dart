// http://localhost:3000/achievements

import 'package:http/http.dart' as http;
import 'package:test_hackaton/Model/PostModel.dart';

dynamic achievements;
  Future getAchievements() async {
    final url = Uri.parse(
        'http://192.168.43.182:3000/achievements'); // Замените на реальный URL вашего сервера

    final response = await http.get(
      url,
    );
    try{
    if (response.statusCode == 200) {
       achievements = achievementsFromJson(response.body);
         
          print(
              "Successed write ===>>> getAchievements > ${achievements.toJson().toString()}");

          print("getAchievements: ${response.statusCode}");
      print('Геоданные успешно отправлены на сервер');
    } else {
      print('Ошибка при отправке геоданных на сервер');
    }
    }catch(e) {
      print("exeption: ${e}");
    }
    
  }
