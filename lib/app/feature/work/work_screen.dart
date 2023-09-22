import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgs_hris/app/bloc/work/work_bloc.dart';
import 'package:rgs_hris/app/feature/dashboard/drawer_widget.dart';
import 'package:rgs_hris/core/data/model/response/works_data_response.dart';
import 'package:rgs_hris/core/data/model/response/works_working_days.dart';

import '../../../core/ui/widget/text_form_field_widget.dart';

class WorkScreen extends StatelessWidget {
  const WorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WorkBloc>().add(WorkFetched());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'WORK',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      drawer: const DrawerWidget(),
      body: BlocBuilder<WorkBloc, WorkState>(
        builder: (context, state) {
          if (state is WorkLoaded) {
            final workData = state.worksWrapperResponse.response?.data;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildShiftSectionWidget(workData!),
                    _buildDesignationSectionWidget(workData),
                    _buildOtherDataSectionWidget(workData),
                  ],
                ),
              ),
            );
          }
          if (state is WorkLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildWorkingDaysWidget(WorksWorkingDaysResponse workingDaysResponse) {
    return Column(
      children: [
        _buildWorkingDaysItem(workingDaysResponse, 1),
        _buildWorkingDaysItem(workingDaysResponse, 2),
        _buildWorkingDaysItem(workingDaysResponse, 3),
        _buildWorkingDaysItem(workingDaysResponse, 4),
        _buildWorkingDaysItem(workingDaysResponse, 5),
        _buildWorkingDaysItem(workingDaysResponse, 6),
        _buildWorkingDaysItem(workingDaysResponse, 7),
        Divider(
          height: 1,
          color: Colors.grey.shade400,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildWorkingDaysItem(
      WorksWorkingDaysResponse workingDaysResponse, day) {
    return Row(
      children: [
        Checkbox(
          value: day == 7 ? false : true,
          onChanged: null,
        ),
        Text('${getWorkingDaysName(workingDaysResponse, day)}'),
      ],
    );
  }

  String? getWorkingDaysName(
      WorksWorkingDaysResponse? workingDaysResponse, int days) {
    switch (days) {
      case 1:
        return workingDaysResponse?.one;
      case 2:
        return workingDaysResponse?.two;
      case 3:
        return workingDaysResponse?.three;
      case 4:
        return workingDaysResponse?.four;
      case 5:
        return workingDaysResponse?.five;
      case 6:
        return workingDaysResponse?.six;
      case 7:
        return workingDaysResponse?.seven;
      default:
        return '';
    }
  }

  Widget _buildShiftSectionWidget(WorksDataResponse worksDataResponse) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'SHIFT & WORKING DAYS',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
        ),
        _buildInfoItemWidget('SHIFT', worksDataResponse.shifts?.name),
        const Text('WORKING DAYS',
            style: TextStyle(fontSize: 12, color: Colors.teal)),
        const SizedBox(height: 10),
        _buildWorkingDaysWidget(worksDataResponse.workingDays!),
      ],
    );
  }

  Widget _buildDesignationSectionWidget(WorksDataResponse worksDataResponse) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'DESIGNATION',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
        ),
        _buildInfoItemWidget('BRANCH', worksDataResponse.departments?.name),
        Row(
          children: [
            Flexible(
              child: _buildInfoItemWidget(
                  'CAMPAIGN', worksDataResponse.designations?.name),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: _buildInfoItemWidget(
                  'JOB TITLE', worksDataResponse.jobs?.name),
            ),
          ],
        ),
        _buildInfoItemWidget('LOCATION', worksDataResponse.locations?.name),
        _buildInfoItemWidget(
            'REPORTING TO', worksDataResponse.work?.reportingTo),
      ],
    );
  }

  Widget _buildOtherDataSectionWidget(WorksDataResponse worksDataResponse) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'OTHER DATA',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
        ),
        _buildInfoItemWidget(
            'SOURCE OF HIRE', worksDataResponse.work?.sourceHire),
        Row(
          children: [
            Flexible(
              child: _buildInfoItemWidget(
                  'PAY RATE', worksDataResponse.work?.payRate),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: _buildInfoItemWidget(
                  'PAY TYPE', worksDataResponse.work?.payType),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: _buildInfoItemWidget(
                  'WORK PHONE NO', worksDataResponse.work?.workPhone),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: _buildInfoItemWidget(
                  'OFFICE STATUS', worksDataResponse.work?.officeStatus),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoItemWidget(String label, String? value) {
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
