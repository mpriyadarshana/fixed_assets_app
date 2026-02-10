part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String token;
  final String firstname;
  final String lastname;
  final String email;

  LoginSuccessState({required this.token, required this.firstname, required this.lastname, required this.email});

}

class LoginFailedState extends LoginState {
  final String error;

  LoginFailedState({required this.error});
}
