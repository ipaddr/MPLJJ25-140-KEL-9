import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart'; // Import untuk FCM
import 'screens/home_screen.dart';
import 'screens/AddSchedule_screen.dart'; // Perbaiki import halaman tambah jadwal
//import 'screens/history_screen.dart'; // Import halaman riwayat pemeriksaan
import 'screens/profile_screen.dart'; // Import halaman profil pengguna
import 'screens/EditSchedule_screen.dart';
import 'package:sehatkita/screens/users_screen.dart'; // Import halaman daftar pengguna
import 'package:sehatkita/screens/OtpVerification_screen.dart'; // Import halaman OTP verification

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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Firebase Messaging instance
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    _getFcmToken();
  }

  // Mendapatkan token FCM setelah Firebase diinisialisasi
  Future<void> _getFcmToken() async {
    String? token = await messaging.getToken();
    print("FCM Token: $token");

    // Simpan token FCM di Firestore atau SharedPreferences jika perlu
    if (token != null) {
      await _saveFcmToken(token);
    }
  }

  // Fungsi untuk menyimpan token FCM ke Firestore
  Future<void> _saveFcmToken(String token) async {
    // Menyimpan token ke Firestore setelah pengguna berhasil login atau terautentikasi
    FirebaseFirestore.instance.collection('users').doc('user_uid').update({
      'fcmToken': token, // Menyimpan token FCM pada koleksi pengguna
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SehatKita',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/', // Tentukan rute awal
      routes: {
        '/': (context) => HomeScreen(), // Halaman awal (HomeScreen)
        '/home':
            (context) =>
                HomeScreen(), // Rute ke halaman utama setelah verifikasi
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
            (context) => EditScheduleCheckupScreen(
              id: 'schedule_id', // Ganti dengan ID yang sesuai
              type: 'schedule',
            ), // Rute untuk halaman penjadwalan ulang pemeriksaan
        '/otpVerification':
            (context) =>
                OtpVerificationScreen(), // Rute untuk halaman OTP verification
      },
    );
  }
}
