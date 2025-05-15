import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String? token;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  // Fungsi untuk memeriksa status login
  _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');

    if (token == null) {
      // Jika tidak ada token, arahkan ke login screen
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat datang!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Jadwal Pemeriksaan
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.green.shade800),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jadwal Pemeriksaan Terdekat',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '21 Apr - 10:00',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Tombol Aksi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionButton(
                  icon: Icons.check_circle,
                  label: 'Daftar Pemeriksaan',
                  onPressed: () {},
                ),
                ActionButton(
                  icon: Icons.chat,
                  label: 'Tanya SehatBoT',
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20),
            // Video Edukasi
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.play_circle_outline, color: Colors.green.shade800),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Video Edukasi', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      Text(
                        'Tonton video edukasi tentang TBC',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Notifikasi untuk gejala
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning, color: Colors.red.shade800),
                  SizedBox(width: 10),
                  Text(
                    'Kamu belum melapor gejala minggu ini',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          // Navigasi berdasarkan index
          // Tambahkan rute sesuai dengan halaman yang ingin dituju
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Jadwal'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Edukasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  ActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.green.shade800, // Menggunakan backgroundColor yang tepat
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                50,
              ), // Membuat tombol melingkar
            ),
            padding: EdgeInsets.all(16), // Menambah padding di dalam tombol
          ),
          onPressed: onPressed, // Aksi ketika tombol ditekan
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ), // Ikon di dalam tombol
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
