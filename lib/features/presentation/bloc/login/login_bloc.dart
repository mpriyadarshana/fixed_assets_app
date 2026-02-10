
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fixed_assets_app/features/data/models/request/new_login_request.dart';
import 'package:fixed_assets_app/features/data/models/response/login_response.dart';
import 'package:fixed_assets_app/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/request/login_request.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Dio dio = Dio();

  LoginBloc() : super(LoginInitial()) {
    on<UserLoginEvent>(_login);
  }

  Future<void> _login(UserLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoadingState());
    try {
      LoginRequest loginRequest = LoginRequest(
        data: Data(
          request: Request(
            model: Model(
              email: event.request.email,
              password: event.request.password,
            ),
          ),
        ),
      );

      print('awaiting...');
       final res = await dio.post('${AppConstants.baseUrl}auth/user/login/',
           options: Options(
             headers: {"Content-Type": "application/json",
               "Accept": "application/json"
             },
             followRedirects: false,
             validateStatus: (status) => true,
           ),
           data: loginRequestToJson(loginRequest)
       );
       log(res.statusCode.toString());


      if (res.statusCode == 200) {
        final LoginResponse loginResponse = loginResponseFromJson(res.data);
        emit(LoginSuccessState(token: loginResponse.data.response.model.token, firstname: loginResponse.data.response.model.firstname, lastname: loginResponse.data.response.model.lastname, email: loginResponse.data.response.model.email));
      }else if (res.statusCode == 401) {
        emit(LoginFailedState(error: '401'));
      }

      print('done');
      log('message');
    } catch (e) {
      print(e);
      emit(LoginFailedState(error: e.toString()));
    }
  }
}
