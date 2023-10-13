import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkUtils {
  static Future<void> sendLocationData(String img, String descriptions,
      double latitude, double longitude/* , int userId */) async {
    final url = Uri.parse(
        '${dotenv.env['DB_URL']}/photos');

    final data = {
      'img': img.toString(),
      'descriptions': descriptions.toString(),
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      // 'id': null.toString()
    };

    final response = await http.post(
      url,
      body: data,
    );
    if (response.statusCode == 201) {
      print('Геоданные успешно отправлены на сервер');
    } else {
      print('Ошибка при отправке геоданных на сервер');
    }
  }
}
