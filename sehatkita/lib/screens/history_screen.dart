import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fungsi untuk mengambil riwayat pemeriksaan pengguna dari Firestore
  Future<List<Map<String, dynamic>>> _getHistory() async {
    QuerySnapshot snapshot = await _firestore.collection('checkups').get();
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Riwayat Pemeriksaan")),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _getHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Tidak ada riwayat pemeriksaan.'));
          }

          List<Map<String, dynamic>> checkups = snapshot.data!;

          return ListView.builder(
            itemCount: checkups.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> checkup = checkups[index];
              return ListTile(
                title: Text(checkup['date']),
                subtitle: Text(checkup['details']),
                trailing: IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {
                    // Aksi untuk melihat detail pemeriksaan jika diperlukan
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
