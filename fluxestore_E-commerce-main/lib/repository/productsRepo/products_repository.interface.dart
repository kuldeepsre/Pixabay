import '../../models/product_data_model.dart';

abstract class IproductsRepository {
  Future<Map<String, dynamic>> getAllProducts();
  Future<Map<String, dynamic>> getAllBanners();
  Future<List<ProductDataModel>>  getRecommendations();
}
