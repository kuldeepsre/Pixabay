import 'dart:async';
import 'dart:convert';

import 'package:clean_tdd_architecture/Feature/presentation/bloc/deshboard/dashboard_bloc.dart';
import 'package:clean_tdd_architecture/Feature/presentation/bloc/signup/signup_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'AppLocalizations.dart';
import 'Feature/domain/controller/dashboard_controller.dart';
import 'Feature/domain/controller/login_controller.dart';
import 'Feature/domain/controller/signup_controller.dart';
import 'Feature/presentation/bloc/login/login_bloc.dart';
import 'Routes/route_generator.dart';
import 'bloc/them/ThemeCubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'common_button/LocalizationKeys.dart';
import 'injectable.dart';
import 'package:http/http.dart' as http;
import '../AppLocalizations.dart';
import '../bloc/them/ThemeCubit.dart';
import 'notification/firebaseApi.dart';
final navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  configureDependencies();

  // Initialize your dependency injection
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        appId: "1:1019741035758:android:238cea16b600e3e7f367ff",
        messagingSenderId: "1019741035758	",
        projectId: "matrimonynotifications",
        apiKey: "AIzaSyB8IcTgDxSVHhcvcn2xlgYujiSxcEZ4130",
      ));

  await FirebaseApi().initNotification();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(getIt<ILoginController>()),
        ),
        BlocProvider<SignupBloc>(
          create: (context) => SignupBloc(getIt<ISignupController>()),
        ),
        BlocProvider<DashboardBloc>(
          create: (context) => DashboardBloc(getIt<IDashboardController>()),
        ),
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<LanguageCubit>(create: (context) => LanguageCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (themeContext, themeState) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (languageContext, languageState) {
              return MaterialApp(
                title: 'Day Night Mode Example',
                theme: themeState.themeData,
                locale: languageState.locale,
                localizationsDelegates: [
                  AppLocalizationsDelegate(languageState.locale),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', 'US'),
                  Locale('hi', 'IN'),
                  Locale('de', 'DE'),
                ],
                initialRoute: '/',
                onGenerateRoute: RouteGenerator.generateRoute,
                debugShowCheckedModeBanner: false,
                // home: MyHomePage(),
              );
            },
          );
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();
    // loginUser("kk","sdf");
    loadData();
  }

  // final String apiUrl = 'https://jsonplaceholder.typicode.com/posts/1';

  final String apiUrl = 'http://192.168.140.249:5000/products';

  Future<void> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.140.249:5000/login'), // Corrected URI
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': 'kk',
        'password': "admin",
      }),
    );
    print('Login successful $response');

    if (response.statusCode == 200) {
      print('Login successful');
    } else {
      print('Login failed: ${response.statusCode}');
      print(response.body);
    }
  }

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      Map<String, dynamic> data = json.decode(response.body);
      print("Data ===${data}");
      return data;
    } else {
      // Handle errors
      throw Exception('Failed to load data');
    }
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    //Navigator.of(context).pushReplacementNamed('/home');
    //  Navigator.of(context).pushReplacementNamed('/LoginForm');
    //   Navigator.of(context).pushReplacementNamed('/LoginPage1');
    //   Navigator.of(context).pushReplacementNamed('/LoginPage2');
    // Navigator.of(context).pushReplacementNamed('/payment_page');
   // Navigator.of(context).pushReplacementNamed('/homeBody');
    Navigator.of(context).pushReplacementNamed('/LoginApp');
    //   Navigator.of(context).pushReplacementNamed('/taskScreen');
    //   Navigator.of(context).pushReplacementNamed('/daily_remainder');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.black,
                  Colors.green,
                  Colors.blue,
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations(context.read<LanguageCubit>().state.locale)
                      .translate(LocalizationKeys.sHeader),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),


          // Center(
          //   child: FutureBuilder<Map<String, dynamic>>(
          //     future: fetchData(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return CircularProgressIndicator();
          //       } else if (snapshot.hasError) {
          //         return Text('Error: ${snapshot.error}');
          //       } else {
          //         // Display the data received from the API
          //         return Text('API Response: ${snapshot.data}');
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
