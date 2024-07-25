abstract class IAuthRepository {
  Future<Map<String, dynamic>> register(String userName,String email,String password);
  Future<Map<String, dynamic>> login(String email,String password);
}
