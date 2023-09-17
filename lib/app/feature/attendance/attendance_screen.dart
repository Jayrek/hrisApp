import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rgs_hris/app/bloc/attendance/attendance_bloc.dart';
import 'package:rgs_hris/app/feature/attendance/attendance_time_in_out_widget.dart';
import 'package:rgs_hris/app/feature/dashboard/drawer_widget.dart';
import 'package:rgs_hris/core/data/model/response/attendance_work_response.dart';
import 'package:rgs_hris/router/app_route.dart';

import '../../../core/data/model/response/attendance_list_response.dart';
import '../../common/util/key_strings.dart';

class AttendanceScreen extends StatelessWidget {
  AttendanceScreen({super.key});

  final formKey = GlobalKey<FormBuilderState>();

  String getCurrentDate() {
    final formatter = DateFormat.yMMMMEEEEd();
    return formatter.format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('yyyy-MM-dd');
    final initialDate = formatter.format(DateTime.now());
    context.read<AttendanceBloc>().add(
          AttendanceFetched(
            dateFrom: initialDate.toString(),
            dateTo: initialDate.toString(),
          ),
        );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'ATTENDANCE',
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
                  return _buildFilterAttendance(context);
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AttendanceTimeInOutWidget(),
              _buildAttendanceTimeInOutWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAttendanceTimeInOutWidget() {
    return BlocConsumer<AttendanceBloc, AttendanceState>(
      listener: (context, state) {
        if (state is AttendanceException) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
          context.pushReplacementNamed(AppRoute.signIn.name);
        }
      },
      builder: (context, state) {
        if (state is AttendanceLoaded) {
          final workShift = state
              .attendanceWrapperResponse.response?.data?.attendanceWorkResponse;
          final attendanceList =
              state.attendanceWrapperResponse.response?.data?.attendances;
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'SHIFT & SCHEDULE',
                    style: TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      getCurrentDate().toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildShiftTable(workShift!),
                  const SizedBox(height: 20),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                  _buildEntryLogs(attendanceList!),
                ],
              ),
            ],
          );
        }
        if (state is AttendanceLoading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildShiftTable(AttendanceWorkResponse workShift) {
    return Table(
      border: TableBorder.all(
        color: Colors.grey.shade200,
      ),
      children: [
        _buildShiftRow([
          // '#',
          'SHIFT',
          'MORNING',
          'AFTERNOON',
        ]),
        _buildShiftRow([
          // '${workShift?.shiftId.toString()}',
          '${workShift.shift?.name}',
          '${workShift.shift?.amIn}',
          '${workShift.shift?.pmOut}'
        ]),
      ],
    );
    // return BlocBuilder<AttendanceBloc, AttendanceState>(
    //   builder: (context, state) {
    //     if (state is AttendanceLoaded) {
    //       print('natawagTWO');
    //       final workShift = state
    //           .attendanceWrapperResponse.response?.data?.attendanceWorkResponse;
    //       return Table(
    //         border: TableBorder.all(
    //           color: Colors.grey.shade200,
    //         ),
    //         children: [
    //           _buildShiftRow([
    //             // '#',
    //             'SHIFT',
    //             'MORNING',
    //             'AFTERNOON',
    //           ]),
    //           _buildShiftRow([
    //             // '${workShift?.shiftId.toString()}',
    //             '${workShift?.shift?.name}',
    //             '${workShift?.shift?.amIn}',
    //             '${workShift?.shift?.pmOut}'
    //           ]),
    //         ],
    //       );
    //     }
    //     return const SizedBox();
    //     // else {
    //     //   return const Center(child: CircularProgressIndicator.adaptive());
    //     // }
    //   },
    // );
  }

  TableRow _buildShiftRow(List<String> cells) {
    return TableRow(
        children: cells.map((cell) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Center(
            child: Text(
          cell,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 10),
        )),
      );
    }).toList());
  }

  Widget _buildEntryLogs(List<AttendanceListResponse> attendanceList) {
    print('build: _buildEntryLogs');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Text(
            'ENTRY LOGS',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: attendanceList.length,
          itemBuilder: (context, index) {
            final entryLogs = attendanceList[index];

            final date = DateFormat.yMEd()
                .format(DateTime.parse(entryLogs.amIn.toString()));
            final timeIn = entryLogs.amIn != null
                ? DateFormat('hh:mm a')
                    .format(DateTime.parse(entryLogs.amIn.toString()))
                : '--:--';
            final timeOut = entryLogs.pmOut != null
                ? DateFormat('hh:mm a')
                    .format(DateTime.parse(entryLogs.pmOut.toString()))
                : '--:--';
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey.shade200,
                )),
                child: InkWell(
                  onTap: () => context.pushNamed(AppRoute.attendanceDetail.name,
                      extra: entryLogs),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          height: 30,
                          color: Colors.grey.shade100,
                          child: Center(
                              child: Text(
                            date,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ))),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    const Text('AM IN'),
                                    Text(
                                      timeIn,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text('PM OUT'),
                                    Text(
                                      timeOut,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildFilterAttendance(BuildContext context) {
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
              'Filter Attendance',
              style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Divider(
              height: 1,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 20),
            Text('Date Range',
                style: TextStyle(fontSize: 12, color: Colors.blue.shade900)),
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
                    onTap: () => _selectLeaveDate(context, 'dateFrom'),
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
                      MaterialStateProperty.all<Color>(Colors.teal),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: const Text('Apply'),
                onPressed: () {
                  final dateFrom = formKey.currentState
                          ?.fields[KeyStrings.leaveDateFromKey]?.value ??
                      '';
                  final dateTo = formKey.currentState
                          ?.fields[KeyStrings.leaveDateToKey]?.value ??
                      '';

                  Navigator.pop(context);

                  context.read<AttendanceBloc>().add(
                        AttendanceFetched(
                          dateFrom: dateFrom,
                          dateTo: dateTo,
                        ),
                      );
                },
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
}
