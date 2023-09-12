import 'package:flutter/material.dart';
import 'package:rgs_hris/core/data/model/response/leave_applications_response.dart';

class LeavesDetailScreen extends StatelessWidget {
  const LeavesDetailScreen({
    required this.leaveApplications,
    super.key,
  });

  final LeaveApplications leaveApplications;

  @override
  Widget build(BuildContext context) {
    print('leaveApplications: $leaveApplications');
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
              Text('${leaveApplications.type} Leave'),
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
}
