import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rgs_hris/core/data/model/response/leave_applications_response.dart';

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
          'LEAVE DETAIL',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('EMPLOYEE NAME',
                  style: TextStyle(fontSize: 12, color: Colors.teal)),
              const SizedBox(height: 10),
              BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                if (state is AuthSignInSuccess) {
                  final employeeData = state.loginWrapperResponse.loginResponse
                      ?.loginDataResponse?.employeeDetails;
                  return Text(
                    '${employeeData?.name.toString().toUpperCase()}',
                  );
                }
                return const SizedBox();
              }),
              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 20),
              const Text('DATE FILED',
                  style: TextStyle(fontSize: 12, color: Colors.teal)),
              const SizedBox(height: 10),
              Text(parseDate(leaveApplications.dateFiled.toString())),
              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 20),
              const Text('EFFECTIVE DATE',
                  style: TextStyle(fontSize: 12, color: Colors.teal)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                      '${parseDate(leaveApplications.dateFrom.toString())} - ${parseDate(leaveApplications.dateTo.toString())}'),
                ],
              ),
              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 20),
              const Text('NO OF DAYS',
                  style: TextStyle(fontSize: 12, color: Colors.teal)),
              const SizedBox(height: 10),
              Text('${leaveApplications.noDays}'),
              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 20),
              const Text('REASON / DESCRIPTION',
                  style: TextStyle(fontSize: 12, color: Colors.teal)),
              const SizedBox(height: 10),
              Text(leaveApplications.description.toString().toUpperCase()),
              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 20),
              const Text('LEAVE TYPE',
                  style: TextStyle(fontSize: 12, color: Colors.teal)),
              const SizedBox(height: 10),
              _buildLeaveTypeNameWidget(leaveApplications.type),
              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 20),
              const Text('STATUS',
                  style: TextStyle(fontSize: 12, color: Colors.teal)),
              const SizedBox(height: 10),
              Text('${leaveApplications.status?.toUpperCase()}'),
              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 20),
              const Text('APPROVED BY',
                  style: TextStyle(fontSize: 12, color: Colors.teal)),
              const SizedBox(height: 10),
              // Text('${leaveApplications.status}'),
              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),

              const SizedBox(height: 20),
              const Text('REJECTED BY',
                  style: TextStyle(fontSize: 12, color: Colors.teal)),
              const SizedBox(height: 10),
              // Text('-', style: Text,),
              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 20),

              const Text('MODIFIED BY',
                  style: TextStyle(fontSize: 12, color: Colors.teal)),
              const SizedBox(height: 10),
              // Text('${leaveApplications.status}'),
              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
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
          return Text('$leaveType Leave');
        }
        return const SizedBox();
      },
    );
  }

  String parseDate(String date) {
    return DateFormat.yMd().format(DateTime.parse(date));
  }
}
