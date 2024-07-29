import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuldeeptask/ui/login_screen/login.dart';
import 'package:kuldeeptask/ui/signup.dart';

import '../bloc/spalsh.dart';
import 'home.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..loadResources(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is SplashLoaded) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignupScreen()),
              );
            } else if (state is SplashError) {
              // Handle error state
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.message}')),
              );
            }
          },
          builder: (context, state) {
            if (state is SplashInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SplashError) {
              return Center(
                child: Text('Error: ${state.message}'),
              );
            } else {
              return Center(
                child:Text("Wating...."),
              );
            }
          },
        ),
      ),
    );
  }
}