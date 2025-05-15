import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OtpVerificationScreen extends StatefulWidget {
  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _otpController = TextEditingController();

  Future<void> verifyOtp() async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/api/otp/verify'),
      body: json.encode({'otp': _otpController.text}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('OTP Verifikasi berhasil');
      // Arahkan ke halaman dashboard atau profil pengguna
    } else {
      print('OTP Salah');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verifikasi OTP')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _otpController,
              decoration: InputDecoration(labelText: 'Masukkan Kode OTP'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: verifyOtp, child: Text('Verifikasi OTP')),
          ],
        ),
      ),
    );
  }
}
