import 'dart:convert';
import 'package:http/http.dart' as http;

const String _baseUrl = 'https://reqres.in/api/users';

class ApiService {
  Future<Map<String, dynamic>> fetchData(int page) async {
    final response = await http.get(Uri.parse('$_baseUrl?page=$page'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
