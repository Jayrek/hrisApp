import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:rgs_hris/app/bloc/change_password/change_password_bloc.dart';
import 'package:rgs_hris/app/feature/dashboard/drawer_widget.dart';
import 'package:rgs_hris/router/app_route.dart';

import '../../../../core/ui/widget/text_form_field_widget.dart';
import '../../../bloc/my_access/my_access_bloc.dart';
import '../../../common/util/key_strings.dart';

class MyAccessChangePasswordScreen extends StatelessWidget {
  MyAccessChangePasswordScreen({super.key});

  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    context.read<MyAccessBloc>().add(MyAccessFetched());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'CHANGE PASSWORD',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      drawer: const DrawerWidget(),
      body: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordLoaded) {
            final response = state.wrapperDefaultResponse;
            showOkAlertDialog(
                context: context,
                title: response.response?.status,
                message: response.response?.message);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: FormBuilder(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'ACCOUNT DATA',
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        _buildInputItemWidget('CURRENT PASSWORD',
                            KeyStrings.updateCurrentPassword),
                        _buildInputItemWidget(
                            'NEW PASSWORD', KeyStrings.updateNewPassword),
                        _buildInputItemWidget('RE-TYPE PASSWORD',
                            KeyStrings.updateConfirmPassword),
                        const SizedBox(height: 10),
                        _buildChangePasswordButton(context),
                        const SizedBox(height: 10),
                        _buildChangeUserNameButton(context),
                      ],
                    ),
                  ),
                ),
              ),
              if (state is ChangePasswordLoading)
                const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
            ],
          );
        },
      ),
    );
  }

  // input item widget
  Widget _buildInputItemWidget(String label, String key) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.teal,
          ),
        ),
        const SizedBox(height: 10),
        TextFormFieldWidget(
          name: key,
          initialValue: '',
          isObscure: true,
          textInputType: TextInputType.visiblePassword,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  // change password button
  Widget _buildChangePasswordButton(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: () async {
          final currentPassword = formKey.currentState
                  ?.fields[KeyStrings.updateCurrentPassword]?.value ??
              '';
          final newPassword = formKey
                  .currentState?.fields[KeyStrings.updateNewPassword]?.value ??
              '';
          final confirmPassword = formKey.currentState
                  ?.fields[KeyStrings.updateConfirmPassword]?.value ??
              '';
          context.read<ChangePasswordBloc>().add(ChangePasswordSubmit(
                currentPassword: currentPassword,
                newPassword: newPassword,
                confirmPassword: confirmPassword,
              ));
        },
        child: const Text(
          'SAVE CHANGES',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // change username button
  Widget _buildChangeUserNameButton(BuildContext context) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
        child: const Text(
          'CHANGE USERNAME',
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () => context.pushNamed(
          AppRoute.myAccessChangeUserName.name,
        ),
      ),
    );
  }
}
