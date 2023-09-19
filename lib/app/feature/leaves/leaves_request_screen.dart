import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:rgs_hris/core/data/model/response/leaves_data_response.dart';

import '../../../core/ui/widget/calendar_text_form_field_widget.dart';
import '../../../core/ui/widget/drop_down_text_form _field_widget.dart';
import '../../../core/ui/widget/text_form_field_widget.dart';
import '../../bloc/leaves/leaves_bloc.dart';
import '../../common/util/key_strings.dart';

class LeavesRequestScreen extends StatelessWidget {
  LeavesRequestScreen({required this.leavesDataResponse, super.key});

  final LeavesDataResponse leavesDataResponse;

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
        ),
        body: BlocConsumer<LeavesBloc, LeavesState>(
          listener: (context, state) {
            if (state is LeavesException) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
            if (state is LeavesSetLoaded) {
              showOkAlertDialog(
                      barrierDismissible: false,
                      context: context,
                      title:
                          state.leavesRequestResponseWrapper.response?.status,
                      message:
                          state.leavesRequestResponseWrapper.response?.message)
                  .then((value) {
                if (value == OkCancelResult.ok) {
                  if (state.leavesRequestResponseWrapper.response?.status
                          ?.toLowerCase() ==
                      'success') {
                    Navigator.of(context).pop();
                    context.read<LeavesBloc>().add(const LeavesFetched(
                        dateFrom: '', dateTo: '', type: '', status: 'Pending'));
                  }
                }
              });
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
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
                                const SizedBox(height: 20),
                                const Text(
                                  'DATES FROM & TO',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.teal),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Flexible(
                                      child: CalendarTextFormFieldWidget(
                                        name: KeyStrings.leaveDateFromKey,
                                        hint: 'yyyy-MM-dd',
                                        onTap: () => _selectLeaveDate(
                                            context, 'dateFrom'),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Flexible(
                                      child: CalendarTextFormFieldWidget(
                                        name: KeyStrings.leaveDateToKey,
                                        hint: 'yyyy-MM-dd',
                                        onTap: () =>
                                            _selectLeaveDate(context, 'dateTo'),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'LEAVE REASON/DESCRIPTION',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.teal),
                                ),
                                const SizedBox(height: 10),
                                const TextFormFieldWidget(
                                  name: KeyStrings.leaveDescriptionKey,
                                  isReadOnly: false,
                                  hint: 'State your reason',
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
                                      String type = formKey
                                          .currentState
                                          ?.fields[KeyStrings.leaveTypeKey]
                                          ?.value;
                                      String dateFrom = formKey
                                              .currentState
                                              ?.fields[
                                                  KeyStrings.leaveDateFromKey]
                                              ?.value ??
                                          '';
                                      String dateTo = formKey
                                              .currentState
                                              ?.fields[
                                                  KeyStrings.leaveDateToKey]
                                              ?.value ??
                                          '';
                                      String description = formKey
                                              .currentState
                                              ?.fields[KeyStrings
                                                  .leaveDescriptionKey]
                                              ?.value ??
                                          '';

                                      final leaveType = getLeaveTypeId(type);

                                      context
                                          .read<LeavesBloc>()
                                          .add(LeavesApplicationSet(
                                            type: leaveType.toString(),
                                            dateFrom: dateFrom,
                                            dateTo: dateTo,
                                            description: description,
                                          ));
                                    },
                                    child: Text(
                                        'Submit Application'.toUpperCase()),
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
                        _buildLeaveCreditsSection(),
                        _buildLeavePolicyWidget(),
                      ],
                    ),
                  ),
                ),
                if (state is LeavesLoading)
                  const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
              ],
            );
            // }
          },
        ));
  }

  Widget _buildLeaveCreditsSection() {
    final leaveCredits = leavesDataResponse.currentLeaveCredits;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'CURRENT LEAVE CREDITS >> Y 2023',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Wrap(
            children: [
              _buildLeaveCreditsItemWidget(
                  'SICK LEAVE', leaveCredits!.sl.toString()),
              _buildLeaveCreditsItemWidget(
                  'VACATION LEAVE', leaveCredits.vl.toString()),
              _buildLeaveCreditsItemWidget(
                  'SOLO PARENT LEAVE', leaveCredits.spl.toString()),
              _buildLeaveCreditsItemWidget(
                  'PATERNITY LEAVE', leaveCredits.pl.toString()),
              _buildLeaveCreditsItemWidget(
                  'MATERNITY LEAVE', leaveCredits.ml.toString()),
              _buildLeaveCreditsItemWidget(
                  'BEREAVEMENT LEAVE', leaveCredits.bl.toString()),
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
    );
  }

  Widget _buildLeaveCreditsItemWidget(String leaveType, String credits) {
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

  Widget _buildLeavePolicyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'FILING LEAVE POLICY',
          style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey.shade200)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'NUMBER OF DAYS',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'NOTICE PERIOD',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              _buildLeaveNamePolicyItemWidget('VACATION LEAVE'),
              _buildLeaveNoticeItemWidget('1 - 2 DAYS', '3 DAYS NOTICE'),
              _buildLeaveNoticeItemWidget('3 - 4 DAYS', '1 WEEK NOTICE'),
              _buildLeaveNoticeItemWidget('5 DAYS AND UP', '1 MONTH NOTICE'),
              _buildLeaveNamePolicyItemWidget('EMERGENCY / SICK LEAVE'),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Text(
                          'NOTIFY IMMEDIATELY SUPERIOR 2 HOURS BEFORE THE START OF DUTY',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                    Flexible(
                      child: Text('FILLING WITHIN 24 HOURS UPON RETURN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                    'LATE FILING OF LEAVES AND NOT FOLLOWING LEAVE PROCEDURE WILL NOT BE APPROVED.',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
      ],
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
    final leaveTypes = leavesDataResponse.dropdownOptions?.types;
    types.add(leaveTypes?.one.toString());
    types.add(leaveTypes?.two.toString());
    types.add(leaveTypes?.three.toString());
    types.add(leaveTypes?.four.toString());
    types.add(leaveTypes?.five.toString());
    types.add(leaveTypes?.six.toString());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'LEAVE TYPE',
          style: TextStyle(fontSize: 12, color: Colors.teal),
        ),
        const SizedBox(height: 10),
        DropDownTextFormFieldWidget(
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

  int? getLeaveTypeId(String type) {
    switch (type) {
      case 'Sick':
        return 1;
      case 'Vacation':
        return 2;
      case 'Solo Parent':
        return 3;
      case 'Paternity':
        return 4;
      case 'Maternity':
        return 5;
      case 'Bereavement':
        return 6;
      default:
        return 1;
    }
  }

  Widget _buildLeaveNamePolicyItemWidget(String leaveName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        leaveName,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLeaveNoticeItemWidget(String noOfDays, String noticePeriod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(noOfDays,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          Text(noticePeriod,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }
}
