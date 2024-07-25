import 'package:flutter/material.dart';
import 'package:fluxestore/application.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  //To show the onbording screen only at the first installation
  await prefs.setInt("initScreen", 1);
  await dotenv.load(fileName: '.env');
  runApp(Application(
    token: prefs.getString("token"),
    initScreen: initScreen,
  ));
}