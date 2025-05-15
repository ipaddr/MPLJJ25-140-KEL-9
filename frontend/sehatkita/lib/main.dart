import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/register_screen.dart';
import 'screens/admin_dashboard.dart';
import 'screens/petugas_dashboard.dart';
import 'screens/riwayat_screen.dart';
import 'screens/jadwal_screen.dart'; // Import jadwal screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SehatKita',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/register': (context) => RegisterScreen(),
        '/admin': (context) => AdminDashboard(),
        '/petugas': (context) => PetugasDashboard(),
        '/riwayat': (context) => RiwayatScreen(),
        '/jadwal': (context) => JadwalScreen(), // Rute ke jadwal
      },
    );
  }
}
