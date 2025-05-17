import 'package:flutter/material.dart';
import 'package:sehatkita/color.dart'; // Menggunakan warna dari AppColors

class JadwalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Jadwal Pemeriksaan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('21 Apr 2025 - 10:00 AM'),
              subtitle: Text('RS.A - Jln.A (1.2 km)'),
              onTap: () {
                // Arahkan ke halaman detail jadwal atau form
              },
            ),
            ListTile(
              title: Text('22 Apr 2025 - 11:00 AM'),
              subtitle: Text('RS.B - Jln.B (3.9 km)'),
              onTap: () {
                // Arahkan ke halaman detail jadwal atau form
              },
            ),
            ListTile(
              title: Text('23 Apr 2025 - 08:00 AM'),
              subtitle: Text('RS.C - Jln.C (2.7 km)'),
              onTap: () {
                // Arahkan ke halaman detail jadwal atau form
              },
            ),
          ],
        ),
      ),
    );
  }
}
