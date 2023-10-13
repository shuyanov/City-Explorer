// http://localhost:3000/achievements

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../Model/UserModel.dart';


dynamic user;
  Future getUser() async {
    final url = Uri.parse(
        "${dotenv.env['DB_URL']}/user");

    final response = await http.get(
      url,
    );
    try{
    if (response.statusCode == 200) {
       user = userFromJson(response.body);
         
          print(
              "Successed write ===>>> getUser > ${user.toJson().toString()}");

          print("getUser: ${response.statusCode}");
      print('Users успешно отправлены на сервер');
    } else {
      print('Ошибка при отправке User на сервер');
    }
    }catch(e) {
      print("exeptionUser: ${e}");
    }
    
  }

  
