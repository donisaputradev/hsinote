import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hsinote/app/route.dart';
import 'package:hsinote/bloc/auth/auth_bloc.dart';
import 'package:hsinote/view/login/login.dart';

import 'theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'HSI Note',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        onGenerateRoute: AppRoute.routes,
        home: LoginPage(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
