part of 'user_bloc.dart';

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

class LoadingState extends UserState {
  LoadingState() : super(userData: UserData());
}

class SuccessState extends UserState {
  UserData userData;
  SuccessState({required this.userData}) : super(userData: UserData());
}
