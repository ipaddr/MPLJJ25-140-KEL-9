import 'package:flutter/material.dart';
import 'package:sehatkita/color.dart'; // Import the color theme
import 'package:sehatkita/screen/home_screen.dart'; // Import HomeScreen
import 'package:sehatkita/screen/jadwal_screen.dart'; // Import JadwalScreen
import 'package:sehatkita/screen/riwayat_screen.dart'; // Import RiwayatScreen
import 'package:sehatkita/screen/login_screen.dart'; // Import LoginScreen

class ProfilScreen extends StatefulWidget {
  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  int _selectedIndex = 3; // Start with Profil tab selected (index 3)

  // Function to handle navigation based on BottomNavigationBar selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });

    // Navigate to the respective screen based on the selected tab
    switch (index) {
      case 0:
        // Navigate to HomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        // Navigate to JadwalScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => JadwalScreen()),
        );
        break;
      case 2:
        // Navigate to RiwayatScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RiwayatScreen()),
        );
        break;
      case 3:
        // Stay on the current ProfilScreen (no need to navigate)
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Profile avatar with a glow effect
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.6),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    'assets/images/profile_avatar.png',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // User name with enhanced styling
            Center(
              child: Text(
                'Yudi Mubarak',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: Text(
                'yudimubarak2904@gmail.com',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            SizedBox(height: 30),
            // List of options with elevated containers and icons
            _buildOption('Informasi Pribadi', Icons.person),
            _buildOption('Riwayat', Icons.history),
            _buildOption('Bahasa', Icons.language),
            SizedBox(height: 30),
            // Logout button with gradient effect
            ElevatedButton(
              onPressed: () {
                // Navigate to the LoginScreen when logged out
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ), // Navigate to LoginScreen
                );
              },
              child: Text('Logout'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                minimumSize: MaterialStateProperty.all(
                  Size(double.infinity, 50),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Handle tab events
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

  // Helper method to create ListTile-like options with icons and custom styles
  Widget _buildOption(String title, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: Colors.green),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.green),
        onTap: () {
          // Handle tap action for each option
        },
      ),
    );
  }
}
