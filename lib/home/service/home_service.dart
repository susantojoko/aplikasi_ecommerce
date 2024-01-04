import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeService {
  final String authToken;
  List<dynamic> dataBarang = [];

  HomeService(this.authToken);

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('http://192.168.2.28:3000/api/products'),
      headers: {'Authorization': authToken},
    );
    if (response.statusCode == 200) {
      final responseBody = response.body;
      final responseJson = json.decode(responseBody);

      if (responseJson.containsKey('data')) {
        final data = responseJson['data'];
        if (data is List) {
          dataBarang = data;
        }
      }
    } else {
      throw Exception('Failed to load dataBarang');
    }
  }
}
