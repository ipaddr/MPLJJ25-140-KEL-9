import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fungsi untuk mengambil data pengguna
  Future<List<Map<String, dynamic>>> _getUsers() async {
    QuerySnapshot snapshot = await _firestore.collection('users').get();
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  // Fungsi untuk menghapus pengguna
  _deleteUser(String userId) async {
    await _firestore.collection('users').doc(userId).delete();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Pengguna dihapus')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Pengguna")),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Tidak ada pengguna.'));
          }

          List<Map<String, dynamic>> users = snapshot.data!;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> user = users[index];
              return ListTile(
                title: Text(user['name']),
                subtitle: Text(user['email']),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteUser(
                      user['uid'],
                    ); // Menghapus pengguna berdasarkan UID
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
