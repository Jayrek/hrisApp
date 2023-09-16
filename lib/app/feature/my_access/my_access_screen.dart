import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rgs_hris/app/feature/dashboard/drawer_widget.dart';
import 'package:rgs_hris/router/app_route.dart';

import '../../bloc/my_access_bloc.dart';

class MyAccessScreen extends StatelessWidget {
  const MyAccessScreen({super.key});

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
          if (state is MyAccessLoaded) {
            final myAccessData = state.myAccessWrapperResponse.response?.data;
            print('myAccessData: $myAccessData');
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: OutlinedButton(
                                    child: const Text(
                                      'Change Password',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () => context.pushNamed(
                                        AppRoute.changePassword.name),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: OutlinedButton(
                                    child: const Text(
                                      'Change Username',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            );
          } else if (state is MyAccessLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildInfoItemWidget(String label, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.teal)),
        const SizedBox(height: 10),
        Text((value ?? '-').toUpperCase()),
        const SizedBox(height: 20),
        Divider(
          height: 1,
          color: Colors.grey.shade400,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  String parseDate(String date) {
    return DateFormat('MM/dd/yyyy, hh:mm:s').format(DateTime.parse(date));
  }
}
