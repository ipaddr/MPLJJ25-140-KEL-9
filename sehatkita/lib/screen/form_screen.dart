import 'package:flutter/material.dart';
import 'package:sehatkita/color.dart'; // Menggunakan warna dari AppColors

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _symptomsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Form Pemeriksaan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Tanggal'),
            ),
            TextField(
              controller: _symptomsController,
              decoration: InputDecoration(labelText: 'Gejala'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Proses pengiriman form
              },
              child: Text('Kirim'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
