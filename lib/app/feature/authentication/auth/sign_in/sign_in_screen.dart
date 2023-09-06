import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:rgs_hris/core/ui/widget/elevated_button_widget.dart';
import 'package:rgs_hris/router/app_route.dart';

import '../../../../../core/ui/widget/text_form_field_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: FormBuilder(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                      height: 100,
                      child: Image.asset('assets/images/rgs_logo.png')),
                  Divider(
                    height: 1,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'WELCOME TO ONLINE HRIS',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'EMPLOYEE PORTAL',
                    style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const TextFormFieldWidget(
                    name: 'username',
                    initialValue: '',
                    hint: 'Username',
                    textCapitalization: TextCapitalization.characters,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextFormFieldWidget(
                    name: 'password',
                    initialValue: '',
                    hint: 'Password',
                    isObscure: true,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButtonWidget(
                    label: 'SIGN IN',
                    onPressed: () {
                      context.goNamed(AppRoute.dashboard.name);
                    },
                    backgroundColor: Colors.red.shade400,
                    borderColor: Colors.red.shade400,
                    fontColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Text('Don\'t have an account yet?'),
                      TextButton(
                        onPressed: () {
                          context.goNamed(AppRoute.signUp.name);
                        },
                        child: const Text('Sign Up'),
                      )
                    ],
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
