part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String token;

  LoginSuccessState({required this.token});

}

class LoginFailedState extends LoginState {
  final String error;

  LoginFailedState({required this.error});
}
