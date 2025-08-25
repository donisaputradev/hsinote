import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hsinote/app/route.dart';
import 'package:hsinote/bloc/bloc.dart';
import 'package:hsinote/service/service.dart';
import 'package:hsinote/view/login/login.dart';

import 'theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    EasyLoading.instance.toastPosition = EasyLoadingToastPosition.bottom;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(UserLocalServiceImpl()),
        ),
        BlocProvider<NoteBloc>(
          create: (context) => NoteBloc(NoteLocalServiceImpl()),
        ),
      ],
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
