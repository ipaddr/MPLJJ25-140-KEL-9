import 'package:flutter/material.dart';
import 'package:sehatkita/screen/dashboard_petugas.dart';
import 'package:sehatkita/screen/input_data_petugas_screen.dart';
import 'package:sehatkita/screen/hasil_periksaan_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    OfficerDashboardScreen(),
    InputDataPetugasScreen(),
    HasilPemeriksaanScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.input),
            label: 'Input data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Hasil Data',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}