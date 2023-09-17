import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rgs_hris/app/feature/dashboard/drawer_widget.dart';
import 'package:rgs_hris/router/app_route.dart';

import '../../../bloc/my_access_bloc.dart';

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
                      Column(
                        children: [
                          Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 2,
                                ),
                                child: SizedBox(
                                  height: 50,
                                  child: OutlinedButton(
                                    child: const Text(
                                      'CHANGE PASSWORD',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                    onPressed: () => context.pushNamed(
                                        AppRoute.myAccessChangePassword.name),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 2,
                                ),
                                child: SizedBox(
                                  height: 50,
                                  child: OutlinedButton(
                                    child: const Text(
                                      'CHANGE USERNAME',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                    onPressed: () => context.pushNamed(
                                      AppRoute.myAccessChangeUserName.name,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
