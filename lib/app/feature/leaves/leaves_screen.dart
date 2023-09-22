import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rgs_hris/app/common/util/key_strings.dart';
import 'package:rgs_hris/app/feature/dashboard/drawer_widget.dart';
import 'package:rgs_hris/core/data/model/response/types_response.dart';
import 'package:rgs_hris/router/app_route.dart';

import '../../../core/ui/widget/calendar_text_form_field_widget.dart';
import '../../../core/ui/widget/drop_down_text_form_field_widget.dart';
import '../../bloc/leaves/leaves_bloc.dart';

class LeavesScreen extends StatefulWidget {
  const LeavesScreen({super.key});

  @override
  State<LeavesScreen> createState() => _LeavesScreenState();
}

class _LeavesScreenState extends State<LeavesScreen> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();

    context.read<LeavesBloc>().add(
        const LeavesFetched(dateFrom: '', dateTo: '', type: '', status: ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'LEAVES',
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
                  return _buildFilterLeavesBottomSheet(context);
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
      bottomNavigationBar: _buildApplyForLeaveWidget(),
      body: BlocBuilder<LeavesBloc, LeavesState>(
        builder: (context, state) {
          if (state is LeavesLoaded) {
            final leaveTypes = state.leavesWrapperResponse.leavesResponse
                ?.leavesDataResponse?.dropdownOptions?.types;

            final leaveCredits = state.leavesWrapperResponse.leavesResponse
                ?.leavesDataResponse?.currentLeaveCredits;

            final availableLeaves = state.leavesWrapperResponse.leavesResponse
                ?.leavesDataResponse?.leaveApplications;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'LEAVES APPLICATIONS',
                      style: TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Visibility(
                    visible: availableLeaves!.isNotEmpty,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: availableLeaves.length,
                        itemBuilder: (context, index) {
                          final leaveApplications = state
                              .leavesWrapperResponse
                              .leavesResponse
                              ?.leavesDataResponse
                              ?.leaveApplications?[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        height: 30,
                                        width: double.infinity,
                                        color: Colors.grey.shade100,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${getLeaveTypeName(leaveTypes, leaveApplications?.type)} LEAVE',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(parseDate(
                                                    leaveApplications!.dateFiled
                                                        .toString())),
                                              ],
                                            ),
                                          ),
                                        )),
                                    // Row(
                                    //   children: [
                                    //     const Text('Leave Type: '),
                                    //     Text(
                                    //       '${getLeaveTypeName(leaveTypes, leaveApplications?.type)}',
                                    //       style: const TextStyle(
                                    //           fontWeight: FontWeight.bold),
                                    //     ),
                                    //   ],
                                    // ),

                                    InkWell(
                                      onTap: () => context.pushNamed(
                                        AppRoute.leaveDetail.name,
                                        extra: leaveApplications,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            _buildLeaveItemWidget(
                                                'START DATE:',
                                                leaveApplications.dateFrom
                                                    .toString()),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            _buildLeaveItemWidget(
                                                'END DATE:',
                                                leaveApplications.dateTo
                                                    .toString()),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            _buildLeaveItemWidget(
                                                'NO. OF DAYS:',
                                                leaveApplications.noDays
                                                    .toString()),
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                const Text('STATUS: '),
                                                Text(
                                                  leaveApplications.status
                                                      .toString()
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: leaveApplications
                                                                  .status
                                                                  .toString()
                                                                  .toUpperCase() ==
                                                              'PENDING'
                                                          ? Colors.blue.shade900
                                                          : leaveApplications
                                                                      .status
                                                                      .toString()
                                                                      .toUpperCase() ==
                                                                  'APPROVED'
                                                              ? Colors.teal
                                                              : Colors.red),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            Divider(
                                              height: 1,
                                              color: Colors.grey.shade400,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          '2023 LEAVE CREDITS',
                          style: TextStyle(
                              color: Colors.teal, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Wrap(
                          children: [
                            _buildLeaveCreditsWidget(
                                'SICK LEAVE', leaveCredits!.sl.toString()),
                            _buildLeaveCreditsWidget(
                                'VACATION LEAVE', leaveCredits.vl.toString()),
                            _buildLeaveCreditsWidget('SOLO PARENT LEAVE',
                                leaveCredits.spl.toString()),
                            _buildLeaveCreditsWidget(
                                'PATERNITY LEAVE', leaveCredits.pl.toString()),
                            _buildLeaveCreditsWidget(
                                'MATERNITY LEAVE', leaveCredits.ml.toString()),
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
                  // Container(
                  //   color: Colors.yellow,
                  //   height: 200,
                  // )
                ],
              ),
            );
          }
          if (state is LeavesLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return const SizedBox();
        },
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

  String? getLeaveTypeName(TypesResponse? typesResponse, int? type) {
    switch (type) {
      case 1:
        return typesResponse?.one?.toUpperCase();
      case 2:
        return typesResponse?.two?.toUpperCase();
      case 3:
        return typesResponse?.three?.toUpperCase();
      case 4:
        return typesResponse?.four?.toUpperCase();
      case 5:
        return typesResponse?.five?.toUpperCase();
      case 6:
        return typesResponse?.five?.toUpperCase();
      default:
        return '';
    }
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

  Widget _buildFilterLeavesBottomSheet(BuildContext context) {
    var types = [];
    var statuses = [];

    return BlocBuilder<LeavesBloc, LeavesState>(
      builder: (context, state) {
        if (state is LeavesLoaded) {
          final leaveTypes = state.leavesWrapperResponse.leavesResponse
              ?.leavesDataResponse?.dropdownOptions?.types;
          types.add(leaveTypes?.one.toString());
          types.add(leaveTypes?.two.toString());
          types.add(leaveTypes?.three.toString());
          types.add(leaveTypes?.four.toString());
          types.add(leaveTypes?.five.toString());
          types.add(leaveTypes?.six.toString());

          final leaveStatus = state.leavesWrapperResponse.leavesResponse
              ?.leavesDataResponse?.dropdownOptions?.status;

          statuses.add(leaveStatus?.approved.toString());
          statuses.add(leaveStatus?.pending.toString());
          statuses.add(leaveStatus?.rejeced.toString());

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
                    'Filter Leaves',
                    style: TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'DATE RANGE',
                    style: TextStyle(fontSize: 12, color: Colors.teal),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                        child: CalendarTextFormFieldWidget(
                          name: KeyStrings.leaveDateFromKey,
                          hint: 'yyyy-MM-dd',
                          onTap: () => _selectLeaveDate(context, 'dateFrom'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: CalendarTextFormFieldWidget(
                          name: KeyStrings.leaveDateToKey,
                          hint: 'yyyy-MM-dd',
                          onTap: () => _selectLeaveDate(context, 'dateTo'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
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
                            alignment: AlignmentDirectional.center,
                            value: leaves,
                            child: Text(leaves,
                                style: const TextStyle(fontSize: 14)),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'LEAVE STATUS',
                    style: TextStyle(fontSize: 12, color: Colors.teal),
                  ),
                  const SizedBox(height: 10),
                  DropDownTextFormFieldWidget(
                    name: KeyStrings.leaveStatusKey,
                    initialValue: statuses.first.toString(),
                    items: statuses
                        .map(
                          (status) => DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: status,
                            child: Text(status,
                                style: const TextStyle(fontSize: 14)),
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
                        final dateFrom = formKey.currentState
                                ?.fields[KeyStrings.leaveDateFromKey]?.value ??
                            '';
                        final dateTo = formKey.currentState
                                ?.fields[KeyStrings.leaveDateToKey]?.value ??
                            '';
                        final type = formKey.currentState
                            ?.fields[KeyStrings.leaveTypeKey]?.value;
                        final status = formKey.currentState
                            ?.fields[KeyStrings.leaveStatusKey]?.value;

                        final leaveType = getLeaveTypeId(type);

                        Navigator.pop(context);

                        context.read<LeavesBloc>().add(LeavesFetched(
                            dateFrom: dateFrom,
                            dateTo: dateTo,
                            type: leaveType.toString(),
                            status: status));

                        // setState(() {
                        //   leaveTypeSelected = type;
                        // });
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
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

  Widget _buildApplyForLeaveWidget() {
    return BlocBuilder<LeavesBloc, LeavesState>(
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
                  child: state is LeavesLoaded
                      ? SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.teal),
                              elevation: MaterialStateProperty.all(0),
                            ),
                            onPressed: () => context.pushNamed(
                              AppRoute.leavesRequest.name,
                              extra: state.leavesWrapperResponse.leavesResponse
                                  ?.leavesDataResponse,
                            ),
                            child: Text(
                              '+ Apply for Leave'.toUpperCase(),
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

  Widget _buildLeaveItemWidget(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(value),
      ],
    );
  }

  String parseDate(String date) {
    return DateFormat.yMd().format(DateTime.parse(date));
  }
}
