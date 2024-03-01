import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/bloc_data/user_bloc.dart';

import '../model/user_data.dart';
import '../utils/constants.dart';
import 'common_ui.dart';

class SignUp extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  String _passwordText = "";

  @override
  Widget build(BuildContext context) {
    var userBloc = BlocProvider.of<UserBloc>(context);
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Sign up",
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
                      "Create an account. It's free",
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
                        "Username",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 20.0),
                    child: TextFormField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username is required.";
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
                            _passwordText = value;
                            return null;
                          }
                        }),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Confirm Password",
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
                          return "Confirm Password is required";
                        } else if (_passwordText.isNotEmpty &&
                            value != _passwordText) {
                          return "Password and Confirm Password must be same.";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  BlocConsumer<UserBloc, UserState>(
                    builder: (BuildContext context, state) {
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
                                var state = formKey.currentState;
                                if (state != null && state.validate()) {
                                  var userData = UserData();
                                  userData.userName = usernameController.text;
                                  userData.email = emailController.text;
                                  userData.password = passwordController.text;
                                  userBloc
                                      .add(AddProfileEvent(userData: userData));
                                }
                              },
                              label: "Sign up"),
                        );
                      }
                    },
                    listener: (BuildContext context, UserState? state) {
                      if (state is SuccessState) {
                        Navigator.pushNamed(context, Constants.homePage);
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: const Text(
                        "Already have an account? Login",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
