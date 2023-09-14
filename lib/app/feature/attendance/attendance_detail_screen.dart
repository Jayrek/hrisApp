import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/data/model/response/attendance_list_response.dart';

class AttendanceDetailScreen extends StatelessWidget {
  const AttendanceDetailScreen({
    required this.attendanceListResponse,
    super.key,
  });

  final AttendanceListResponse attendanceListResponse;

  @override
  Widget build(BuildContext context) {
    // final entryLogs = attendanceListResponse..response
    //     ?.data?.attendances?[index];

    final date = DateFormat.yMEd()
        .format(DateTime.parse(attendanceListResponse.amIn.toString()));
    final timeIn = attendanceListResponse.amIn != null
        ? DateFormat('hh:mm a')
            .format(DateTime.parse(attendanceListResponse.amIn.toString()))
        : '--:--';
    final timeOut = attendanceListResponse.pmOut != null
        ? DateFormat('hh:mm a')
            .format(DateTime.parse(attendanceListResponse.pmOut.toString()))
        : '--:--';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'ATTENDANCE DETAILS',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey.shade200,
                )),
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
            const SizedBox(height: 20),
            const Text('SHIFT',
                style: TextStyle(fontSize: 12, color: Colors.teal)),
            const SizedBox(height: 10),
            Text('${attendanceListResponse.shift}'),
            const SizedBox(height: 20),
            Divider(
              height: 1,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 20),
            const Text('CAMPAIGN',
                style: TextStyle(fontSize: 12, color: Colors.teal)),
            const SizedBox(height: 10),
            Text('${attendanceListResponse.campaign}'),
            const SizedBox(height: 20),
            Divider(
              height: 1,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 20),
            const Text('LATE',
                style: TextStyle(fontSize: 12, color: Colors.teal)),
            const SizedBox(height: 10),
            Text('${attendanceListResponse.late}'),
            const SizedBox(height: 20),
            Divider(
              height: 1,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 20),
            const Text('OVERTIME',
                style: TextStyle(fontSize: 12, color: Colors.teal)),
            const SizedBox(height: 10),
            Text('${attendanceListResponse.overtime}'),
            const SizedBox(height: 20),
            Divider(
              height: 1,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 20),
            const Text('UNDERTIME',
                style: TextStyle(fontSize: 12, color: Colors.teal)),
            const SizedBox(height: 10),
            Text('${attendanceListResponse.undertime}'),
            const SizedBox(height: 20),
            Divider(
              height: 1,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 20),
            const Text('DEVICE',
                style: TextStyle(fontSize: 12, color: Colors.teal)),
            const SizedBox(height: 10),
            Text('${attendanceListResponse.source}'),
            const SizedBox(height: 20),
            Divider(
              height: 1,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      )),
    );
  }
}
