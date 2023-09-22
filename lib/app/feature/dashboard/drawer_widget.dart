import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/domain/manager/shared_prefs_manager.dart';
import '../../../router/app_route.dart';
import '../../common/util/key_strings.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color(0xFFEFF7D0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              height: 70,
              child: Image.asset('assets/images/rgs_logo.png'),
            ),
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
    Future<String> getPreference() async {
      final fullName =
          await SharedPrefsManager().getStringPref(KeyStrings.spFullNameKey);
      return fullName;
    }

    return FutureBuilder(
        future: getPreference(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for the data to arrive, show a loading indicator.
            return const CircularProgressIndicator.adaptive();
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    radius: 40,
                    child: CircleAvatar(
                      radius: 37,
                      backgroundColor: Colors.grey.shade300,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      snapshot.data.toString().toUpperCase(),
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
        });
  }

  Widget _buildDrawerList(BuildContext context) {
    return Column(
      children: [
        _buildDrawerItem(Icons.person, 'PERSONAL', onTap: () {
          Navigator.of(context).pop();
          context.pushReplacementNamed(AppRoute.personal.name);
        }),
        _buildDrawerItem(Icons.person_add_alt_sharp, 'EMPLOYMENT', onTap: () {
          Navigator.of(context).pop();
          context.pushReplacementNamed(AppRoute.employment.name);
        }),
        _buildDrawerItem(Icons.work, 'WORK', onTap: () {
          Navigator.of(context).pop();
          context.pushReplacementNamed(AppRoute.work.name);
        }),
        _buildDrawerItem(Icons.note, 'LEAVE', onTap: () {
          Navigator.of(context).pop();
          context.pushReplacementNamed(AppRoute.leaves.name);
        }),
        _buildDrawerItem(Icons.access_time, 'ATTENDANCE', onTap: () {
          Navigator.of(context).pop();
          context.pushReplacementNamed(AppRoute.attendance.name);
        }),
        _buildDrawerItem(Icons.timeline_outlined, 'PERFORMANCE', onTap: () {
          Navigator.of(context).pop();
          context.pushReplacementNamed(AppRoute.performance.name);
        }),
        // _buildDrawerItem(Icons.note_outlined, 'DOCUMENTS', onTap: () {
        //   Navigator.of(context).pop();
        //   context.pushReplacementNamed(AppRoute.documents.name);
        // }),
        _buildDrawerItem(Icons.note_alt_sharp, 'REQUEST UPDATE', onTap: () {
          Navigator.of(context).pop();
          context.pushReplacementNamed(AppRoute.changeRequestProfile.name);
        }),
        _buildDrawerItem(Icons.account_circle, 'MY ACCESS', onTap: () {
          Navigator.of(context).pop();
          context.pushReplacementNamed(AppRoute.myAccessProfile.name);
        }),
        _buildDrawerItem(Icons.key, 'CHANGE PASSWORD', onTap: () {
          Navigator.of(context).pop();
          context.pushReplacementNamed(AppRoute.myAccessChangePassword.name);
        }),
        _buildDrawerItem(Icons.logout, 'LOGOUT', onTap: () {
          Navigator.of(context).pop();
          SharedPrefsManager().clearPreference();
          context.pushReplacementNamed(AppRoute.signIn.name);
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
