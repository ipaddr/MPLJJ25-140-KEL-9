import 'package:flutter/material.dart';

class PetugasDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Petugas Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Arahkan ke halaman input data pemeriksaan
              },
              child: Text('Input Data Pemeriksaan'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Arahkan ke halaman hasil pemeriksaan
              },
              child: Text('Lihat Hasil Pemeriksaan'),
            ),
          ],
        ),
      ),
    );
  }
}
