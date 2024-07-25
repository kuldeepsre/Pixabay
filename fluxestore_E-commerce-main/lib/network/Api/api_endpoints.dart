import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  static  String baseUrl = dotenv.get("BASE_URL_PRODUCTION");

  final String loginUrl = "$baseUrl/api/v1/user/login";

  final String registerUrl = "$baseUrl/api/v1/user/registerUser";

  final String productsUrl = "$baseUrl/products";

  final String bannersUrl = "$baseUrl/api/v1/getAllBanners";

  final String userUrl = "$baseUrl/api/v1/user/getUser";

  final String addToCartUrl = "$baseUrl/api/v1/users/AddToCart";

  final String getUserCartUrl = "$baseUrl/api/v1/users/getuserCart";

  final String deleteUserCartUrl = "$baseUrl/api/v1/users/deleteCartItem";

  final String getUserOrdersUrl = "$baseUrl/api/v1/users/getUserOrders";

  final String newOrderUrl = "$baseUrl/api/v1/users/newOrder";

  final String cancelUserOrder = "$baseUrl/api/v1/users/cancelOrder";

  final String recommendationsUrl = "$baseUrl/api/v1/products/getRecomendations";
  
  final String searchByProductsUrl = "$baseUrl/api/v1/products";
}