import 'package:flutter/material.dart';
import 'package:flutter_projects/ui/edit_profile_page.dart';
import 'package:flutter_projects/ui/home.dart';
import 'package:flutter_projects/ui/home_page.dart';
import 'package:flutter_projects/ui/login.dart';
import 'package:flutter_projects/ui/profile_page.dart';
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
      initialRoute: Constants.editProfilePage,
      routes: {
        Constants.welcomePage: (context) => const WelcomePage(),
        Constants.loginPage: (context) => const Login(),
        Constants.homePage: (context) => const HomePage(),
        Constants.signUpPage: (context) => const SignUp(),
        Constants.profilePage: (context) => const ProfilePage(),
        Constants.editProfilePage: (context) => const EditProfilePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
