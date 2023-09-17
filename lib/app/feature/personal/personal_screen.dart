import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rgs_hris/app/feature/dashboard/drawer_widget.dart';
import 'package:rgs_hris/core/data/model/response/personal_address_response.dart';
import 'package:rgs_hris/core/data/model/response/personal_employee_response.dart';

import '../../../core/ui/widget/text_form_field_widget.dart';
import '../../bloc/user/user_bloc.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserBloc>().add(UserFetched());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'PERSONAL',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      drawer: const DrawerWidget(),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            final employeeData =
                state.personalWrapperResponse.response?.data?.employee;
            final addressData =
                state.personalWrapperResponse.response?.data?.address;

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildPersonalDataSectionWidget(employeeData!),
                    _buildOtherDataSectionWidget(employeeData),
                    _buildAccountNoSectionWidget(employeeData),
                    _buildRemarksSectionWidget(employeeData),
                    _buildAddressSectionWidget(employeeData, addressData!),
                  ],
                ),
              ),
            );
          }
          if (state is UserLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildPersonalDataSectionWidget(
      PersonalEmployeeResponse employeeResponse) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'PERSONAL DATA',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
        ),
        _buildInfoItemWidget('BLOOD TYPE', employeeResponse.bloodType),
        _buildInfoItemWidget('SPOUSE', employeeResponse.spouse),
        _buildInfoItemWidget("FATHER'S NAME", employeeResponse.father),
        _buildInfoItemWidget("MOTHER's NAME", employeeResponse.mother),
        Row(
          children: [
            Flexible(
              child: _buildInfoItemWidget('MOBILE NO', employeeResponse.mobile),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
                child:
                    _buildInfoItemWidget('PHONE NO', employeeResponse.phone)),
          ],
        ),
        Row(
          children: [
            Flexible(
                child: _buildInfoItemWidget('DATE OF BIRTH',
                    parseDate(employeeResponse.birthdate.toString()))),
            const SizedBox(
              width: 20,
            ),
            Flexible(
                child: _buildInfoItemWidget(
                    'NATIONALITY', employeeResponse.nationality)),
          ],
        ),
        Row(
          children: [
            Flexible(
                child: _buildInfoItemWidget('GENDER', employeeResponse.gender)),
            const SizedBox(
              width: 20,
            ),
            Flexible(
                child: _buildInfoItemWidget(
                    'MARITAL STATUS', employeeResponse.maritalStatus)),
          ],
        ),
      ],
    );
  }

  Widget _buildOtherDataSectionWidget(
      PersonalEmployeeResponse employeeResponse) {
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
            'IN CASE OF EMERGENCY', employeeResponse.emergency),
        _buildInfoItemWidget(
            'RELATION TO THE PERSON ABOVE', employeeResponse.relation),
        _buildInfoItemWidget('CONTACT NO', employeeResponse.contactNo),
        Row(
          children: [
            Flexible(
              child: _buildInfoItemWidget(
                  'DOMAIN EMAIL', employeeResponse.domainEmail),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: _buildInfoItemWidget(
                  'PERSONAL EMAIL', employeeResponse.personalEmail),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: _buildInfoItemWidget('FACEBOOK', employeeResponse.father),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: _buildInfoItemWidget(
                  'FIVE YEARS TENURE', employeeResponse.fiveYearsTenure),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: _buildInfoItemWidget(
                  'DATE INCREASED', employeeResponse.dateIncrease),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: _buildInfoItemWidget('HRIS', employeeResponse.hris),
            ),
          ],
        ),
        _buildInfoItemWidget('VACCINE', employeeResponse.vaccine),
        _buildInfoItemWidget('ASSIGNED HR', employeeResponse.assignedHr),
      ],
    );
  }

  Widget _buildAccountNoSectionWidget(
      PersonalEmployeeResponse employeeResponse) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'ACCOUNT NUMBERS',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            Flexible(child: _buildInfoItemWidget('SSS', employeeResponse.sss)),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: _buildInfoItemWidget('PAG-IBIG', employeeResponse.pagIbig),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: _buildInfoItemWidget('TIN NO', employeeResponse.tin),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: _buildInfoItemWidget(
                  'BANK ACCOUNT', employeeResponse.bankAccount),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: _buildInfoItemWidget('HMO', employeeResponse.hmo),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: _buildInfoItemWidget(
                  'MEMBER CODE', employeeResponse.memberCode),
            ),
          ],
        ),
        _buildInfoItemWidget('OTHER HMO', employeeResponse.otherHmo),
      ],
    );
  }

  Widget _buildRemarksSectionWidget(PersonalEmployeeResponse employeeResponse) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'REMARKS',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
        ),
        _buildInfoItemWidget('NOT / DESCRIPTION', employeeResponse.remarks),
      ],
    );
  }

  Widget _buildAddressSectionWidget(PersonalEmployeeResponse employeeResponse,
      PersonalAddressResponse addressResponse) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'ADDRESS',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
        ),
        _buildInfoItemWidget('CURRENT ADDRESS', employeeResponse.address),
        _buildInfoItemWidget('REGION', addressResponse.region?.regDesc),
        _buildInfoItemWidget('PROVINCE', addressResponse.province?.provDesc),
        _buildInfoItemWidget('CITY', addressResponse.city?.citymunDesc),
        _buildInfoItemWidget('BARANGAY', addressResponse.barangay?.brgyDesc),
        _buildInfoItemWidget('SITIO / SUB DIVISION', employeeResponse.sitio),
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
          initialValue: value != null ? value.toUpperCase() : ' -',
          isReadOnly: true,
          textCapitalization: TextCapitalization.characters,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  String parseDate(String date) {
    return DateFormat.yMd().format(DateTime.parse(date));
  }
}
