import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:fluxestore/repository/UserRepo/user_repository.interface.dart';

import '../../network/Api/api_endpoints.dart';
import '../../network/Exceptions/app_exceptions.dart';
import '../../network/Exceptions/exception_handlers.dart';

class USerRepository extends ApiEndpoints implements IUserRepository {
  @override
  Future<Map<String, dynamic>> getUserDetails(String userId) async {
    try {
      var response = await http.post(Uri.parse(userUrl),
          headers: {"content-type": "application/json"},
          body: jsonEncode({"userId": userId}));
      return processResponse(response);
    } catch (e) {
      return ExceptionHandlers().getExceptionString(e);
    }
  }
}
