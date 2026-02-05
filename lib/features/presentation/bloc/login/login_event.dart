part of 'login_bloc.dart';

abstract class LoginEvent {}

class UserLoginEvent extends LoginEvent {
  final NewLoginRequest request;

  UserLoginEvent({required this.request});
}
