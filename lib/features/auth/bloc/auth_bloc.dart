import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_appointment/core/storage/user_storage.dart';

import '../../../core/validations/validations.dart';
import '../model/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(LoginInitial()) {
    on<LoginEvent>(_handleLoginEvent);
  }

  Future<void> _handleLoginEvent(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final List<User> users = await UserStorage.getUsers();

      emit(LoginLoading());
      if (FormValidation.isLoginSuccess(
          users, event.phoneNumber, event.password)) {
        emit(LoginSuccess());
      } else {
        emit(const LoginError());
      }
    } on Exception catch (e) {
      emit(
        LoginError(e.toString()),
      );
    }
  }
}
