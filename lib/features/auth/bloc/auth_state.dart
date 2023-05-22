part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class LoginLoading extends AuthState {}

class LoginError extends AuthState {
  const LoginError(this.error);

  final String error;
}

class LoginSuccess extends AuthState {}

class LogoutSuccess extends AuthState {}

class UserLoaded extends AuthState {
  const UserLoaded(this.user);

  final User user;
}

class UserLoadError extends AuthState {
  const UserLoadError({this.error});

  final String? error;
}
