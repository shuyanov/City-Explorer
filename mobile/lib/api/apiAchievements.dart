// http://localhost:3000/achievements

import 'package:http/http.dart' as http;
import 'package:test_hackaton/Model/AchieveModel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


List<Achievements> achievements = [];
  Future getAchievements() async {
    final url = Uri.parse(
        "${dotenv.env['DB_URL']}/achievements");

    final response = await http.get(
      url,
    );
    try{
    if (response.statusCode == 200) {
       achievements = achievementsFromJson(response.body);
         
          print(
              "Successed write ===>>> getAchievements > ${achievements.first.name.toString()}");

          print("getAchievements: ${response.statusCode}");
      print('Геоданные успешно отправлены на сервер');
    } else {
      print('Ошибка при отправке геоданных на сервер');
    }
    }catch(e) {
      print("exeption324: ${e}");
    }
    
  }


 Future postAchievements() async {
    final url = Uri.parse(
        "${dotenv.env['DB_URL']}/achievements");

    final response = await http.post(
      url,
      body: {
        ""
    // "login": login.trim(),
    // "password": pass.trim(),
  });
    try{
    if (response.statusCode == 200) {
       achievements = achievementsFromJson(response.body);
         
          print(
              "Successed write ===>>> getAchievements > ${achievements.first.name.toString()}");

          print("getAchievements: ${response.statusCode}");
      print('Геоданные успешно отправлены на сервер');
    } else {
      print('Ошибка при отправке геоданных на сервер');
    }
    }catch(e) {
      print("exeption324: ${e}");
    }
    
  }