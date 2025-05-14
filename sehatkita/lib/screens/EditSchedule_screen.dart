import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditScheduleCheckupScreen extends StatefulWidget {
  final String
  id; // ID yang akan digunakan untuk menentukan entitas yang ingin diedit (schedule atau checkup)
  final String type; // Tipe entitas: "schedule" atau "checkup"

  EditScheduleCheckupScreen({required this.id, required this.type});

  @override
  _EditScheduleCheckupScreenState createState() =>
      _EditScheduleCheckupScreenState();
}

class _EditScheduleCheckupScreenState extends State<EditScheduleCheckupScreen> {
  final _hospitalController = TextEditingController();
  final _dateController = TextEditingController();
  final _detailsController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Fungsi untuk memuat data jadwal pemeriksaan atau pemeriksaan
  _loadData() async {
    DocumentSnapshot doc;
    if (widget.type == 'schedule') {
      doc = await _firestore.collection('schedules').doc(widget.id).get();
    } else {
      doc = await _firestore.collection('checkups').doc(widget.id).get();
    }

    _hospitalController.text = doc['hospital'];
    _dateController.text = doc['date'];
    _detailsController.text = doc['details'];
  }

  // Fungsi untuk memperbarui data jadwal pemeriksaan atau pemeriksaan
  _updateData() async {
    if (widget.type == 'schedule') {
      await _firestore.collection('schedules').doc(widget.id).update({
        'hospital': _hospitalController.text,
        'date': _dateController.text,
        'details': _detailsController.text,
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Jadwal berhasil diperbarui')));
    } else {
      await _firestore.collection('checkups').doc(widget.id).update({
        'hospital': _hospitalController.text,
        'date': _dateController.text,
        'details': _detailsController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pemeriksaan berhasil diperbarui')),
      );
    }
    Navigator.pop(context); // Kembali ke halaman sebelumnya setelah update
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.type == 'schedule'
              ? "Edit Jadwal Pemeriksaan"
              : "Edit Pemeriksaan",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _hospitalController,
              decoration: InputDecoration(labelText: 'Nama Rumah Sakit'),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Tanggal Pemeriksaan'),
            ),
            TextField(
              controller: _detailsController,
              decoration: InputDecoration(labelText: 'Detail Pemeriksaan'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateData,
              child: Text('Perbarui Data'),
            ),
          ],
        ),
      ),
    );
  }
}
