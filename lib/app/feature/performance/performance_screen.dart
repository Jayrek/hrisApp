import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rgs_hris/app/feature/dashboard/drawer_widget.dart';
import 'package:rgs_hris/core/ui/widget/widget_util.dart';

import '../../../router/app_route.dart';

class PerformanceScreen extends StatelessWidget {
  const PerformanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildPerformanceItemWidget(
              'EMPLOYEE PERFORMANCE',
              () => context.pushNamed(
                AppRoute.performanceProfile.name,
              ),
            ),
            WidgetUtil.customDivider(),
            _buildPerformanceItemWidget(
              'EMPLOYEE PERFORMANCE GOAL',
              () => context.pushNamed(
                AppRoute.performanceGoals.name,
              ),
            ),
            WidgetUtil.customDivider(),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceItemWidget(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: WidgetUtil.dataHeaderLabel(label),
      ),
    );
  }
}
