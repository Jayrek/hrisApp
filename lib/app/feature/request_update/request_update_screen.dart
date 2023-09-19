import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:rgs_hris/app/bloc/change_request/change_request_bloc.dart';
import 'package:rgs_hris/app/feature/dashboard/drawer_widget.dart';

import '../../../core/ui/widget/drop_down_text_form _field_widget.dart';
import '../../../core/ui/widget/widget_util.dart';
import '../../common/util/key_strings.dart';

class RequestUpdateScreen extends StatelessWidget {
  RequestUpdateScreen({super.key});

  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    context
        .read<ChangeRequestBloc>()
        .add(const ChangeRequestFetched(status: ''));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'REQUEST UPDATE',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return _buildFilterChangeRequestBottomSheet(context);
                },
              );
            },
            icon: const Icon(
              Icons.filter_alt_outlined,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      bottomNavigationBar: _buildApplyChangeRequestWidget(),
      body: BlocBuilder<ChangeRequestBloc, ChangeRequestState>(
        builder: (context, state) {
          if (state is ChangeRequestLoaded) {
            final changeRequestWrapper = state.changeRequestWrapperResponse;
            return ListView.builder(
                itemCount:
                    changeRequestWrapper.response?.data?.changerequests?.length,
                itemBuilder: (context, index) {
                  final changeRequest = changeRequestWrapper
                      .response?.data?.changerequests?[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            Container(
                                height: 30,
                                width: double.infinity,
                                color: Colors.grey.shade100,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(parseDate(
                                        changeRequest!.added.toString())),
                                  ),
                                )),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const SizedBox(height: 10),
                                    _buildChangeRequestItemWidget(
                                        'CATEGORY:',
                                        changeRequest.category
                                            .toString()
                                            .toUpperCase()),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('STATUS: '),
                                        Text(
                                          changeRequest.status
                                              .toString()
                                              .toUpperCase(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: changeRequest.status
                                                          .toString()
                                                          .toUpperCase() ==
                                                      'PENDING'
                                                  ? Colors.blue.shade900
                                                  : changeRequest.status
                                                              .toString()
                                                              .toUpperCase() ==
                                                          'APPROVED'
                                                      ? Colors.teal
                                                      : Colors.red),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: WidgetUtil.customDivider(),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                });
          }
          if (state is ChangeRequestLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildFilterChangeRequestBottomSheet(BuildContext context) {
    final statuses = ['PENDING', 'APPROVED', 'REJECT'];
    return FormBuilder(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Filter Change Request',
              style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Divider(
              height: 1,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 20),
            Text('Status',
                style: TextStyle(fontSize: 12, color: Colors.blue.shade900)),
            const SizedBox(height: 10),
            DropDownTextFormFieldWidget(
              name: KeyStrings.changeRequestStatus,
              initialValue: statuses.first.toString(),
              items: statuses
                  .map(
                    (status) => DropdownMenuItem(
                      alignment: AlignmentDirectional.center,
                      value: status,
                      child: Text(status, style: const TextStyle(fontSize: 14)),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Text('Apply'.toUpperCase()),
                onPressed: () {
                  final status = formKey.currentState
                      ?.fields[KeyStrings.changeRequestStatus]?.value;

                  Navigator.pop(context);

                  context
                      .read<ChangeRequestBloc>()
                      .add(ChangeRequestFetched(status: status));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApplyChangeRequestWidget() {
    return BlocBuilder<ChangeRequestBloc, ChangeRequestState>(
      builder: (context, state) {
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 40,
                    top: 20,
                  ),
                  child: state is ChangeRequestLoaded
                      ? SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.teal),
                              elevation: MaterialStateProperty.all(0),
                            ),
                            onPressed: () {},
                            child: Text(
                              '+ Request Update'.toUpperCase(),
                            ),
                          ),
                        )
                      : const SizedBox()),
            ),
          ],
        );
      },
    );
  }

  Widget _buildChangeRequestItemWidget(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(value),
      ],
    );
  }

  String parseDate(String date) {
    return DateFormat('MM/dd/yy, hh:mm a').format(DateTime.parse(date));
  }
}
