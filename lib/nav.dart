import 'package:flutter/material.dart';
import 'package:Aganol/kelompok.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(
              icon: Icons.folder,
              text: 'Tugasku',
              onTap: () => print('Tap My Task')),
          _drawerItem(
              icon: Icons.group,
              text: 'Kelompok',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ApkHome()));
              }),
          _drawerItem(
              icon: Icons.access_time,
              text: 'Absensi',
              onTap: () => print('Tap Absen menu')),
          _drawerItem(
              icon: Icons.text_snippet_sharp,
              text: 'Laporanku',
              onTap: () => print('Tap Laporan menu')),
          Divider(height: 25, thickness: 1),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text("Meet",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                )),
          ),
          _drawerItem(
              icon: Icons.textsms_rounded,
              text: 'Chat',
              onTap: () => print('Tap Chat menu')),
          _drawerItem(
              icon: Icons.notifications,
              text: 'Info',
              onTap: () => print('Tap Info menu')),
          _drawerItem(
              icon: Icons.settings,
              text: 'Pengaturan',
              onTap: () => print('Tap Setting menu')),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return UserAccountsDrawerHeader(
    decoration: new BoxDecoration(color: Colors.lightGreen),
    currentAccountPicture: ClipOval(
      child: Image(
          image: AssetImage('assets/images/orang1.jpg'), fit: BoxFit.cover),
    ),
    accountName: Text('Wahyu Tricahyo Mulyo'),
    accountEmail: Text('Stikom@gmail.com'),
  );
}

Widget _drawerItem({IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
