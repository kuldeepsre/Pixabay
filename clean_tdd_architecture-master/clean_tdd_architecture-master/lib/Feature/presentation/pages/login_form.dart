import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login/login_bloc.dart';
import '../components/custom_app_bar.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CustomAppBar(

        visible: true,
        title: "Login Form",

      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginFetchingState || state is LodginPostingState) {
            // Display a loading indicator while fetching or posting
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoginFetchingSuccessState ||
              state is LoginPostingSuccessState) {
            // Handle success state, you might want to navigate to another screen
            return const Center(child: Text('Login successful!'));
          } else if (state is LoginFetchingFailureState ||
              state is LoginPostingFailureState) {
            // Display an error message on failure
            // return Center(child: Text('Login failed: ${state.errorMessage}const '));

            return const Center(child: Text('Login failed: '));
          } else {
            // Initial state or any other state
            return Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF3498db), Color(0xFF2ecc71)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
              child: ClipPath(
                clipper: LoginClipper(),
                child: Center
                  (child:
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TextField(
                        decoration: InputDecoration(labelText: 'Username'),
                      ),
                      const SizedBox(height: 20),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Password'),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {

                          Map<String, String> data = {
                            "username": "kk",
                            "password": "admin"
                          };
                          context.read<LoginBloc>().add(LoginPostEvent(body: data));
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),),
              ),
            );

        }
        },
      ),
    );
  }
}

class LoginClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 80,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
