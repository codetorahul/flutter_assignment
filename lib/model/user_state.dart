part of '../bloc_data/user_bloc.dart';

class UserState {
  UserData userData;
  UserState({required this.userData});
}

class InitialState extends UserState {
  InitialState(UserData userData) : super(userData: userData);
}

class UpdatedState extends UserState {
  UpdatedState(UserData userData) : super(userData: userData);
}
