import 'package:clean_tdd_architecture/Feature/domain/controller/dashboard_controller.dart';
import 'package:injectable/injectable.dart';
import 'Feature/domain/controller/login_controller.dart';
import 'package:get_it/get_it.dart';

import 'Feature/domain/controller/signup_controller.dart';

final GetIt getIt = GetIt.instance;

void configureDependencies() {
  // Register your dependencies manually
  getIt.registerSingleton<ILoginController>(LoginController());
  getIt.registerSingleton<ISignupController>(SignupController());
  getIt.registerSingleton<IDashboardController>(DashboardController());
  // Add other dependencies as needed
}
