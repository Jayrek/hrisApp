import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/remote/model/response/attendance_list_response.dart';
import '../../../core/ui/widget/text_form_field_widget.dart';

class AttendanceDetailScreen extends StatelessWidget {
  const AttendanceDetailScreen({
    required this.attendanceListResponse,
    super.key,
  });

  final AttendanceListResponse attendanceListResponse;

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(horizontal: 30),
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
            _buildInfoItemWidget('SHIFT', attendanceListResponse.shift),
            _buildInfoItemWidget('CAMPAIGN', attendanceListResponse.campaign),
            _buildInfoItemWidget(
                'LATE',
                attendanceListResponse.late != '0'
                    ? attendanceListResponse.late
                    : '00:00'),
            _buildInfoItemWidget(
                'OVERTIME',
                attendanceListResponse.overtime != '0'
                    ? attendanceListResponse.overtime
                    : '00:00'),
            _buildInfoItemWidget(
                'UNDERTIME',
                attendanceListResponse.undertime != '0'
                    ? attendanceListResponse.undertime
                    : '00:00'),
            _buildInfoItemWidget('DEVICE', attendanceListResponse.source),
          ],
        ),
      )),
    );
  }

  Widget _buildInfoItemWidget(
    String label,
    String? value,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.teal)),
        const SizedBox(height: 10),
        TextFormFieldWidget(
          name: '',
          initialValue:
              value != null && value.isNotEmpty ? value.toUpperCase() : ' -',
          isReadOnly: true,
          textCapitalization: TextCapitalization.characters,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
