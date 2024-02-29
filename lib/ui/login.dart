import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/bloc_data/user_bloc.dart';

import '../model/user_data.dart';
import '../utils/constants.dart';
import 'common_ui.dart';

class Login extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    var userBloc = BlocProvider.of<UserBloc>(context);
    print("::: Destination - Login User state: ${userBloc.state.toString()}");

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                    child: Text(
                      "Login into your account  ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 20.0, bottom: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Email",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 20.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required.";
                        } else if (!EmailValidator.validate(value)) {
                          return "Email is not valid.";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Password",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is required";
                        } else if (value.length < 6) {
                          return "Password should be of atleast 6 character";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  BlocConsumer<UserBloc, UserState>(
                      builder: (BuildContext context, state) {
                    print("::: Destination - Builder - $state");

                    if (state is LoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.amber,
                        ),
                      );
                    } else {
                      return Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 30, 10.0, 30.0),
                        child: commonButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                print("::: Destination - On Click");

                                // saving data
                                UserData userData = UserData();
                                userData.email =
                                    emailController.value.toString();
                                userData.password =
                                    passwordController.value.toString();
                                userBloc.add(LoginEvent(userData: userData));
                              }
                            },
                            label: "Login"),
                      );
                    }
                  }, listener: (BuildContext context, state) {
                    print("::: Destination - Listener - $state");

                    if (state is LoginSuccessState) {
                      // navigate
                      print("::: Destination - Listener");
                      Navigator.pushNamed(context, Constants.homePage);
                    }
                  }),
                  Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Constants.signUpPage);
                          },
                          child: const Text(
                            "Don't have an account? Sign Up",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Image(
                      image: AssetImage("assets/unlock.png"),
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                  ),
                  const Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                    child: Text(
                      "Login into your account  ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 20.0, bottom: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Email",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 20.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required.";
                        } else if (!EmailValidator.validate(value)) {
                          return "Email is not valid.";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Password",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is required";
                        } else if (value.length < 6) {
                          return "Password should be of atleast 6 character";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  BlocBuilder(
                    builder: (BuildContext context, state) {
                      return  Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 30, 10.0, 30.0),
                        child: commonButton(
                            function: () => {
                              if (formKey.currentState!.validate()){
                                  Navigator.pushNamed(context, Constants.homePage)
                                }
                            },
                            label: "Login"),
                      );
                    },

                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Constants.signUpPage);
                          },
                          child: const Text(
                            "Don't have an account? Sign Up",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Image(
                      image: AssetImage("assets/unlock.png"),
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/
