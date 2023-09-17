import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../core/ui/widget/text_form_field_widget.dart';
import '../../../bloc/my_access_bloc.dart';
import '../../../common/util/key_strings.dart';
import '../../dashboard/drawer_widget.dart';

class MyAccessChangeUserNameScreen extends StatelessWidget {
  MyAccessChangeUserNameScreen({super.key});

  final formKey = GlobalKey<FormBuilderState>();

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
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: BlocBuilder<MyAccessBloc, MyAccessState>(
            builder: (context, state) {
              if (state.myAccessWrapperResponse != null) {
                final myAccessAccount = state.myAccessWrapperResponse?.response;
                return Column(
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
                    FormBuilder(
                      key: formKey,
                      child: _buildInputItemWidget(
                        'USERNAME',
                        KeyStrings.updateCurrentPassword,
                        myAccessAccount?.data?.username.toString(),
                        false,
                      ),
                    ),
                    _buildInputItemWidget(
                      'LAST ACCESS',
                      '',
                      parseDate(myAccessAccount!.data!.lastAccess.toString()),
                      true,
                    ),
                    _buildInputItemWidget(
                      'STATUS',
                      '',
                      myAccessAccount.data?.status.toString().toUpperCase(),
                      true,
                    ),
                    const SizedBox(height: 10),
                    _buildChangeUserNameButton(),
                    const SizedBox(height: 10),
                    _buildChangePasswordButton(context),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  // input item widget
  Widget _buildInputItemWidget(
    String label,
    String key,
    String? value,
    bool isReadOnly,
  ) {
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
          initialValue:
              value != null && value.isNotEmpty ? value.toUpperCase() : ' -',
          isReadOnly: isReadOnly,
          textCapitalization: TextCapitalization.characters,
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

  String parseDate(String date) {
    return DateFormat('MM/dd/yyyy, hh:mm:s').format(DateTime.parse(date));
  }
}
