import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/time_in_out/time_in_out_bloc.dart';

class AttendanceTimeInOutWidget extends StatelessWidget {
  const AttendanceTimeInOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // late Stream<DateTime> _timeStream;
    DateTime _currentTime = DateTime.now();

    Stream<DateTime> _timeStream =
        Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now());

    return BlocConsumer<TimeInOutBloc, TimeInOutState>(
      listener: (context, state) {
        if (state is TimeInOutLoaded) {
          showOkAlertDialog(
            barrierDismissible: false,
            context: context,
            title: state.attendanceInOutWrapperResponse.response?.status,
            message:
                state.attendanceInOutWrapperResponse.response?.message?.msg,
          );
        }
        if (state is TimeInOutException) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'ATTENDANCE PANEL',
                  style: TextStyle(
                      color: Colors.teal, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                StreamBuilder<DateTime>(
                    stream: _timeStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        _currentTime = snapshot.data!;
                      }
                      final formattedTime =
                          DateFormat('hh:mm:ss').format(_currentTime);
                      return Container(
                        color: Colors.black,
                        height: 60,
                        child: Center(
                          child: Text(
                            formattedTime,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.yellow.shade200,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.teal),
                            elevation: MaterialStateProperty.all(0),
                          ),
                          onPressed: () {
                            print('triggered');
                            context
                                .read<TimeInOutBloc>()
                                .add(const TimeInOutSet(type: 'am_in'));
                          },
                          child: const Text(
                            'AM IN',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            elevation: MaterialStateProperty.all(0),
                          ),
                          onPressed: () => context
                              .read<TimeInOutBloc>()
                              .add(const TimeInOutSet(type: 'pm_out')),
                          child: const Text(
                            'PM OUT',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (state is TimeInOutLoading)
              const Center(
                child: CircularProgressIndicator.adaptive(),
              )
          ],
        );
      },
    );
  }
}
