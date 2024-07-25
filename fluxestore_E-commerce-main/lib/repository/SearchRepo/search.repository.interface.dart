
abstract class ISearchRepository {
  Future<Map<String, dynamic>> searchProducts(String query);
}
