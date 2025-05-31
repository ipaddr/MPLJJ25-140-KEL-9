import 'package:flutter/material.dart';
import 'package:sehatkita/color.dart';
import 'package:sehatkita/screen/splash_screen.dart';
import 'package:sehatkita/screen/login_screen.dart';
import 'package:sehatkita/screen/register_screen.dart';
import 'package:sehatkita/screen/home_screen.dart';
import 'package:sehatkita/screen/jadwal_screen.dart';
import 'package:sehatkita/screen/profil_screen.dart';
import 'package:sehatkita/screen/login_petugas_screen.dart';
import 'package:sehatkita/screen/register_petugas_screen.dart';
import 'package:sehatkita/screen/verifikasi_petugas_screen.dart';
import 'package:sehatkita/screen/dashboard_petugas.dart';
import 'package:sehatkita/screen/input_data_petugas_screen.dart';
import 'package:sehatkita/screen/login_admin_screen.dart';
import 'package:sehatkita/screen/bottom_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:
    DefaultFirebaseOptions
        .currentPlatform, // Menggunakan konfigurasi dari firebase_options.dart
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SehatKita',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/jadwal': (context) => JadwalScreen(),
        '/profil': (context) => ProfilScreen(),
        '/loginPetugas': (context) => LoginPetugasScreen(),
        '/registerPetugas': (context) => RegisterPetugasScreen(),
        '/verifikasiPetugas': (context) => VerificationPetugasScreen(),
        '/dashboardPetugas': (context) => BottomNavBar(),
        '/inputDataPetugas': (context) => InputDataPetugasScreen(),
        '/loginAdmin': (context) => LoginAdminScreen(),
      },
    );
  }
}
