import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart'; // Import untuk FCM
import 'screens/home_screen.dart';
import 'screens/AddSchedule_screen.dart'; // Perbaiki import halaman tambah jadwal
import 'screens/history_screen.dart'; // Import halaman riwayat pemeriksaan
import 'screens/profile_screen.dart'; // Import halaman profil pengguna
import 'screens/EditSchedule_screen.dart'; // Import halaman penjadwalan ulang pemeriksaan
import 'package:sehatkita/screens/users_screen.dart'; // Import halaman daftar pengguna

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Menginisialisasi Firebase
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}

// Fungsi untuk menangani notifikasi saat aplikasi berjalan di background
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SehatKita',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/', // Tentukan rute awal
      routes: {
        '/': (context) => HomeScreen(), // Halaman awal (HomeScreen)
        '/users':
            (context) => UsersScreen(), // Rute untuk halaman daftar pengguna
        '/addSchedule':
            (context) =>
                AddScheduleScreen(), // Rute untuk halaman tambah jadwal
        '/history':
            (context) =>
                HistoryScreen(), // Rute untuk halaman riwayat pemeriksaan
        '/profile':
            (context) => ProfileScreen(), // Rute untuk halaman profil pengguna
        '/editSchedule':
            (context) => EditScheduleScreen(
              scheduleId: 'schedule_id',
            ), // Rute untuk halaman penjadwalan ulang pemeriksaan
      },
    );
  }
}
