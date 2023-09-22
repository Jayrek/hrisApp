import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/ui/widget/text_form_field_widget.dart';
import '../../../bloc/my_access/my_access_bloc.dart';
import '../../dashboard/drawer_widget.dart';

class MyAccessProfileScreen extends StatelessWidget {
  const MyAccessProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MyAccessBloc>().add(MyAccessFetched());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'MY ACCESS',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      drawer: const DrawerWidget(),
      body: BlocConsumer<MyAccessBloc, MyAccessState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.myAccessWrapperResponse != null) {
            final myAccessData = state.myAccessWrapperResponse?.response?.data;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'ACCOUNT DATA',
                          style: TextStyle(
                              color: Colors.teal, fontWeight: FontWeight.bold),
                        ),
                      ),
                      _buildInfoItemWidget(
                          'ID NO', myAccessData?.id.toString()),
                      _buildInfoItemWidget(
                          'REF. ID NO', myAccessData?.employeeRefid.toString()),
                      _buildInfoItemWidget(
                          'USERNAME', myAccessData?.username.toString()),
                      _buildInfoItemWidget('LAST ACCESS',
                          parseDate(myAccessData!.lastAccess.toString())),
                      _buildInfoItemWidget(
                          'STATUS', myAccessData.status.toString()),
                    ]),
              ),
            );
          } else if (state.myAccessStatus == MyAccessStatus.loading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return const SizedBox();
        },
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
    return DateFormat('MM/dd/yyyy, hh:mm:s').format(DateTime.parse(date));
  }
}
