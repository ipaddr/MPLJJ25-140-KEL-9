import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddCheckupScreen extends StatefulWidget {
  @override
  _AddCheckupScreenState createState() => _AddCheckupScreenState();
}

class _AddCheckupScreenState extends State<AddCheckupScreen> {
  final _hospitalController = TextEditingController();
  final _dateController = TextEditingController();
  final _detailsController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _addCheckup() async {
    await _firestore.collection('checkups').add({
      'hospital': _hospitalController.text,
      'date': _dateController.text,
      'details': _detailsController.text,
    });
    Navigator.pop(context); // Kembali setelah pemeriksaan ditambahkan
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Checkup")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _hospitalController,
              decoration: InputDecoration(labelText: 'Hospital'),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            TextField(
              controller: _detailsController,
              decoration: InputDecoration(labelText: 'Checkup Details'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _addCheckup, child: Text('Add Checkup')),
          ],
        ),
      ),
    );
  }
}
