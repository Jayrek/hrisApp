import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rgs_hris/app/common/util/app_strings.dart';
import 'package:rgs_hris/app/common/util/form_key_strings.dart';

import '../../../../../core/ui/widget/elevated_button_widget.dart';
import '../../../../../core/ui/widget/text_form_field_widget.dart';
import '../../../../../core/ui/widget/wrap_text_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                mainAxisAlignment: MainAxisAlignment.center,
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
                  Text(
                    AppStrings.employeeAgentRegistration.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const TextFormFieldWidget(
                    name: FormKeyStrings.emailAddress,
                    hint: AppStrings.emailAddress,
                    textInputType: TextInputType.emailAddress,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextFormFieldWidget(
                    name: FormKeyStrings.mobileNumber,
                    hint: AppStrings.mobileNumber,
                    textInputType: TextInputType.phone,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextFormFieldWidget(
                    name: FormKeyStrings.username,
                    initialValue: '',
                    hint: AppStrings.username,
                    textCapitalization: TextCapitalization.characters,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextFormFieldWidget(
                    name: FormKeyStrings.password,
                    initialValue: '',
                    hint: AppStrings.password,
                    isObscure: true,
                    textInputType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextFormFieldWidget(
                    name: FormKeyStrings.confirmPassword,
                    initialValue: '',
                    hint: AppStrings.confirmPassword,
                    isObscure: true,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButtonWidget(
                    label: AppStrings.continueLabel.toUpperCase(),
                    onPressed: () {},
                    backgroundColor: Colors.red.shade400,
                    borderColor: Colors.red.shade400,
                    fontColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  WrapTextButton(
                    leadingText: AppStrings.alreadyHaveAnAccount,
                    buttonText: AppStrings.signIn,
                    onPressed: () => Navigator.of(context).pop(),
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
