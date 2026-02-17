import 'package:fixed_assets_app/features/presentation/bloc/item/item_bloc.dart';
import 'package:fixed_assets_app/features/presentation/bloc/login/login_bloc.dart';
import 'package:fixed_assets_app/features/presentation/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Color(0xffc8c8c8),
          systemNavigationBarIconBrightness: Brightness.dark),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<ItemBloc>(
          create: (context) => ItemBloc(),
        ),
      ],
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle.dark,
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffCACACD)),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashView(),
        ),
      ),
    );
  }
}
