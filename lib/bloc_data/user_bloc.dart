import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/bloc_data/user_events.dart';
import 'package:flutter_projects/bloc_data/user_model.dart';

class UserBloc extends Bloc<UserEvents, UserModel> {
  UserBloc() : super(UserModel()) {
    on<UserEvents>((event, emit) => {});
  }
}
