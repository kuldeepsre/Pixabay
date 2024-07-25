import 'package:flutter/material.dart';
import 'package:fluxestore/presentation/authentication/bloc/auth_page_bloc.dart';

class LoginPage extends StatefulWidget {
  final AuthPageBloc bloc;
  const LoginPage({super.key, required this.bloc});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    const Text(
                      "Login Into",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      "your account",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    //* Email
                    TextFormField(
                      controller: emailController,
                      autofocus: false,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                          return "Enter Your Email";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Enter Your Email",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //* Password
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter valid password";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black87),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(0),
                            fixedSize: MaterialStatePropertyAll(Size(147, 51)),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black87),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              widget.bloc.add(AuthPageLogInEvent(
                                  email: emailController.text,
                                  password: passwordController.text));
                            }
                          },
                          child: const Center(
                              child: Text(
                            "LOG IN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          )),
                        )),
                  ],
                ),
              ),

               //Google and apple Login for next relase
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      InkWell(
                        onTap: () =>
                            widget.bloc.add(AuthPageShowSignUpPageEvent()),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
