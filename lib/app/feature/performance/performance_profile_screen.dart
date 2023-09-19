import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rgs_hris/core/ui/widget/widget_util.dart';

import '../../bloc/performance/performance_bloc.dart';

class PerformanceProfileScreen extends StatelessWidget {
  const PerformanceProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PerformanceBloc>().add(PerformanceProfileFetched());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'PERFORMANCE',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: BlocBuilder<PerformanceBloc, PerformanceState>(
        builder: (context, state) {
          if (state is PerformanceProfileLoaded) {
            final performanceWrapper = state.performanceWrapperResponse;
            return ListView.builder(
                itemCount:
                    performanceWrapper.response?.data?.performances?.length,
                itemBuilder: (context, index) {
                  final performance =
                      performanceWrapper.response?.data?.performances?[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            Container(
                                height: 30,
                                width: double.infinity,
                                color: Colors.grey.shade100,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'REVIEW DATE',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(parseDate(performance!.reviewDate
                                            .toString())),
                                      ],
                                    ),
                                  ),
                                )),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const SizedBox(height: 10),
                                    _buildPerformanceItemWidget(
                                        'JOB KNOWLEDGE:',
                                        '${performance.jobKnowledge}'),
                                    const SizedBox(height: 10),
                                    _buildPerformanceItemWidget('WORK QUALITY:',
                                        '${performance.workquality}'),
                                    const SizedBox(height: 10),
                                    _buildPerformanceItemWidget('PUNCTUALITY:',
                                        '${performance.punctuality}'),
                                    const SizedBox(height: 10),
                                    _buildPerformanceItemWidget(
                                        'COMMUNICATION:',
                                        '${performance.communication}'),
                                    const SizedBox(height: 10),
                                    _buildPerformanceItemWidget(
                                        'DEPENDABILITY:',
                                        '${performance.dependability}'),
                                    const SizedBox(height: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          'COMMENT / NOTE:',
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(
                                            '${performance.comments}',
                                            style: TextStyle(
                                                color: Colors.black45),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: WidgetUtil.customDivider(),
                      )
                    ],
                  );
                });
          }
          if (state is PerformanceLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildPerformanceItemWidget(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(value),
      ],
    );
  }

  String parseDate(String date) {
    return DateFormat.yMd().format(DateTime.parse(date));
  }
}
