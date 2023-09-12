import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rgs_hris/app/feature/dashboard/drawer_widget.dart';
import 'package:rgs_hris/core/data/model/response/types_response.dart';
import 'package:rgs_hris/router/app_route.dart';

import '../../bloc/leaves/leaves_bloc.dart';

class LeavesScreen extends StatelessWidget {
  const LeavesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LeavesBloc>().add(const LeavesFetched(
        dateFrom: '', dateTo: '', type: '1', status: 'Pending'));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'LEAVES',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text('Modal BottomSheet'),
                        ElevatedButton(
                          child: const Text('Close BottomSheet'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(
              Icons.filter_alt_outlined,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      drawer: const DrawerWidet(),
      bottomNavigationBar: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 40,
                top: 20,
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal),
                  elevation: MaterialStateProperty.all(0),
                ),
                onPressed: () => context.pushNamed(AppRoute.leavesRequest.name),
                child: const Text('+ Apply for Leave'),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<LeavesBloc, LeavesState>(
        builder: (context, state) {
          if (state is LeavesLoaded) {
            // final leaveStatus = state.leavesWrapperResponse.leavesResponse
            //     ?.leavesDataResponse?.dropdownOptions?.status;

            final leaveTypes = state.leavesWrapperResponse.leavesResponse
                ?.leavesDataResponse?.dropdownOptions?.types;

            final leaveCredits = state.leavesWrapperResponse.leavesResponse
                ?.leavesDataResponse?.currentLeaveCredits;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.leavesWrapperResponse.leavesResponse
                          ?.leavesDataResponse?.leaveApplications?.length,
                      itemBuilder: (context, index) {
                        final leaveApplications = state
                            .leavesWrapperResponse
                            .leavesResponse
                            ?.leavesDataResponse
                            ?.leaveApplications?[index];
                        return InkWell(
                          onTap: () =>
                              context.pushNamed(AppRoute.leaveDetail.name),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Leave Type: ${getLeaveTypeName(leaveTypes, leaveApplications?.type)} '),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        'Start Date: ${leaveApplications?.dateFrom.toString()}'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        'End Date: ${leaveApplications?.dateTo.toString()}'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        'No. of Days: ${leaveApplications?.noDays.toString()}'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        'Status: ${leaveApplications?.status.toString().toUpperCase()}'),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: Colors.grey.shade400,
                              ),
                            ],
                          ),
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          '2023 LEAVE CREDITS',
                          style: TextStyle(
                              color: Colors.teal, fontWeight: FontWeight.bold),
                        ),
                        Wrap(
                          children: [
                            _buildLeaveCreditsWidget(
                                'SICK LEAVE', leaveCredits!.sl.toString()),
                            _buildLeaveCreditsWidget(
                                'VACATION LEAVE', leaveCredits.vl.toString()),
                            _buildLeaveCreditsWidget('SOLO PARENT LEAVE',
                                leaveCredits.spl.toString()),
                            _buildLeaveCreditsWidget(
                                'PATERNITY LEAVE', leaveCredits.pl.toString()),
                            _buildLeaveCreditsWidget(
                                'MATERNITY LEAVE', leaveCredits.ml.toString()),
                            _buildLeaveCreditsWidget('BEREAVEMENT LEAVE',
                                leaveCredits.bl.toString()),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   color: Colors.yellow,
                  //   height: 200,
                  // )
                ],
              ),
            );
          }
          if (state is LeavesLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return const Center(
            child: Text('leaves'),
          );
        },
      ),
    );
  }

  Widget _buildLeaveCreditsWidget(String leaveType, String credits) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey.shade200)),
        child: Column(
          children: [
            Text(
              leaveType,
              style: TextStyle(
                fontSize: 10,
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              credits,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? getLeaveTypeName(TypesResponse? typesResponse, int? type) {
    switch (type) {
      case 1:
        return typesResponse?.one?.toUpperCase();
      case 2:
        return typesResponse?.two?.toUpperCase();
      case 3:
        return typesResponse?.three?.toUpperCase();
      case 4:
        return typesResponse?.four?.toUpperCase();
      case 5:
        return typesResponse?.five?.toUpperCase();
      case 6:
        return typesResponse?.five?.toUpperCase();
      default:
        return '';
    }
  }
}
