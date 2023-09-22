import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/remote/model/response/employee_response.dart';
import '../../../core/ui/widget/text_form_field_widget.dart';
import '../../bloc/employee/employee_bloc.dart';
import '../dashboard/drawer_widget.dart';

class EmploymentScreen extends StatelessWidget {
  const EmploymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<EmployeeBloc>().add(EmployeeFetched());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'EMPLOYMENT',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      drawer: const DrawerWidget(),
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        builder: (context, state) {
          if (state is EmployeeLoaded) {
            final employeeData =
                state.worksWrapperResponse.response?.data?.employee;

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildEmployeeDataSectionWidget(employeeData!),
                    _buildOtherDataSectionWidget(employeeData),
                    _buildLeaveCreditsSectionWidget(employeeData),
                  ],
                ),
              ),
            );
          }

          if (state is EmployeeLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildEmployeeDataSectionWidget(EmployeeResponse employeeResponse) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'EMPLOYEE DATA',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
        ),
        _buildInfoItemWidget('GIVEN NAME', employeeResponse.fname),
        _buildInfoItemWidget('MIDDLE NAME', employeeResponse.mname),
        _buildInfoItemWidget('LAST NAME', employeeResponse.lname),
        Row(
          children: [
            Flexible(
              child:
                  _buildInfoItemWidget('EMPLOYEE ID', employeeResponse.empid),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: _buildInfoItemWidget('EMAIL', employeeResponse.email),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: _buildInfoItemWidget(
                  'BIOMETRIC ID', employeeResponse.biometricid),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: _buildInfoItemWidget('TYPE', employeeResponse.type),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: _buildInfoItemWidget('STATUS', employeeResponse.status),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: _buildInfoItemWidget(
                  'DATE HIRED', employeeResponse.dateHired),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOtherDataSectionWidget(EmployeeResponse employeeResponse) {
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
        _buildInfoItemWidget('OFFICE BRANCH', employeeResponse.officeBranch),
        _buildInfoItemWidget('6TH MONTH', employeeResponse.sixthMonth),
        _buildInfoItemWidget('TENURESHIP', employeeResponse.tenureship),
        _buildInfoItemWidget(
            'POSITION SECTOR', employeeResponse.positionSector),
        _buildInfoItemWidget('TEAM LEADER', employeeResponse.teamLeader),
        _buildInfoItemWidget('OM / BM / TM', employeeResponse.omBmTm),
        _buildInfoItemWidget('AREA GROUPING', employeeResponse.areaGrouping),
      ],
    );
  }

  Widget _buildLeaveCreditsSectionWidget(EmployeeResponse employeeResponse) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'LEAVE CREDITS',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
        ),
        _buildInfoItemWidget(
            'TOTAL LEAVE CREDITS', employeeResponse.leaveCredits.toString()),
        Row(
          children: [
            Flexible(
              child: _buildInfoItemWidget(
                  'SICK LEAVE', employeeResponse.leavecredits?[0].sl),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: _buildInfoItemWidget(
                  'VACATION LEAVE', employeeResponse.leavecredits?[0].vl),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: _buildInfoItemWidget(
                  'SOLO PARENT LEAVE', employeeResponse.leavecredits?[0].spl),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: _buildInfoItemWidget(
                  'PATERNITY LEAVE', employeeResponse.leavecredits?[0].pl),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: _buildInfoItemWidget(
                  'MATERNITY LEAVE', employeeResponse.leavecredits?[0].ml),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: _buildInfoItemWidget(
                  'BEREAVEMENT LEAVE', employeeResponse.leavecredits?[0].bl),
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
