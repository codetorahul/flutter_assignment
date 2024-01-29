import 'package:flutter/material.dart';
import 'package:flutter_projects/ui/home.dart';
import 'package:flutter_projects/ui/login.dart';
import 'package:flutter_projects/ui/signup.dart';
import 'package:flutter_projects/ui/welcome.dart';

import 'constants.dart';

void main() {
  runApp(const BasicPage());
}

class BasicPage extends StatelessWidget {
  const BasicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Constants.welcomePage,
      routes: {
        Constants.welcomePage: (context) => const WelcomePage(),
        Constants.loginPage: (context) => const Login(),
        Constants.homePage: (context) => const Home(),
        Constants.signUpPage: (context) => const SignUp(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
