import 'package:flutter/material.dart';
import 'package:sehatkita/color.dart';
import 'login_screen.dart';
import 'login_petugas_screen.dart';
import 'login_admin_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/splash_screen.png'),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('Login sebagai Pengguna'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/loginPetugas');
                },
                child: Text('Login sebagai Petugas'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/loginAdmin');
                },
                child: Text('Login sebagai Admin'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
