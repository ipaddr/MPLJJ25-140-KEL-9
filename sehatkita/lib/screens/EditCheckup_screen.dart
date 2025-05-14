import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditCheckupScreen extends StatefulWidget {
  final String checkupId; // ID pemeriksaan yang akan diedit

  EditCheckupScreen({required this.checkupId});

  @override
  _EditCheckupScreenState createState() => _EditCheckupScreenState();
}

class _EditCheckupScreenState extends State<EditCheckupScreen> {
  final _hospitalController = TextEditingController();
  final _dateController = TextEditingController();
  final _detailsController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadCheckupData();
  }

  // Memuat data pemeriksaan dari Firestore
  _loadCheckupData() async {
    DocumentSnapshot checkupDoc =
        await _firestore.collection('checkups').doc(widget.checkupId).get();
    _hospitalController.text = checkupDoc['hospital'];
    _dateController.text = checkupDoc['date'];
    _detailsController.text = checkupDoc['details'];
  }

  // Memperbarui data pemeriksaan
  _updateCheckup() async {
    await _firestore.collection('checkups').doc(widget.checkupId).update({
      'hospital': _hospitalController.text,
      'date': _dateController.text,
      'details': _detailsController.text,
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Pemeriksaan diperbarui")));
    Navigator.pop(context); // Kembali setelah diperbarui
  }

  // Fungsi untuk menghapus pemeriksaan
  _deleteCheckup() async {
    await _firestore.collection('checkups').doc(widget.checkupId).delete();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Pemeriksaan dihapus")));
    Navigator.pop(context); // Kembali setelah dihapus
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Pemeriksaan")),
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
              onPressed: _updateCheckup,
              child: Text('Perbarui Pemeriksaan'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _deleteCheckup, // Tombol untuk menghapus pemeriksaan
              child: Text('Hapus Pemeriksaan'),
              style: ElevatedButton.styleFrom(
                primary:
                    Colors.red, // Memberikan warna merah untuk tombol hapus
              ),
            ),
          ],
        ),
      ),
    );
  }
}
