import 'model/post.dart';
import 'model/user.dart';

abstract class Repository {
  Future<List<User>> getUsers();
  Future<List<Post>> getPosts();
}