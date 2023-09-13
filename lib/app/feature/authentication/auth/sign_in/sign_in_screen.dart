import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:rgs_hris/app/common/util/app_strings.dart';
import 'package:rgs_hris/app/common/util/key_strings.dart';
import 'package:rgs_hris/core/ui/widget/elevated_button_widget.dart';
import 'package:rgs_hris/core/ui/widget/wrap_text_button.dart';
import 'package:rgs_hris/router/app_route.dart';

import '../../../../../core/ui/widget/text_form_field_widget.dart';
import '../../../../bloc/auth/auth_bloc.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSignInSuccess) {
          context.goNamed(AppRoute.attendance.name);
        }
        if (state is AuthSignInException) {
          debugPrint('print exception message here...');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Padding(
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
                        _buildUnAuthorizeWidget(state),
                        _buildSignInFormWidget(context, state),
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
              if (state is AuthLoading)
                const Center(child: CircularProgressIndicator.adaptive())
            ],
          ),
        );
      },
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
  Widget _buildSignInFormWidget(
    BuildContext context,
    AuthState state,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: FormBuilder(
        key: formKey,
        child: Column(
          children: [
            TextFormFieldWidget(
              name: KeyStrings.usernameKey,
              initialValue: '',
              hint: AppStrings.username,
              textCapitalization: TextCapitalization.characters,
              fontWeight: FontWeight.bold,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: 'user name is required'),
              ]),
              errorFontSize: 12,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormFieldWidget(
              name: KeyStrings.passwordKey,
              initialValue: '',
              hint: AppStrings.password,
              isObscure: true,
              textInputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: 'password is required'),
              ]),
              errorFontSize: 12,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButtonWidget(
              label: AppStrings.signIn.toUpperCase(),
              onPressed: () {
                // if (formKey.currentState!.saveAndValidate()) {
                _signIn(context);

                // }

                // context.goNamed(AppRoute.dashboard.name);
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

  Future<void> _signIn(BuildContext context) async {
    final username =
        formKey.currentState?.fields[KeyStrings.usernameKey]?.value ?? '';
    final password =
        formKey.currentState?.fields[KeyStrings.passwordKey]?.value ?? '';

    context
        .read<AuthBloc>()
        .add(AuthSignInSubmit(username: username, password: password));

    // context.read<AuthBloc>().add(const AuthSignInSubmit(
    //     username: 'CRUZ06061988', password: '06061988'));
  }

  Widget _buildUnAuthorizeWidget(AuthState authState) {
    if (authState is AuthSignInException) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          authState.message,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.red,
          ),
        ),
      );
    }
    return const SizedBox();
  }
}
