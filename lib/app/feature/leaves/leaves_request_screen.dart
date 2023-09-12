import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../bloc/leaves/leaves_bloc.dart';
import '../../common/util/key_strings.dart';

class LeavesRequestScreen extends StatelessWidget {
  LeavesRequestScreen({super.key});

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
          'APPLY FOR LEAVE',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Clear'),
          ),
        ],
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<LeavesBloc, LeavesState>(
          builder: (context, state) {
            if (state is LeavesLoaded) {
              final leaveCredits = state.leavesWrapperResponse.leavesResponse
                  ?.leavesDataResponse?.currentLeaveCredits;
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: FormBuilder(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                'LEAVE INFORMATION',
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              _buildLeaveTypeWidget(),
                              const SizedBox(height: 10),
                              Text('Dates From & To',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue.shade900)),
                              Row(
                                children: [
                                  Flexible(
                                    child: FormBuilderTextField(
                                      name: KeyStrings.leaveDateFromKey,
                                      readOnly: true,
                                      decoration: const InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.calendar_month,
                                          size: 20,
                                        ),
                                        hintText: 'yyyy-MM-dd',
                                      ),
                                      onTap: () =>
                                          _selectLeaveDate(context, 'dateFrom'),
                                      // onChanged: (value) {
                                      //   print('dateFrom: $value');
                                      // },
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Flexible(
                                    child: FormBuilderTextField(
                                      name: KeyStrings.leaveDateToKey,
                                      readOnly: true,
                                      decoration: const InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.calendar_month,
                                            size: 20,
                                          ),
                                          hintText: 'yyyy-MM-dd'),
                                      onTap: () {
                                        _selectLeaveDate(context, 'dateTo');
                                      },
                                    ),
                                  ),
                                ],
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
                                  onPressed: () {},
                                  child: const Text('Submit Application'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey.shade400,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'CURRENT LEAVE CREDITS >> Y 2023',
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 20),
                            Wrap(
                              children: [
                                _buildLeaveCreditsWidget(
                                    'SICK LEAVE', leaveCredits!.sl.toString()),
                                _buildLeaveCreditsWidget('VACATION LEAVE',
                                    leaveCredits.vl.toString()),
                                _buildLeaveCreditsWidget('SOLO PARENT LEAVE',
                                    leaveCredits.spl.toString()),
                                _buildLeaveCreditsWidget('PATERNITY LEAVE',
                                    leaveCredits.pl.toString()),
                                _buildLeaveCreditsWidget('MATERNITY LEAVE',
                                    leaveCredits.ml.toString()),
                                _buildLeaveCreditsWidget('BEREAVEMENT LEAVE',
                                    leaveCredits.bl.toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.grey.shade400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildLeaveCreditsWidget(String leaveType, String credits) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey.shade200)),
        child: Column(
          children: [
            Text(
              leaveType,
              style: TextStyle(
                fontSize: 10,
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              credits,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectLeaveDate(BuildContext context, String dateKey) async {
    DateTime selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      final dateFormatter = DateFormat('yyyy-MM-dd');
      if (dateKey == 'dateFrom') {
        formKey.currentState?.fields[KeyStrings.leaveDateFromKey]!
            .didChange(dateFormatter.format(picked).toString());
      } else {
        formKey.currentState?.fields[KeyStrings.leaveDateToKey]
            ?.didChange(dateFormatter.format(picked).toString());
      }
    }
  }

  Widget _buildLeaveTypeWidget() {
    var types = [];
    return BlocBuilder<LeavesBloc, LeavesState>(builder: (context, state) {
      if (state is LeavesLoaded) {
        final leaveTypes = state.leavesWrapperResponse.leavesResponse
            ?.leavesDataResponse?.dropdownOptions?.types;
        types.add(leaveTypes?.one.toString());
        types.add(leaveTypes?.two.toString());
        types.add(leaveTypes?.three.toString());
        types.add(leaveTypes?.four.toString());
        types.add(leaveTypes?.five.toString());
        types.add(leaveTypes?.six.toString());

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Leave Type',
                style: TextStyle(fontSize: 12, color: Colors.blue.shade900)),
            FormBuilderDropdown(
              name: KeyStrings.leaveTypeKey,
              initialValue: types.first.toString(),
              items: types
                  .map(
                    (leaves) => DropdownMenuItem(
                      alignment: AlignmentDirectional.centerStart,
                      value: leaves,
                      child: Text(leaves, style: const TextStyle(fontSize: 14)),
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      }
      return const SizedBox();
    });
  }
}
