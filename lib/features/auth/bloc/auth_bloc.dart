import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_appointment/core/storage/user_storage.dart';

import '../../../core/validations/validations.dart';
import '../model/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(LoginLoading()) {
    on<LoginEvent>(_handleLoginEvent);
    on<LogoutEvent>(_handleLogOutEvent);
  }

  Future<void> _handleLoginEvent(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final List<User> users = await UserStorage.getUsers();
      if (FormValidation.isValidPassword(event.password) != null ||
          FormValidation.isValidPhoneNumber(event.phoneNumber) != null) {
        emit(const LoginError('invalid-account'));
        return;
      }
      if (FormValidation.isLoginSuccess(
          users, event.phoneNumber, event.password)) {
        final user = users
            .where((e) =>
                e.phoneNumber == event.phoneNumber &&
                e.password == event.password)
            .first;
        await UserStorage.setUser(user);
        emit(LoginSuccess());
      } else {
        emit(const LoginError('incorrect-account'));
      }
    } on Exception catch (e) {
      emit(
        LoginError(e.toString()),
      );
    }
  }

  Future<void> _handleLogOutEvent(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) async {}
}
