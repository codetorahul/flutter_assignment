import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/bloc_data/user_bloc.dart';
import 'package:flutter_projects/ui/edit_profile_page.dart';
import 'package:flutter_projects/ui/home_page.dart';
import 'package:flutter_projects/ui/login.dart';
import 'package:flutter_projects/ui/profile_page.dart';
import 'package:flutter_projects/ui/signup.dart';
import 'package:flutter_projects/ui/welcome.dart';

import 'utils/constants.dart';

void main() {
  runApp(const BasicPage());
}

class BasicPage extends StatelessWidget {
  const BasicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: MaterialApp(
        initialRoute: Constants.welcomePage,
        routes: {
          Constants.welcomePage: (context) => const WelcomePage(),
          Constants.loginPage: (context) => Login(),
          Constants.homePage: (context) => const HomePage(),
          Constants.signUpPage: (context) => SignUp(),
          Constants.profilePage: (context) => const ProfilePage(),
          Constants.editProfilePage: (context) => const EditProfilePage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
