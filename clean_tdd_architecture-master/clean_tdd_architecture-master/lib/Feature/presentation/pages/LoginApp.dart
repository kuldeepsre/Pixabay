import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E5EC), // Background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              // Neumorphic(
              //   style: NeumorphicStyle(
              //     shape: NeumorphicShape.flat,
              //     depth: 8,
              //     intensity: 0.7,
              //     color: Colors.grey.shade200,
              //   ),
              //   child: const TextField(
              //     decoration: InputDecoration(
              //       hintText: 'Username',
              //       border: InputBorder.none,
              //       contentPadding: EdgeInsets.symmetric(horizontal: 20),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 20),
              // Neumorphic(
              //   style: NeumorphicStyle(
              //     shape: NeumorphicShape.flat,
              //     depth: 8,
              //     intensity: 0.7,
              //     color: Colors.grey.shade200,
              //   ),
              //   child: const TextField(
              //     obscureText: true,
              //     decoration: InputDecoration(
              //       hintText: 'Password',
              //       border: InputBorder.none,
              //       contentPadding: EdgeInsets.symmetric(horizontal: 20),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 20),
              // NeumorphicButton(
              //   onPressed: () {},
              //   style: const NeumorphicStyle(
              //     shape: NeumorphicShape.flat,
              //     depth: 8,
              //     intensity: 0.7,
              //     color: Colors.blue,
              //   ),
              //   child: Container(
              //     width: double.infinity,
              //     padding: const EdgeInsets.symmetric(vertical: 16),
              //     alignment: Alignment.center,
              //     child: const Text(
              //       'Login',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 18,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
