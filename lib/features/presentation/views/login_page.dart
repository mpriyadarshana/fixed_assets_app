import 'dart:ui';

import 'package:fixed_assets_app/features/data/models/request/login_request.dart';
import 'package:fixed_assets_app/features/presentation/bloc/login/login_bloc.dart';
import 'package:fixed_assets_app/features/presentation/views/home_page.dart';
import 'package:fixed_assets_app/features/presentation/widgets/custom_dialog_box.dart';
import 'package:fixed_assets_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/app_styles.dart';
import '../../data/models/request/new_login_request.dart';
import '../widgets/custom_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isProgressShow = false;

  TextEditingController emailTxtController = TextEditingController();
  TextEditingController passwordTxtController = TextEditingController();

  final LoginBloc _bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return BlocListener<LoginBloc, LoginState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is LoadingState) {
          showProgress();
        } else if (state is LoginSuccessState) {
          hideProgressBar();
          setState(() {
            AppConstants.jwtToken = state.token;
            AppConstants.firstname = state.firstname;
            AppConstants.lastname = state.lastname;
            AppConstants.email = state.email;
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        } else if (state is LoginFailedState) {
          hideProgressBar();

          CustomDialogBox.show(context,
              image: false,
              title: 'Failed',
              message: 'Invalid credentials or something went wrong !',
              isTwoButton: false,
              positiveButtonText: 'Try again', positiveButtonTap: () {
            Navigator.pop(context);
          });
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xffc8c8c8),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: height * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Account Login',
                            style: AppStyles.semiBoldTextSize30
                                .copyWith(color: const Color(0xff5C5C5C))),
                        SizedBox(height: height * 0.05),
                        Material(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Email',
                                      style: AppStyles.semiBoldTextSize14White
                                          .copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                    ),
                                    const SizedBox(height: 10),
                                    CustomFormField(
                                      prefixIconColor: const Color(0xff5C5C5C),
                                      prefixIcon: const Icon(
                                          Icons.alternate_email_rounded),
                                      controller: emailTxtController,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Password',
                                      style: AppStyles.semiBoldTextSize14White
                                          .copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                    ),
                                    const SizedBox(height: 10),
                                    CustomFormField(
                                      controller: passwordTxtController,
                                      isObsecure: true,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Forgot Password ?',
                                    style: AppStyles.regularTextSize12White
                                        .copyWith(color: Colors.blue),
                                  ),
                                ),
                                const SizedBox(height: 14),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.03),
                        Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                  horizontal: width * 0.3,
                                  vertical: 15,
                                ),
                              ),
                              backgroundColor: const WidgetStatePropertyAll(
                                Colors.blue,
                              ),
                              elevation: const WidgetStatePropertyAll(2),
                            ),
                            onPressed: () async {
                              _bloc.add(
                                UserLoginEvent(
                                  request: NewLoginRequest(
                                      email: emailTxtController.text,
                                      password: passwordTxtController.text
                                  ),
                                ),
                              );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const HomePage(),
                              //   ),
                              // );
                            },
                            child: Text(
                              'Login',
                              style: AppStyles.mediumTextSize16White,
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'New to the app ? ',
                              style: AppStyles.regularTextSize12White
                                  .copyWith(color: Colors.black),
                            ),
                            Material(
                              child: InkWell(
                                borderRadius: BorderRadius.circular(15),
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 5),
                                  child: Text(
                                    'Register',
                                    style: AppStyles.semiBoldTextSize12Green
                                        .copyWith(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 32),
                child: Text(
                  'ARTHUR C CLARKE INSTITUTE FOR MODERN\nTECHNOLOGIES (ACCIMT)',
                  style: AppStyles.mediumTextSize10.copyWith(
                    color: Colors.black.withOpacity(0.2),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showProgress() {
    if (!_isProgressShow) {
      setState(() {
        _isProgressShow = true;
      });

      showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionBuilder: (context, a1, a2, widget) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    alignment: FractionalOffset.center,
                    child: Wrap(
                      children: [
                        Container(
                          color: Colors.transparent,
                          height: 150,
                          width: 150,
                          // child: CircularProgressIndicator(),
                          child: Lottie.asset('assets/lottie/loading3.json'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Container();
        },
      );
    }
  }

  void hideProgressBar() {
    if (_isProgressShow) {
      Navigator.pop(context);
      _isProgressShow = false;
    }
  }
}
