import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../core/ui/widget/elevated_button_widget.dart';
import '../../../../../core/ui/widget/text_form_field_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Sign Up'),
      // ),
      backgroundColor: Colors.white,
      body: FormBuilder(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      color: Colors.yellow,
                      height: 100,
                      child: Image.asset('assets/images/rgs_logo.png')),
                  const SizedBox(
                    height: 20,
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'EMPLOYEE / AGENT REGISTRATION',
                    style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextFormFieldWidget(
                    name: 'email',
                    hint: 'Email Address',
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextFormFieldWidget(
                    name: 'mobileNumber',
                    hint: 'Mobile Number',
                    textInputType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextFormFieldWidget(
                    name: 'username',
                    initialValue: '',
                    hint: 'Username',
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextFormFieldWidget(
                    name: 'confirmPassword',
                    initialValue: '',
                    hint: 'Confirm Password',
                    isObscure: true,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButtonWidget(
                    label: 'CONTINUE',
                    onPressed: () {},
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
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Sign In'),
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
