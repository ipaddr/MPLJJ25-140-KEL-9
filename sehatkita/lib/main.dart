import 'package:flutter/material.dart';
import 'package:sehatkita/screen/home_screen.dart'; // Import HomeScreen
import 'package:sehatkita/screen/login_screen.dart'; // Import LoginScreen
import 'package:sehatkita/screen/register_screen.dart'; // Import RegisterScreen
import 'package:sehatkita/screen/splash_screen.dart'; // Import SplashScreen
import 'package:sehatkita/color.dart'; // Import color for theme

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SehatKita',
      theme: ThemeData(
        primarySwatch: Colors.green, // Menggunakan warna hijau sebagai tema
      ),
      // Arahkan ke SplashScreen saat pertama kali dibuka
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
