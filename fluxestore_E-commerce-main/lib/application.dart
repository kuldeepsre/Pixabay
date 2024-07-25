import 'package:flutter/material.dart';
import 'package:fluxestore/routes/routes.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'presentation/landing_page/landing_page.dart';

class Application extends StatelessWidget {
  final String? token;
  final int? initScreen;
  const Application({super.key, required this.token, required this.initScreen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "ProductSans",
        useMaterial3: true,
      ),
      initialRoute:
          (token != null && JwtDecoder.isExpired(token.toString()) == false)
              ? '/'
              : (initScreen == 0 || initScreen == null)
                  ? "onBording"
                  : 'Authentication',
      routes: {'/': (context) => LandingPage(token: token ?? '')},
      onGenerateRoute: MyGenerateRoute().generateRoute,
    );
  }
}