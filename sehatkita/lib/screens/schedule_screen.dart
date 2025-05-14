import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScheduleScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> _getSchedule() async {
    QuerySnapshot snapshot = await _firestore.collection('schedules').get();
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Schedule")),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _getSchedule(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No schedules available.'));
          }

          List<Map<String, dynamic>> schedules = snapshot.data!;

          return ListView.builder(
            itemCount: schedules.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> schedule = schedules[index];
              return ListTile(
                title: Text(schedule['date']),
                subtitle: Text(schedule['hospital']),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    // Implement navigation to schedule details
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
