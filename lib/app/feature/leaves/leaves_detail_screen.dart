import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/remote/model/response/leave_applications_response.dart';
import '../../../core/ui/widget/text_form_field_widget.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/leaves/leaves_bloc.dart';

class LeavesDetailScreen extends StatelessWidget {
  const LeavesDetailScreen({
    required this.leaveApplications,
    super.key,
  });

  final LeaveApplications leaveApplications;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'LEAVE DETAILS',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'LEAVE APPLICATION DETAILS',
                  style: TextStyle(
                      color: Colors.teal, fontWeight: FontWeight.bold),
                ),
              ),
              BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                if (state is AuthSignInSuccess) {
                  final employeeData = state.loginWrapperResponse.loginResponse
                      ?.loginDataResponse?.employeeDetails;
                  return _buildInfoItemWidget(
                      'EMPLOYEE NAME', '${employeeData?.name}');
                }
                return const SizedBox();
              }),
              _buildInfoItemWidget('DATE FILED',
                  parseDate(leaveApplications.dateFiled.toString())),
              _buildInfoItemWidget('EFFECTIVE DATE',
                  '${parseDate(leaveApplications.dateFrom.toString())} - ${parseDate(leaveApplications.dateTo.toString())}'),
              _buildInfoItemWidget('NO OF DAYS', '${leaveApplications.noDays}'),
              _buildInfoItemWidget('REASON / DESCRIPTION',
                  leaveApplications.description.toString()),
              _buildLeaveTypeNameWidget(leaveApplications.type),
              _buildInfoItemWidget('STATUS', '${leaveApplications.status}'),
              _buildInfoItemWidget(
                  'APPROVED BY', "${leaveApplications.approvedBy ?? '-'}"),
              _buildInfoItemWidget(
                  'REJECTED BY', "${leaveApplications.rejectedBy ?? '-'}"),
            ],
          ),
        ),
      ),
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

  Widget _buildLeaveTypeNameWidget(int? type) {
    return BlocBuilder<LeavesBloc, LeavesState>(
      builder: (context, state) {
        if (state is LeavesLoaded) {
          String? leaveType;
          final typesResponse = state.leavesWrapperResponse.leavesResponse
              ?.leavesDataResponse?.dropdownOptions?.types;
          switch (type) {
            case 1:
              leaveType = typesResponse?.one?.toUpperCase();
            case 2:
              leaveType = typesResponse?.two?.toUpperCase();
            case 3:
              leaveType = typesResponse?.three?.toUpperCase();
            case 4:
              leaveType = typesResponse?.four?.toUpperCase();
            case 5:
              leaveType = typesResponse?.five?.toUpperCase();
            case 6:
              leaveType = typesResponse?.five?.toUpperCase();
          }
          return _buildInfoItemWidget('LEAVE TYPE', '$leaveType LEAVE');
        }
        return const SizedBox();
      },
    );
  }

  String parseDate(String date) {
    return DateFormat.yMd().format(DateTime.parse(date));
  }
}
