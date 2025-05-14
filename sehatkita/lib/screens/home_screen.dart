import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Menginisialisasi Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SehatKita',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/', // Tentukan rute awal
      routes: {
        '/': (context) => HomeScreen(), // Halaman utama (HomeScreen)
        '/schedule':
            (context) => ScheduleScreen(), // Halaman jadwal pemeriksaan
        '/history': (context) => HistoryScreen(), // Halaman riwayat pemeriksaan
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? fcmToken;

  @override
  void initState() {
    super.initState();
    _getFcmToken();
  }

  // Mendapatkan token FCM
  Future<void> _getFcmToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Mendapatkan token FCM
    String? token = await messaging.getToken();
    print("FCM Token: $token");
    setState(() {
      fcmToken = token;
    });

    // Menyimpan token FCM ke Firestore
    if (token != null) {
      await _saveFcmToken(token);
    }
  }

  // Menyimpan token FCM ke Firestore
  Future<void> _saveFcmToken(String token) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update({
        'fcmToken': token,
      });
    }
  }

  // Fungsi untuk mendapatkan data pengguna dari Firestore
  Future<Map<String, dynamic>?> _getUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(user.uid).get();
      return doc.data() as Map<String, dynamic>?;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: _getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return Center(child: Text('No user data found.'));
          }

          Map<String, dynamic> userData = snapshot.data!;

          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome, ${userData['name']}"),
                SizedBox(height: 20),
                Text("Email: ${userData['email']}"),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/schedule',
                    ); // Arahkan ke halaman jadwal pemeriksaan
                  },
                  child: Text('View Schedule'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/history',
                    ); // Arahkan ke halaman riwayat pemeriksaan
                  },
                  child: Text('View History'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Halaman untuk menampilkan jadwal pemeriksaan
class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jadwal Pemeriksaan")),
      body: Center(child: Text('Halaman Jadwal Pemeriksaan')),
    );
  }
}

// Halaman untuk menampilkan riwayat pemeriksaan
class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Riwayat Pemeriksaan")),
      body: Center(child: Text('Halaman Riwayat Pemeriksaan')),
    );
  }
}
