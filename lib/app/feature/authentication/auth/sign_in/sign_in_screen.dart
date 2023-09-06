import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:rgs_hris/app/common/util/app_strings.dart';
import 'package:rgs_hris/app/common/util/form_key_strings.dart';
import 'package:rgs_hris/core/ui/widget/elevated_button_widget.dart';
import 'package:rgs_hris/core/ui/widget/wrap_text_button.dart';
import 'package:rgs_hris/router/app_route.dart';

import '../../../../../core/ui/widget/text_form_field_widget.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
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
              children: [
                SizedBox(
                  height: 100,
                  child: Image.asset('assets/images/rgs_logo.png'),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey.withOpacity(0.5),
                ),
                _buildSignInHeaderWidget(),
                _buildSignInFormWidget(context),
                WrapTextButton(
                  leadingText: AppStrings.noAccountYet,
                  buttonText: AppStrings.signUp,
                  onPressed: () {
                    context.goNamed(AppRoute.signUp.name);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // build sign in header widget
  Widget _buildSignInHeaderWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 30),
      child: Column(
        children: [
          Text(
            AppStrings.welcomeHeader.toUpperCase(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            AppStrings.employeePortal.toUpperCase(),
            style: const TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  // build sign in form widget
  Widget _buildSignInFormWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: FormBuilder(
        key: formKey,
        child: Column(
          children: [
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
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButtonWidget(
              label: AppStrings.signIn.toUpperCase(),
              onPressed: () {
                context.goNamed(AppRoute.dashboard.name);
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
}
