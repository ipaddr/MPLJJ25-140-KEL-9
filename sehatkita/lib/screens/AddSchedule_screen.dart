import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddScheduleScreen extends StatefulWidget {
  @override
  _AddScheduleScreenState createState() => _AddScheduleScreenState();
}

class _AddScheduleScreenState extends State<AddScheduleScreen> {
  final _hospitalController = TextEditingController();
  final _dateController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _addSchedule() async {
    await _firestore.collection('schedules').add({
      'hospital': _hospitalController.text,
      'date': _dateController.text,
    });
    Navigator.pop(context); // Kembali setelah jadwal ditambahkan
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Schedule")),
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addSchedule,
              child: Text('Add Schedule'),
            ),
          ],
        ),
      ),
    );
  }
}
