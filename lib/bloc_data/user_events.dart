part of 'user_bloc.dart';

abstract class UserEvents {}

class LoginEvent extends UserEvents {
  final UserData userData;

  LoginEvent({required this.userData});
}

class AddProfileEvent extends UserEvents {
  final UserData userData;

  AddProfileEvent({required this.userData});
}

class UpdateProfileEvent extends UserEvents {
  final UserData userData;

  UpdateProfileEvent({required this.userData});
}
