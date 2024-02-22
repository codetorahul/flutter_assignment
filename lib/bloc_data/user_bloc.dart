import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_data.dart';

part '../model/user_state.dart';
part 'user_events.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  UserBloc() : super(InitialState(UserData())) {
    on<LoginEvent>((event, emit) {
      _loginUserFunction;
    });
    on<AddProfileEvent>((event, emit) {
      _addProfileFunction;
    });
    on<UpdateProfileEvent>((event, emit) {
      _updateProfileFunction;
    });
  }

  void _loginUserFunction(LoginEvent event, Emitter<UserState> emit) {
    state.userData = event.userData;
    emit(UpdatedState(state.userData));
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
