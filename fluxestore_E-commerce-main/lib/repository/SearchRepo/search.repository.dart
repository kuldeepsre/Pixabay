import 'package:fluxestore/repository/SearchRepo/search.repository.interface.dart';
import '../../network/Api/api_endpoints.dart';
import 'package:http/http.dart' as http;

import '../../network/Exceptions/app_exceptions.dart';
import '../../network/Exceptions/exception_handlers.dart';

class SearchRepository extends ApiEndpoints implements ISearchRepository{
  @override
  Future<Map<String, dynamic>> searchProducts(String query) async {
    
    try {
      var response = await http.get(Uri.parse("$searchByProductsUrl/$query"));

      return processResponse(response);
    } catch (e) {
      return ExceptionHandlers().getExceptionString(e);
    }
  }
}