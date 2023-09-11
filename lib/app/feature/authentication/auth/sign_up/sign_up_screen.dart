import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:rgs_hris/app/common/util/app_strings.dart';
import 'package:rgs_hris/app/common/util/key_strings.dart';

import '../../../../../core/ui/widget/elevated_button_widget.dart';
import '../../../../../core/ui/widget/text_form_field_widget.dart';
import '../../../../../core/ui/widget/wrap_text_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
                _buildSignUpHeaderWidget(),
                _buildSignUpFormWidget(),
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
    );
  }

  // build sign up header widget
  Widget _buildSignUpHeaderWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 30),
      child: Text(
        AppStrings.employeeAgentRegistration.toUpperCase(),
        style: const TextStyle(
            color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 10),
      ),
    );
  }

  // build sign up form widget
  Widget _buildSignUpFormWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: FormBuilder(
        key: formKey,
        child: Column(
          children: [
            TextFormFieldWidget(
              name: KeyStrings.emailAddress,
              hint: AppStrings.emailAddress,
              textInputType: TextInputType.emailAddress,
              fontWeight: FontWeight.bold,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'email is required'),
                FormBuilderValidators.email(errorText: 'not valid email'),
              ]),
              errorFontSize: 12,
            ),
            const SizedBox(
              height: 10,
            ),
            const TextFormFieldWidget(
              name: KeyStrings.mobileNumber,
              hint: AppStrings.mobileNumber,
              textInputType: TextInputType.phone,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            const TextFormFieldWidget(
              name: KeyStrings.username,
              initialValue: '',
              hint: AppStrings.username,
              textCapitalization: TextCapitalization.characters,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            const TextFormFieldWidget(
              name: KeyStrings.password,
              initialValue: '',
              hint: AppStrings.password,
              isObscure: true,
              textInputType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 10,
            ),
            const TextFormFieldWidget(
              name: KeyStrings.confirmPassword,
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
              onPressed: () {
                _signUp();
              },
              backgroundColor: Colors.red.shade400,
              borderColor: Colors.red.shade400,
              fontColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  void _signUp() {
    if (formKey.currentState!.saveAndValidate()) {
      final email =
          formKey.currentState!.fields[KeyStrings.emailAddress]!.value;
      final mobileNumber =
          formKey.currentState?.fields[KeyStrings.mobileNumber]?.value;
      final username =
          formKey.currentState?.fields[KeyStrings.username]?.value;
      final password =
          formKey.currentState?.fields[KeyStrings.password]?.value;
      final confirmPassword =
          formKey.currentState?.fields[KeyStrings.confirmPassword]?.value;

      debugPrint('email: $email');
      debugPrint('mobileNumber: $mobileNumber');
      debugPrint('username: $username');
      debugPrint('password: $password');
      debugPrint('confirmPassword: $confirmPassword');
    }
  }
}
