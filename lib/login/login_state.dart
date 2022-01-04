import 'package:notes/login/model/user_model.dart';

abstract class LoginState {}

class LoginStateEmpty extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateError extends LoginState {
  final String message;
  LoginStateError({required this.message});
}

class LoginStateSuccess extends LoginState {
  final UserModel user;
  LoginStateSuccess({required this.user});
}
