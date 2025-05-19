import 'package:flutter/material.dart';
import 'package:sehatkita/color.dart'; // Assuming color.dart contains the green color

class HasilPemeriksaanScreen extends StatelessWidget {
  const HasilPemeriksaanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Pemeriksaan'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '22 April 2025 - 08.00 WIB',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.calendar_today),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Text(
                    'Status: ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Chip(
                    label: Text('selesai'),
                    backgroundColor: AppColors.green,
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                'Gejala: Demam,batuk',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8.0),
              Text(
                'Lokasi: Puskesmas Nanggalo',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}