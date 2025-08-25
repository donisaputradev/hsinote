import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hsinote/app/size.dart';
import 'package:hsinote/bloc/auth/auth_bloc.dart';
import 'package:hsinote/extension/size_extension.dart';
import 'package:hsinote/component/component.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const String routeName = '/register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RegularAppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSize.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RegularText.title('Register'),
              AppSize.s16.height,
              RegularText('And start taking notes'),
              AppSize.s32.height,
              RegularTextInput(
                controller: nameController,
                label: 'Full Name',
                hintText: 'Example: John Doe',
                validator: ValidationBuilder().minLength(3).build(),
              ),
              AppSize.s16.height,
              RegularTextInput(
                controller: emailController,
                label: 'Email Address',
                hintText: 'Example: johndoe@gmail.com',
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
                      RegisterAuthEvent(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    );
                  } else {
                    EasyLoading.showToast('Data belum lengkap!');
                  }
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
      ),
    );
  }
}
