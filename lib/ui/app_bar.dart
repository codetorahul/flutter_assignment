import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/bloc_data/user_bloc.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
        gradient: LinearGradient(
          colors: [Colors.blue.shade700, Colors.blue.shade900, Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (BuildContext context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.userData.userName.isNotEmpty
                            ? state.userData.userName
                            : state.userData.email,
                        style: const TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 10.0),
                      const Text("Sub Text",
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.white)),
                    ],
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30.0,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProfileToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 10.0, top: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Profile",
                style: TextStyle(fontSize: 25.0, color: Colors.black),
                maxLines: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 20.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfileToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 10.0, top: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25.0, color: Colors.black),
                maxLines: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
