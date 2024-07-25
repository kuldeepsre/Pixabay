import 'dart:convert';

import 'package:fluxestore/models/product_data_model.dart';
import 'package:fluxestore/network/Exceptions/app_exceptions.dart';
import 'package:fluxestore/network/Exceptions/exception_handlers.dart';

import '../../network/Api/api_endpoints.dart';
import 'products_repository.interface.dart';
import 'package:http/http.dart' as http;

class ProductsRepository extends ApiEndpoints implements IproductsRepository {
  @override
  Future<Map<String, dynamic>> getAllProducts() async {
    try {
      var response = await http.get(Uri.parse(productsUrl));
      return processResponse(response);
    } catch (e) {
      return ExceptionHandlers().getExceptionString(e);
    }
  }

  @override
  Future<Map<String, dynamic>> getAllBanners() async {
    try {
      var response = await http.get(Uri.parse(bannersUrl));
      return processResponse(response);
    } catch (e) {
      return ExceptionHandlers().getExceptionString(e);
    }
  }

  @override
  Future<List<ProductDataModel>> getRecommendations() async {
    try {
      var response = await http.get(Uri.parse(recommendationsUrl));

      var results = jsonDecode(response.body);
      List<ProductDataModel> tempList = [];
      if (response.statusCode == 200) {
        var products = results['data'];
        for (var i = 0; i < products.length; i++) {
          ProductDataModel items = ProductDataModel.fromJson(products[i]);
          tempList.add(items);
        }
        return tempList;
      } else {
        throw Exception(results['message']);
      }
    } catch (e) {
      return [];
    }
  }
}
