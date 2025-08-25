import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hsinote/app/size.dart';
import 'package:hsinote/bloc/auth/auth_bloc.dart';
import 'package:hsinote/enum/status_enum.dart';
import 'package:hsinote/extension/size_extension.dart';
import 'package:hsinote/view/home/home.dart';
import 'package:hsinote/view/register/register.dart';
import 'package:hsinote/component/component.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    context.read<AuthBloc>().add(CheckAuthEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == StatusEnum.loading) {
          EasyLoading.show(status: 'Loading...');
        }
        if (state.status == StatusEnum.failure) {
          EasyLoading.showToast(state.error.toString());
        }
        if (state.status == StatusEnum.success) {
          EasyLoading.dismiss();
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.routeName,
            (_) => false,
          );
        }
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSize.s16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RegularText.title('Let’s Login'),
                  AppSize.s16.height,
                  RegularText('And notes your idea'),
                  AppSize.s32.height,
                  RegularTextInput(
                    controller: emailController,
                    label: 'Email Address',
                    hintText: 'example@mail.com',
                    keyboardType: TextInputType.emailAddress,
                    validator: ValidationBuilder().email().build(),
                  ),
                  AppSize.s16.height,
                  PasswordTextInput(
                    controller: passwordController,
                    label: 'Password',
                    hintText: '********',
                    validator: ValidationBuilder().minLength(6).build(),
                  ),
                  AppSize.s70.height,
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        context.read<AuthBloc>().add(
                          LoginAuthEvent(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                      } else {
                        EasyLoading.showToast('Data belum lengkap!');
                      }
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
        ),
      ),
    );
  }
}
