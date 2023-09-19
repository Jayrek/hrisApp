import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/ui/widget/widget_util.dart';
import '../../bloc/performance/performance_bloc.dart';

class PerformanceGoalsScreen extends StatelessWidget {
  const PerformanceGoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PerformanceBloc>().add(PerformanceGoalsFetched());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'GOALS',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: BlocBuilder<PerformanceBloc, PerformanceState>(
        builder: (context, state) {
          if (state is PerformanceGoalsLoaded) {
            final goalsWrapper = state.goalsWrapperResponse;
            return ListView.builder(
                itemCount: goalsWrapper.response?.data?.goals?.length,
                itemBuilder: (context, index) {
                  final goals = goalsWrapper.response?.data?.goals?[index];
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
                                          'SET DATE',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(parseDate(
                                            goals!.setDate.toString())),
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
                                        'COMPLETION:',
                                        parseDate(
                                            goals.completionDate.toString())),
                                    const SizedBox(height: 10),
                                    _buildPerformanceItemWidget(
                                        'GOAL:', '${goals.goalDescription}'),
                                    const SizedBox(height: 10),
                                    _buildPerformanceItemWidget(
                                        'EMPLOYEE ASSESSMENT:',
                                        '${goals.empAssessment}'),
                                    const SizedBox(height: 10),
                                    _buildPerformanceItemWidget(
                                        'SUPERVISOR:', '${goals.supervisor}'),
                                    const SizedBox(height: 10),
                                    _buildPerformanceItemWidget(
                                        'SUPERVISOR ASSESSMENT:',
                                        '${goals.supAssessment}'),
                                    const SizedBox(height: 10),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: WidgetUtil.customDivider(),
                      ),
                      const SizedBox(height: 20),
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
