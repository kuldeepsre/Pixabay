import 'model/post.dart';
import 'model/user.dart';

abstract class Repository {
  Future<User> getUser(int id);
  Future<List<Post>> getPosts();
}