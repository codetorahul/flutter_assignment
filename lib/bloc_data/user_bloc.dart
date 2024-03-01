import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user_data.dart';
import '../utils/constants.dart';

part 'user_events.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  UserBloc() : super(InitialState(UserData())) {
    on<LoginEvent>(
      (event, emit) async {
        emit(LoadingState());
        await Future.delayed(const Duration(seconds: Constants.DELAY_TIME), () {
          emit(SuccessState(userData: event.userData));
        });
      },
    );
    on<AddProfileEvent>((event, emit) async {
      emit(LoadingState());
      await Future.delayed(const Duration(seconds: Constants.DELAY_TIME), () {
        emit(SuccessState(userData: event.userData));
      });
    });
    on<UpdateProfileEvent>((event, emit) {
      // _updateProfileFunction(event, emit);
    });
  }

  /* void _loginUserFunction(LoginEvent event, Emitter<UserState> emit) async {
    print("::: Destination - LOGIN bEFORE DELAY");
    state.userData = event.userData;
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 10), () {
      print("::: Destination - LOGIN AFTER DELAY");
      emit(SuccessState(userData: state.userData));
    });
  }

  void _addProfileFunction(AddProfileEvent event, Emitter<UserState> emit) {
    state.userData = event.userData;
    emit(UpdatedState(state.userData));
  }

  void _updateProfileFunction(
      UpdateProfileEvent event, Emitter<UserState> emit) {
    state.userData = event.userData;
    emit(UpdatedState(state.userData));
  }*/
}
