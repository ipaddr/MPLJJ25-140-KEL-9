import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController _searchController = TextEditingController();

  // Fungsi untuk mengambil data jadwal dan filter berdasarkan pencarian
  Stream<List<Map<String, dynamic>>> _getSchedule() {
    return FirebaseFirestore.instance.collection('schedules').snapshots().map((
      snapshot,
    ) {
      // Mengambil data dari Firestore dan memfilter berdasarkan pencarian
      return snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .where((schedule) {
            return schedule['hospital'].toLowerCase().contains(
                  _searchController.text.toLowerCase(),
                ) ||
                schedule['date'].toLowerCase().contains(
                  _searchController.text.toLowerCase(),
                );
          })
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jadwal Pemeriksaan")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Cari Jadwal',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (text) {
                setState(() {}); // Trigger untuk memperbarui pencarian
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: _getSchedule(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                var schedules = snapshot.data!;

                if (schedules.isEmpty) {
                  return Center(child: Text('Tidak ada jadwal yang ditemukan'));
                }

                return ListView.builder(
                  itemCount: schedules.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> schedule = schedules[index];
                    return ListTile(
                      title: Text(schedule['hospital']),
                      subtitle: Text(schedule['date']),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        // Navigasi ke detail jadwal jika diperlukan
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
