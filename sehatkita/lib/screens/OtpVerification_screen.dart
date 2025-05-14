import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OtpVerificationScreen extends StatefulWidget {
  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Fungsi untuk mengirim OTP (Email Verification)
  Future<void> _sendOtp() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        // Kirim email verifikasi
        await user.sendEmailVerification();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OTP telah dikirim ke email Anda.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mengirim OTP: ${e.toString()}')),
      );
    }
  }

  // Fungsi untuk memverifikasi apakah email sudah terverifikasi
  Future<void> _verifyOtp() async {
    try {
      User? user = _auth.currentUser;

      if (user != null && !user.emailVerified) {
        // Reload user untuk memeriksa apakah email sudah diverifikasi
        await user.reload();
        if (user.emailVerified) {
          Navigator.pushReplacementNamed(
            context,
            '/home',
          ); // Halaman setelah OTP terverifikasi
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Email belum terverifikasi.')));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tidak ada pengguna yang terautentikasi.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verifikasi OTP")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input untuk kode OTP
            TextField(
              controller: _otpController,
              decoration: InputDecoration(labelText: 'Masukkan Kode OTP'),
            ),
            SizedBox(height: 20),
            // Tombol untuk verifikasi
            ElevatedButton(onPressed: _verifyOtp, child: Text('Verifikasi')),
            SizedBox(height: 10),
            // Tombol untuk mengirim OTP jika belum
            ElevatedButton(onPressed: _sendOtp, child: Text('Kirim OTP')),
          ],
        ),
      ),
    );
  }
}
