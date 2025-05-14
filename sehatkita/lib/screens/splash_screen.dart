import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  // Fungsi untuk mengatur navigasi setelah Splash Screen
  _navigateToNextPage() async {
    await Future.delayed(Duration(seconds: 3), () {});

    // Cek apakah sudah login
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gambar logo atau animasi
            Image.asset('assets/splash_logo.png', width: 150),
            SizedBox(height: 20),
            CircularProgressIndicator(), // Menampilkan indikator loading
          ],
        ),
      ),
    );
  }
}
