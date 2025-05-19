import 'package:flutter/material.dart';
import 'package:sehatkita/screen/hasil_pemeriksaan_screen.dart'; // Import the HasilPemeriksaanScreen
import 'package:sehatkita/color.dart'; // Import the color theme

class RiwayatScreen extends StatefulWidget {
  @override
  _RiwayatScreenState createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  int _selectedIndex = 2; // Start with Riwayat tab selected (index 2)

  // Function to handle navigation based on BottomNavigationBar selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });

    // Navigate to the respective screen based on the selected tab
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/jadwal');
        break;
      case 2:
        // Stay on the current RiwayatScreen
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profil');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green),
      body: SingleChildScrollView(
        // Scroll view for vertical scrolling
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // "Riwayat Pemeriksaan" title at the top
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                ), // Space between title and containers
                child: Text(
                  'Riwayat Pemeriksaan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            // First Container
            Container(
              width: double.infinity, // Full width
              padding: EdgeInsets.all(15),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  12,
                ), // Slightly rounded corners
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '21 Apr 2024',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24, // Slightly smaller font size
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '10:00',
                        style: TextStyle(
                          fontSize: 16, // Smaller font
                          fontWeight: FontWeight.bold, // Bold
                          color: Colors.grey, // Grey color
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Status: Selesai',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Gejala: Demam, Batuk',
                        style: TextStyle(fontSize: 18), // Smaller font
                      ),
                      SizedBox(height: 10),
                      Text(
                        'RS kunjungan: Puskesmas Nganggalo',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          // Button 1 - Selesai
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.lightGreen, // Light green color
                            ),
                            onPressed: () {},
                            child: Text(
                              'Selesai',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(width: 10),
                          // Button 2 - Cek
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green, // Dark green color
                            ),
                            onPressed: () {
                              // Navigate to the HasilPemeriksaanScreen when 'Cek' button is pressed
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => HasilPemeriksaanScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Cek',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      'assets/images/jad.png', // Path to image
                      width: 100, // Larger width for the image
                      height: 100, // Larger height for the image
                    ),
                  ),
                ],
              ),
            ),

            // Second Container
            Container(
              width: double.infinity, // Full width
              padding: EdgeInsets.all(15),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '21 Apr 2024',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '10:00',
                        style: TextStyle(
                          fontSize: 16, // Smaller font
                          fontWeight: FontWeight.bold, // Bold
                          color: Colors.grey, // Grey color
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Status: Proses',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Gejala: Demam, Batuk',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'RS kunjungan: Puskesmas Nganggalo',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      // Proses Button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.orange, // Orange color for process
                        ),
                        onPressed: () {},
                        child: Text(
                          'Proses',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      'assets/images/jad.png', // Path to image
                      width: 100, // Larger width for the image
                      height: 100, // Larger height for the image
                    ),
                  ),
                ],
              ),
            ),

            // Third Container
            Container(
              width: double.infinity, // Full width
              padding: EdgeInsets.all(15),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '21 Apr 2024',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '10:00',
                        style: TextStyle(
                          fontSize: 16, // Smaller font
                          fontWeight: FontWeight.bold, // Bold
                          color: Colors.grey, // Grey color
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Status: Proses',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Gejala: Demam, Batuk',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'RS kunjungan: Puskesmas Nganggalo',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      // Proses Button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.orange, // Orange color for process
                        ),
                        onPressed: () {},
                        child: Text(
                          'Proses',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      'assets/images/jad.png', // Path to image
                      width: 100, // Larger width for the image
                      height: 100, // Larger height for the image
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Highlight the current tab
        onTap: _onItemTapped, // Handle tap events
        iconSize: 30.0,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
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
