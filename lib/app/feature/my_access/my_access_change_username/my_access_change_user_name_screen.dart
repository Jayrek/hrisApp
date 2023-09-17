import 'package:flutter/material.dart';

import '../../../../core/ui/widget/text_form_field_widget.dart';
import '../../../common/util/key_strings.dart';
import '../../dashboard/drawer_widget.dart';

class MyAccessChangeUserNameScreen extends StatelessWidget {
  const MyAccessChangeUserNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'CHANGE USERNAME',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'ACCOUNT DATA',
                  style: TextStyle(
                      color: Colors.teal, fontWeight: FontWeight.bold),
                ),
              ),
              _buildInputItemWidget(
                  'USERNAME', KeyStrings.updateCurrentPassword),
              _buildInputItemWidget(
                  'LAST ACCESS', KeyStrings.updateNewPassword),
              _buildInputItemWidget('STATUS', KeyStrings.updateConfirmPassword),
              const SizedBox(height: 10),
              _buildChangeUserNameButton(),
              const SizedBox(height: 10),
              _buildChangePasswordButton(context),
            ],
          ),
        ),
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
  Widget _buildChangeUserNameButton() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: () {},
        child: const Text(
          'SAVE CHANGES',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // change username button
  Widget _buildChangePasswordButton(BuildContext context) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
        child: const Text(
          'CHANGE PASSWORD',
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
