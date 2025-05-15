import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RiwayatPemeriksaanScreen extends StatefulWidget {
  @override
  _RiwayatPemeriksaanScreenState createState() =>
      _RiwayatPemeriksaanScreenState();
}

class _RiwayatPemeriksaanScreenState extends State<RiwayatPemeriksaanScreen> {
  List<dynamic> riwayatData = [];

  @override
  void initState() {
    super.initState();
    fetchRiwayatPemeriksaan();
  }

  // Fungsi untuk mengambil data riwayat pemeriksaan dari API
  Future<void> fetchRiwayatPemeriksaan() async {
    final response = await http.get(
      Uri.parse('http://localhost:3000/api/riwayat'),
    );

    if (response.statusCode == 200) {
      setState(() {
        riwayatData = json.decode(
          response.body,
        ); // Menyimpan data yang diterima ke dalam riwayatData
      });
    } else {
      print('Failed to load riwayat pemeriksaan');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Pemeriksaan')),
      body:
          riwayatData.isEmpty
              ? Center(
                child: CircularProgressIndicator(),
              ) // Menampilkan loading jika data masih kosong
              : ListView.builder(
                itemCount: riwayatData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Pemeriksaan: ${riwayatData[index]['name']}'),
                    subtitle: Text('Tanggal: ${riwayatData[index]['date']}'),
                  );
                },
              ),
    );
  }
}
