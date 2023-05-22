part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  const LoginEvent({
    required this.phoneNumber,
    required this.password,
  });

  final String phoneNumber;
  final String password;
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}

class UserLoad extends AuthEvent {
  const UserLoad();
}
