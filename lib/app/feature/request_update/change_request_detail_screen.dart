import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/data/model/response/change_requests_response.dart';
import '../../../core/ui/widget/text_form_field_widget.dart';

class ChangeRequestDetailScreen extends StatelessWidget {
  const ChangeRequestDetailScreen({
    required this.changeRequestResponse,
    super.key,
  });

  final ChangeRequestResponse changeRequestResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'CHANGE REQUEST',
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
                  'CHANGE REQUEST DETAILS',
                  style: TextStyle(
                      color: Colors.teal, fontWeight: FontWeight.bold),
                ),
              ),
              _buildInfoItemWidget('DATE CREATED',
                  parseDate(changeRequestResponse.added.toString())),
              _buildInfoItemWidget(
                  'CATEGORY', '${changeRequestResponse.category}'),
              _buildInfoItemWidget('STATUS', '${changeRequestResponse.status}'),
              _buildInfoItemWidget(
                  'EXISTING DATA', changeRequestResponse.oldData.toString()),
              _buildInfoItemWidget(
                  'NEW DATA', changeRequestResponse.newData.toString()),
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

  String parseDate(String date) {
    return DateFormat('MM/dd/yy, hh:mm a').format(DateTime.parse(date));
  }
}
