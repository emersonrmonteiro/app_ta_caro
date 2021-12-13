import 'package:app_ta_caro/modules/home/home_pade.dart';
import 'package:app_ta_caro/modules/login/pages/create_acount/create_account.dart';
import 'package:app_ta_caro/modules/splash.dart';
import 'package:flutter/material.dart';

import 'modules/login/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Race #1",
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashPage(),
        "/login": (context) => const LoginPage(),
        "/login/create-account": (context) => const CreateAccountPage(),
        "/home": (context) => const HomePage(),
      },
    );
  }
}
