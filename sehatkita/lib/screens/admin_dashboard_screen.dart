import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminDashboardScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> _getHospitals() async {
    QuerySnapshot snapshot = await _firestore.collection('hospitals').get();
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Dashboard")),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _getHospitals(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hospitals available.'));
          }

          List<Map<String, dynamic>> hospitals = snapshot.data!;

          return ListView.builder(
            itemCount: hospitals.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> hospital = hospitals[index];
              return ListTile(
                title: Text(hospital['name']),
                subtitle: Text(hospital['location']),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Implement delete functionality here
                  },
                ),
                onTap: () {
                  // Implement edit functionality here
                },
              );
            },
          );
        },
      ),
    );
  }
}
