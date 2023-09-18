import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  return Text('${performance?.employeeId.toString()}');
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
