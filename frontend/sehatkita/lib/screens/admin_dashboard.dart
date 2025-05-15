import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Arahkan ke halaman untuk menambah rumah sakit
              },
              child: Text('Tambah Rumah Sakit'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Arahkan ke halaman untuk menambah petugas
              },
              child: Text('Tambah Petugas Rumah Sakit'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Arahkan ke halaman daftar pasien
              },
              child: Text('Daftar Pasien'),
            ),
          ],
        ),
      ),
    );
  }
}
