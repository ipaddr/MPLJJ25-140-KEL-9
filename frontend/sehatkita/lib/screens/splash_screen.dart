import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sehatkita/screens/register.dart'; // Mengarahkan ke halaman register

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Menunggu 3 detik sebelum mengarahkan ke halaman register
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RegisterScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          'SehatKita', // Nama aplikasi
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
