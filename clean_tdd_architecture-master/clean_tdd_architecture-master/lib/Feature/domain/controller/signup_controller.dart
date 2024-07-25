// login_controller.dart
import 'package:clean_tdd_architecture/Feature/api_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class ISignupController {
  Future<ApiResponse> getSignup();
  Future<ApiResponse> postSignup();
}

@lazySingleton
@injectable
class SignupController implements ISignupController {
  final Dio _dio = Dio(); // You can customize Dio with options if needed

  @override
  Future<ApiResponse> getSignup() async {
    try {
         // Replace the URL with your actual endpoint
         var successResponse = ApiResponse(success: true,status_code: 23, response: 'Data fetched successfully');
         return successResponse;
    } catch (error) {
      // Handle error appropriately
      print('Error in getLogin: $error');
      rethrow;
    }
  }

  @override
  Future<ApiResponse> postSignup() async {
    try {
      // Replace the URL with your actual endpoint
      var successResponse = ApiResponse(success: true,status_code: 33, response: 'Data fetched successfully');
      return successResponse;
    } catch (error) {
      // Handle error appropriately
      print('Error in postLogin: $error');
      rethrow;
    }
  }
}