import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/app_route.dart';

class DrawerWidet extends StatelessWidget {
  const DrawerWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color(0xFFEFF7D0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    radius: 40,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'DELA CRUZ, SANTOS, JUANA MARIA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w800),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
            drawerList(context)
          ],
        ));
  }

  Widget drawerList(BuildContext context) {
    return Column(
      children: [
        drawerItem(Icons.person, 'PERSONAL', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.personal.name);
        }),
        drawerItem(Icons.person_add_alt_sharp, 'EMPLOYMENT', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.employment.name);
        }),
        drawerItem(Icons.work, 'WORK', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.work.name);
        }),
        drawerItem(Icons.note, 'LEAVE', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.leaves.name);
        }),
        drawerItem(Icons.access_time, 'ATTENDANCE', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.attendance.name);
        }),
        drawerItem(Icons.timeline_outlined, 'PERFORMANCE', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.performance.name);
        }),
        drawerItem(Icons.note_outlined, 'DOCUMENTS', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.documents.name);
        }),
        drawerItem(Icons.notes_rounded, 'RGS HANDBOOK', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.handbook.name);
        }),
        drawerItem(Icons.note_alt_sharp, 'REQUEST UPDATE', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.requestUpdate.name);
        }),
        drawerItem(Icons.account_circle, 'MY ACCESS', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.myAccess.name);
        }),
        drawerItem(Icons.key, 'CHANGE PASSWORD', onTap: () {
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.changePassword.name);
        }),
      ],
    );
  }

  Widget drawerItem(IconData icon, String title, {Function()? onTap}) {
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
