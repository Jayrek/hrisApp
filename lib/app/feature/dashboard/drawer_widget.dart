import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rgs_hris/app/bloc/auth/auth_bloc.dart';

import '../../../router/app_route.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color(0xFFEFF7D0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            _buildDrawerHeader(),
            Divider(
              height: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
            _buildDrawerList(context)
          ],
        ));
  }

  Widget _buildDrawerHeader() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSignInSuccess) {
          final employeeData = state.loginWrapperResponse.loginResponse
              ?.loginDataResponse?.employeeDetails;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue.shade200,
                  radius: 40,
                  child: CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.grey.shade300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '${employeeData?.name.toString()}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                )
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildDrawerList(BuildContext context) {
    return Column(
      children: [
        _buildDrawerItem(Icons.person, 'PERSONAL', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.personal.name);
        }),
        _buildDrawerItem(Icons.person_add_alt_sharp, 'EMPLOYMENT', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.employment.name);
        }),
        _buildDrawerItem(Icons.work, 'WORK', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.work.name);
        }),
        _buildDrawerItem(Icons.note, 'LEAVE', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.leaves.name);
        }),
        _buildDrawerItem(Icons.access_time, 'ATTENDANCE', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.attendance.name);
        }),
        _buildDrawerItem(Icons.timeline_outlined, 'PERFORMANCE', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.performance.name);
        }),
        _buildDrawerItem(Icons.note_outlined, 'DOCUMENTS', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.documents.name);
        }),
        _buildDrawerItem(Icons.notes_rounded, 'RGS HANDBOOK', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.handbook.name);
        }),
        _buildDrawerItem(Icons.note_alt_sharp, 'REQUEST UPDATE', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.requestUpdate.name);
        }),
        _buildDrawerItem(Icons.account_circle, 'MY ACCESS', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.myAccess.name);
        }),
        _buildDrawerItem(Icons.key, 'CHANGE PASSWORD', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.changePassword.name);
        }),
      ],
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, {Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListTile(
        tileColor: const Color(0xFFEFF7D0),
        visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        leading: Icon(
          icon,
          size: 15,
          color: Colors.black,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
