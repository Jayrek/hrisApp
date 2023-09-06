import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var toolbarTitle = 'PERSONAL';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          toolbarTitle,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.logout))],
      ),
      drawer: Drawer(
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
              drawerList()
            ],
          )),
      body: Center(
        child: Text(
          '$toolbarTitle SCREEN',
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

  Widget drawerList() {
    return Column(
      children: [
        drawerItem(Icons.person, 'PERSONAL', onTap: () {
          setState(() => toolbarTitle = 'PERSONAL');
          Navigator.of(context).pop();
        }),
        drawerItem(Icons.person_add_alt_sharp, 'EMPLOYMENT', onTap: () {
          setState(() => toolbarTitle = 'EMPLOYMENT');
          Navigator.of(context).pop();
        }),
        drawerItem(Icons.work, 'WORK', onTap: () {
          setState(() => toolbarTitle = 'WORK');
          Navigator.of(context).pop();
        }),
        drawerItem(Icons.note, 'LEAVE', onTap: () {
          setState(() => toolbarTitle = 'LEAVE');
          Navigator.of(context).pop();
        }),
        drawerItem(Icons.access_time, 'ATTENDANCE', onTap: () {
          setState(() => toolbarTitle = 'ATTENDANCE');
          Navigator.of(context).pop();
        }),
        drawerItem(Icons.timeline_outlined, 'PERFORMANCE', onTap: () {
          setState(() => toolbarTitle = 'PERFORMANCE');
          Navigator.of(context).pop();
        }),
        drawerItem(Icons.note_outlined, 'DOCUMENTS', onTap: () {
          setState(() => toolbarTitle = 'DOCUMENTS');
          Navigator.of(context).pop();
        }),
        drawerItem(Icons.notes_rounded, 'RGS HANDBOOK', onTap: () {
          setState(() => toolbarTitle = 'RGS HANDBOOK');
          Navigator.of(context).pop();
        }),
        drawerItem(Icons.note_alt_sharp, 'REQUEST UPDATE', onTap: () {
          setState(() => toolbarTitle = 'REQUEST UPDATE');
          Navigator.of(context).pop();
        }),
        drawerItem(Icons.account_circle, 'MY ACCESS', onTap: () {
          setState(() => toolbarTitle = 'MY ACCESS');
          Navigator.of(context).pop();
        }),
        drawerItem(Icons.key, 'CHANGE PASSWORD', onTap: () {
          setState(() => toolbarTitle = 'CHANGE PASSWORD');
          Navigator.of(context).pop();
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
