import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditScheduleScreen extends StatefulWidget {
  final String scheduleId;
  EditScheduleScreen({required this.scheduleId});

  @override
  _EditScheduleScreenState createState() => _EditScheduleScreenState();
}

class _EditScheduleScreenState extends State<EditScheduleScreen> {
  final _hospitalController = TextEditingController();
  final _dateController = TextEditingController();
  final _detailsController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadScheduleData();
  }

  // Fungsi untuk memuat data jadwal pemeriksaan dari Firestore
  _loadScheduleData() async {
    DocumentSnapshot scheduleDoc =
        await _firestore.collection('schedules').doc(widget.scheduleId).get();
    _hospitalController.text = scheduleDoc['hospital'];
    _dateController.text = scheduleDoc['date'];
    _detailsController.text = scheduleDoc['details'];
  }

  // Fungsi untuk memperbarui jadwal pemeriksaan
  _updateSchedule() async {
    await _firestore.collection('schedules').doc(widget.scheduleId).update({
      'hospital': _hospitalController.text,
      'date': _dateController.text,
      'details': _detailsController.text,
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Schedule updated")));
    Navigator.pop(context); // Kembali ke halaman sebelumnya setelah update
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Jadwal Pemeriksaan")),
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
              onPressed: _updateSchedule,
              child: Text('Perbarui Jadwal'),
            ),
          ],
        ),
      ),
    );
  }
}
