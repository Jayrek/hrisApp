import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../core/ui/widget/drop_down_text_form _field_widget.dart';
import '../../../core/ui/widget/text_form_field_widget.dart';
import '../../bloc/change_request/change_request_bloc.dart';
import '../../common/util/key_strings.dart';

class ChangeRequestAddScreen extends StatelessWidget {
  ChangeRequestAddScreen({super.key});

  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final categories = ['EMPLOYMENT', 'WORK', 'PERSONAL'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'CREATE CHANGE REQUEST',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: BlocConsumer<ChangeRequestBloc, ChangeRequestState>(
        listener: (context, state) {
          if (state is ChangeRequestException) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is ChangeRequestSetLoaded) {
            showOkAlertDialog(
                    barrierDismissible: false,
                    context: context,
                    title: state.wrapperDefaultResponse.response?.status,
                    message: state.wrapperDefaultResponse.response?.message)
                .then((value) {
              if (value == OkCancelResult.ok) {
                if (state.wrapperDefaultResponse.response?.status
                        ?.toLowerCase() ==
                    'success') {
                  Navigator.of(context).pop();
                  context
                      .read<ChangeRequestBloc>()
                      .add(const ChangeRequestFetched(status: ''));
                }
              }
            });
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: FormBuilder(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                'REQUEST RECORD UPDATE',
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text(
                                    'SELECT CATEGORY',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.teal),
                                  ),
                                  const SizedBox(height: 10),
                                  DropDownTextFormFieldWidget(
                                    name: KeyStrings.changeRequestCategory,
                                    initialValue: categories.first.toString(),
                                    items: categories
                                        .map(
                                          (category) => DropdownMenuItem(
                                            alignment: AlignmentDirectional
                                                .centerStart,
                                            value: category,
                                            child: Text(category,
                                                style: const TextStyle(
                                                    fontSize: 14)),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'CURRENT DATA',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.teal),
                              ),
                              const SizedBox(height: 10),
                              const TextFormFieldWidget(
                                name: KeyStrings.changeRequestOldData,
                                initialValue: '',
                                isReadOnly: false,
                                hint: 'e.g. Birth Date From 09/09/1988',
                                maxLines: 3,
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'TO BE REPLACE WITH',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.teal),
                              ),
                              const SizedBox(height: 10),
                              const TextFormFieldWidget(
                                name: KeyStrings.changeRequestNewData,
                                initialValue: '',
                                isReadOnly: false,
                                hint: 'e.g. Birth Date To 09/09/1987',
                                maxLines: 3,
                              ),
                              const SizedBox(height: 30),
                              SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.teal),
                                    elevation: MaterialStateProperty.all(0),
                                  ),
                                  onPressed: () {
                                    String category = formKey
                                        .currentState
                                        ?.fields[
                                            KeyStrings.changeRequestCategory]
                                        ?.value;
                                    String oldData = formKey
                                        .currentState
                                        ?.fields[
                                            KeyStrings.changeRequestOldData]
                                        ?.value;
                                    String newData = formKey
                                        .currentState
                                        ?.fields[
                                            KeyStrings.changeRequestNewData]
                                        ?.value;
                                    context
                                        .read<ChangeRequestBloc>()
                                        .add(ChangeRequestSet(
                                          category: category,
                                          oldData: oldData,
                                          newData: newData,
                                        ));
                                  },
                                  child: const Text('SUBMIT CHANGES'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              if (state is ChangeRequestLoading)
                const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
            ],
          );
        },
      ),
    );
  }
}
