import 'dart:convert';
import 'package:http/http.dart' as http;

import 'UserRepository.dart';
import 'model/post.dart';
import 'model/user.dart';

class RepositoryImpl implements Repository {
  final String userApiUrl = 'https://jsonplaceholder.typicode.com/users';
  final String postsApiUrl = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<User> getUser(int id) async {
    final response = await http.get(Uri.parse('$userApiUrl/$id'));
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  @override
  Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse(postsApiUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}