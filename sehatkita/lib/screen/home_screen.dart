import 'package:flutter/material.dart';
import 'package:sehatkita/color.dart'; // Menggunakan warna yang sudah didefinisikan
import 'form_screen.dart'; // Arahkan ke form screen
import 'tanya_sehatbot_screen.dart'; // Arahkan ke Tanya SehatBot screen
import 'package:sehatkita/screen/jadwal_screen.dart'; // Arahkan ke JadwalScreen
import 'package:sehatkita/screen/home_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    Center(child: Text("Beranda")), // Placeholder for Beranda
    JadwalScreen(), // Jadwal Pemeriksaan
    Center(child: Text("Riwayat")), // Placeholder for Riwayat
    Center(child: Text("Profil")), // Placeholder for Profil
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('SehatKita'),
      ),
      body:
          _screens[_selectedIndex], // Menampilkan halaman sesuai dengan index terpilih
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
