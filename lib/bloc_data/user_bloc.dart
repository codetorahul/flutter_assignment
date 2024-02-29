import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user_data.dart';

part 'user_events.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  UserBloc() : super(InitialState(UserData())) {
    on<LoginEvent>(
      (event, emit) async {
        print("::: Destination - LOGIN bEFORE DELAY");

        state.userData = event.userData;
        emit(LoadingState(userData: state.userData));
        await Future.delayed(const Duration(seconds: 10), () {
          print("::: Destination - LOGIN AFTER DELAY");
          emit(LoginSuccessState(userData: state.userData));
        });
      },
    );
    on<AddProfileEvent>((event, emit) {
      _addProfileFunction;
    });
    on<UpdateProfileEvent>((event, emit) {
      _updateProfileFunction;
    });
  }

  void _loginUserFunction(LoginEvent event, Emitter<UserState> emit) {
    print("::: Destination - LOGIN bEFORE DELAY");

    state.userData = event.userData;
    emit(LoadingState(userData: state.userData));
    Future.delayed(const Duration(seconds: 10000));

    print("::: Destination - LOGIN AFTER DELAY");

    emit(LoginSuccessState(userData: state.userData));
  }

  void _addProfileFunction(AddProfileEvent event, Emitter<UserState> emit) {
    state.userData = event.userData;
    emit(UpdatedState(state.userData));
  }

  void _updateProfileFunction(
      UpdateProfileEvent event, Emitter<UserState> emit) {
    state.userData = event.userData;
    emit(UpdatedState(state.userData));
  }
}
