import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  return Text('${goals?.employeeId.toString()}');
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
}
