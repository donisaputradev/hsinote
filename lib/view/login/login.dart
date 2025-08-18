import 'package:flutter/material.dart';
import 'package:hsinote/app/size.dart';
import 'package:hsinote/component/password_text_input.dart';
import 'package:hsinote/component/regular_text.dart';
import 'package:hsinote/component/regular_text_input.dart';
import 'package:hsinote/extension/size_extension.dart';
import 'package:hsinote/view/home/home.dart';
import 'package:hsinote/view/register/register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSize.s16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RegularText.title('Let’s Login'),
              AppSize.s16.height,
              RegularText('And notes your idea'),
              AppSize.s32.height,
              RegularTextInput(
                label: 'Email Address',
                hintText: 'example@mail.com',
                keyboardType: TextInputType.emailAddress,
              ),
              AppSize.s16.height,
              PasswordTextInput(label: 'Password', hintText: '********'),
              AppSize.s70.height,
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    HomePage.routeName,
                    (_) => false,
                  );
                },
                child: Text('Login'),
              ),
              AppSize.s16.height,
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegisterPage.routeName);
                },
                child: Text('Don’t have any account? Register here'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
