// login_controller.dart
import 'package:clean_tdd_architecture/Feature/api_response.dart';
import 'package:clean_tdd_architecture/Feature/data/model/DashboardModel.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class IDashboardController {
  Future<DashboardModel> getDashboard();

}

@lazySingleton
@injectable
class DashboardController implements IDashboardController {
  final Dio _dio = Dio(); // You can customize Dio with options if needed

  @override
  Future<DashboardModel> getDashboard() async {
    try {

      DashboardModel dashboardModel=DashboardModel(ok: true,response: true,message: "swtrtt");
       return dashboardModel;
    } catch (error) {
      // Handle error appropriately
      print('Error in getLogin: $error');
      rethrow;
    }
  }


}