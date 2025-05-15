import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PatientDataScreen extends StatefulWidget {
  @override
  _PatientDataScreenState createState() => _PatientDataScreenState();
}

class _PatientDataScreenState extends State<PatientDataScreen> {
  List<dynamic> patientData = [];

  @override
  void initState() {
    super.initState();
    fetchPatientData();
  }

  Future<void> fetchPatientData() async {
    final response = await http.get(
      Uri.parse('http://localhost:3000/api/patient'),
    );

    if (response.statusCode == 200) {
      setState(() {
        patientData = json.decode(response.body);
      });
    } else {
      print('Failed to load patient data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Pasien')),
      body: ListView.builder(
        itemCount: patientData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Pasien: ${patientData[index]['name']}'),
            subtitle: Text('Usia: ${patientData[index]['age']}'),
          );
        },
      ),
    );
  }
}
