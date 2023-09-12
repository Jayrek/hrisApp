import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgs_hris/core/data/model/response/leave_applications_response.dart';

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
              const Text('Employee Name',
                  style: TextStyle(fontSize: 12, color: Colors.teal)),
              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 20),
              const Text('Date Filed',
                  style: TextStyle(fontSize: 12, color: Colors.teal)),
              const SizedBox(height: 10),
              Text('${leaveApplications.dateFiled}'),
              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 20),
              const Text('Effective Date',
                  style: TextStyle(fontSize: 12, color: Colors.teal)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                      '${leaveApplications.dateFrom} - ${leaveApplications.dateTo}'),
                ],
              ),
              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 20),
              const Text('No. of Days',
                  style: TextStyle(fontSize: 12, color: Colors.teal)),
              const SizedBox(height: 10),
              Text('${leaveApplications.noDays}'),
              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 20),
              const Text('Reason/Description',
                  style: TextStyle(fontSize: 12, color: Colors.teal)),
              const SizedBox(height: 10),
              Text('${leaveApplications.description}'),
              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 20),
              const Text('Leave Type',
                  style: TextStyle(fontSize: 12, color: Colors.teal)),
              const SizedBox(height: 10),
              _buildLeaveTypeNameWidget(leaveApplications.type),
              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 20),
              const Text('Status',
                  style: TextStyle(fontSize: 12, color: Colors.teal)),
              const SizedBox(height: 10),
              Text('${leaveApplications.status}'),
              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 20),
              const Text('Approved By',
                  style: TextStyle(fontSize: 12, color: Colors.teal)),
              const SizedBox(height: 10),
              // Text('${leaveApplications.status}'),
              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),

              const SizedBox(height: 20),
              const Text('Rejected By',
                  style: TextStyle(fontSize: 12, color: Colors.teal)),
              const SizedBox(height: 10),
              // Text('${leaveApplications.status}'),
              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 20),

              const Text('Modified By',
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
              leaveType = typesResponse?.one;
            case 2:
              leaveType = typesResponse?.two;
            case 3:
              leaveType = typesResponse?.three;
            case 4:
              leaveType = typesResponse?.four;
            case 5:
              leaveType = typesResponse?.five;
            case 6:
              leaveType = typesResponse?.five;
          }
          return Text('$leaveType Leave');
        }
        return const SizedBox();
      },
    );
  }
}
