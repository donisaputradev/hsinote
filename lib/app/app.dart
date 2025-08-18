import 'package:flutter/material.dart';
import 'package:hsinote/app/route.dart';
import 'package:hsinote/view/login/login.dart';

import 'theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HSI Note',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      onGenerateRoute: AppRoute.routes,
      home: LoginPage(),
    );
  }
}
