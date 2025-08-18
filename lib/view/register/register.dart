import 'package:flutter/material.dart';
import 'package:hsinote/app/size.dart';
import 'package:hsinote/component/password_text_input.dart';
import 'package:hsinote/component/regular_app_bar.dart';
import 'package:hsinote/component/regular_text.dart';
import 'package:hsinote/component/regular_text_input.dart';
import 'package:hsinote/extension/size_extension.dart';
import 'package:hsinote/view/home/home.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RegularAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSize.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RegularText.title('Register'),
            AppSize.s16.height,
            RegularText('And start taking notes'),
            AppSize.s32.height,
            RegularTextInput(label: 'Full Name', hintText: 'Example: John Doe'),
            AppSize.s16.height,
            RegularTextInput(
              label: 'Email Address',
              hintText: 'Example: johndoe@gmail.com',
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
              child: Text('Register'),
            ),
            AppSize.s16.height,
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Already have an account? Login here'),
            ),
          ],
        ),
      ),
    );
  }
}
