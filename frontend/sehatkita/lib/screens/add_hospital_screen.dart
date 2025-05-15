import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddHospitalScreen extends StatefulWidget {
  @override
  _AddHospitalScreenState createState() => _AddHospitalScreenState();
}

class _AddHospitalScreenState extends State<AddHospitalScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();

  Future<void> addHospital() async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/api/admin/add-hospital'),
      body: json.encode({
        'name': _nameController.text,
        'address': _addressController.text,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('Rumah Sakit berhasil ditambahkan');
      // Kembali ke halaman Admin Dashboard atau beri notifikasi
    } else {
      print('Gagal menambah rumah sakit');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Rumah Sakit')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama Rumah Sakit'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Alamat Rumah Sakit'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addHospital,
              child: Text('Tambah Rumah Sakit'),
            ),
          ],
        ),
      ),
    );
  }
}
