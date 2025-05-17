import 'package:flutter/material.dart';
import 'package:sehatkita/screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreenPage());
  }
}

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: NextScreen(),
      title: Text(
        'Bersama Menuju Indonesia Bebas TBC 2029',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      image: Image.asset('assets/images/splash_screen.png'), // Path gambar
      backgroundColor: Colors.green,
      loaderColor: Colors.white,
    );
  }
}

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(child: Text('Welcome to the app!')),
    );
  }
}
