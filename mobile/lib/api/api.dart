import 'package:http/http.dart' as http;

class NetworkUtils {
  static Future<void> sendLocationData(String img, String descriptions,
      double latitude, double longitude, int userId) async {
    final url = Uri.parse(
        'http://your-server.com/your-endpoint'); // Замените на реальный URL вашего сервера

    final data = {
      'img': img.toString(),
      'descriptions': descriptions.toString(),
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'id': userId.toString()
    };

    final response = await http.post(
      url,
      body: data,
    );
    if (response.statusCode == 200) {
      print('Геоданные успешно отправлены на сервер');
    } else {
      print('Ошибка при отправке геоданных на сервер');
    }
  }
}
