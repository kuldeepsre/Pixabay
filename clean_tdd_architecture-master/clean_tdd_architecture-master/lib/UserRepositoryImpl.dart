import 'dart:convert';
import 'package:http/http.dart' as http;

import 'UserRepository.dart';
import 'model/post.dart';
import 'model/user.dart';
class RepositoryImpl implements Repository {
  final String userApiUrl = 'https://jsonplaceholder.typicode.com/users';
  final String postApiUrl = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(userApiUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse(postApiUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}