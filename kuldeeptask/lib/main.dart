import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kuldeeptask/ui/spalsh_screen.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  //  await Firebase.initializeApp();
  await Firebase.initializeApp(
       name:" App" ,
       options: const FirebaseOptions(
        appId: "1:887233064346:android:af2fedb571943b97719e23",
        messagingSenderId: "927744815392 ",
        projectId: "demoapp-4768f",
        apiKey: "AIzaSyBxyojZ3040CkSvp0s5k8skmR1mXz-pLvY",
      ));



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

