// login_controller.dart
import 'dart:io';

import 'package:clean_tdd_architecture/Feature/api_response.dart';
import 'package:clean_tdd_architecture/Feature/data/endpoint/constants.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import 'dart:convert';

import 'package:clean_tdd_architecture/utils/utils.dart';
import 'dart:convert';


import 'package:http/http.dart' as http;

import '../../data/model/login_model.dart';
abstract class ILoginController {
  Future<ApiResponse> getLogin();
  Future<ApiResponse> postLogin(Map<String,String>  body );
}

@lazySingleton
@injectable
class LoginController implements ILoginController {
  final Dio _dio = Dio(); // You can customize Dio with options if needed

  @override
  Future<ApiResponse> getLogin() async {
    try {
        //Replace the URL with your actual endpoint
         var successResponse = ApiResponse(success: true,status_code: 12, response: 'Data fetched successfully');
         return successResponse;
    } catch (error) {
      // Handle error appropriately
      print('Error in getLogin: $error');
      rethrow;
    }
  }
  @override
  Future<ApiResponse> postLogin(body) async {
    final response = await http.post(
      Uri.parse('http://192.168.140.249:5000/login'),  // Corrected URI
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
     var jsonresult = json.decode(response.body);


      if (response.statusCode == 200) {
      var jsonresult = json.decode(response.body);

      return jsonresult;
    } else {
      print('Login failed: ${response.statusCode}');

      return jsonresult;
    }
  }

/*  @override
  Future<ApiResponse> postLogin(body) async {


    print('After HTTP request');
    final response = await http.post(
      Uri.parse('http://192.168.140.249:500/login'),  // Corrected URI
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': 'kk',
        'password': "admin",
      }),
    );
    print(response);

    try {


      var res = await Utils.postApiCall(EndPoint.POST_LOGIN,body);
      var jsonresult = json.decode(res.body);
      print('jsonresult: $jsonresult');
       //ApiResponse  loginResponse=ApiResponse.fromJson(jsonresult);
       //var successResponse = ApiResponse(ok: true, response: 'Data fetched successfully');
       return jsonresult;
    }

    catch (error) {
      // Handle error appropriately
      print('Error in postLogin: $error');
      rethrow;
    }
  }*/
}

