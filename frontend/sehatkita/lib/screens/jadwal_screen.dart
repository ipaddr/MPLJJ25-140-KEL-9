import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JadwalScreen extends StatefulWidget {
  @override
  _JadwalScreenState createState() => _JadwalScreenState();
}

class _JadwalScreenState extends State<JadwalScreen> {
  List<dynamic> jadwalData = [];

  @override
  void initState() {
    super.initState();
    fetchJadwal();
  }

  Future<void> fetchJadwal() async {
    final response = await http.get(
      Uri.parse('http://localhost:3000/api/jadwal'),
    );

    if (response.statusCode == 200) {
      setState(() {
        jadwalData = json.decode(response.body);
      });
    } else {
      print('Gagal mengambil jadwal');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jadwal Pemeriksaan')),
      body: ListView.builder(
        itemCount: jadwalData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Jadwal: ${jadwalData[index]['name']}'),
            subtitle: Text('Tanggal: ${jadwalData[index]['date']}'),
          );
        },
      ),
    );
  }
}
