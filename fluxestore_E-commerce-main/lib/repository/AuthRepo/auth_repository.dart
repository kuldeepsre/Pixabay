import 'dart:convert';

import 'package:fluxestore/network/Exceptions/exception_handlers.dart';
import 'package:http/http.dart' as http;
import 'package:fluxestore/network/Api/api_endpoints.dart';
import 'package:fluxestore/repository/AuthRepo/auth_repository.interface.dart';

import '../../network/Exceptions/app_exceptions.dart';

class AuthRepository extends ApiEndpoints implements IAuthRepository {
  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      var credentials = {"email": email, "password": password};

      var response = await http.post(Uri.parse(loginUrl),
          headers: {"content-type": "application/json"},
          body: jsonEncode(credentials));
      return processResponse(response);    
    } catch (e) {
      return ExceptionHandlers().getExceptionString(e);
    }
  }

  @override
  Future<Map<String, dynamic>> register(
      String userName, String email, String password) async {
    try {
      var details = {
        "userName": userName,
        "email": email,
        "password": password
      };
      var response = await http.post(Uri.parse(registerUrl),
          headers: {"content-type": "application/json"},
          body: jsonEncode(details));
      return processResponse(response);
    } catch (e) {
      return ExceptionHandlers().getExceptionString(e);
    }
  }
}
