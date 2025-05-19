import 'package:flutter/material.dart';
import 'package:sehatkita/screen/bottom_navigation_bar.dart';
import 'package:sehatkita/screen/home_screen.dart';
import 'package:sehatkita/screen/login_screen.dart';
import 'package:sehatkita/screen/register_screen.dart';
import 'package:sehatkita/screen/splash_screen.dart';
import 'package:sehatkita/color.dart';
// Ensure that the file 'bottom_navigation_bar.dart' contains a class named 'BottomNavBar'
import 'package:sehatkita/screen/login_petugas_screen.dart';
import 'package:sehatkita/screen/register_petugas_screen.dart';
import 'package:sehatkita/screen/verifikasi_petugas_screen.dart';
import 'package:sehatkita/screen/dashboard_petugas.dart';
import 'package:sehatkita/screen/input_data_petugas_screen.dart';
import 'package:sehatkita/screen/login_admin_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Added named key parameter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SehatKita',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/loginPetugas',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/loginPetugas': (context) => LoginPetugasScreen(),
        '/registerPetugas': (context) => RegisterPetugasScreen(),
        '/verifikasiPetugas': (context) => VerificationPetugasScreen(),
        '/dashboardPetugas': (context) => BottomNavBar(),
        '/inputDataPetugas': (context) => InputDataPetugasScreen(),
        '/loginAdmin': (context) => LoginAdminScreen(),
        '/splash': (context) => SplashScreen(),
      },
    );
  }
}