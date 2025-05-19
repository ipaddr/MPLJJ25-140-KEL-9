import 'package:flutter/material.dart';
import 'package:sehatkita/color.dart'; // Import the colors or theme
import 'package:table_calendar/table_calendar.dart'; // Import the table_calendar package
import 'package:sehatkita/screen/form_screen.dart'; // Import FormScreen
import 'package:sehatkita/screen/home_screen.dart'; // Import HomeScreen
import 'package:sehatkita/screen/riwayat_screen.dart'; // Import RiwayatScreen

class JadwalScreen extends StatefulWidget {
  @override
  _JadwalScreenState createState() => _JadwalScreenState();
}

class _JadwalScreenState extends State<JadwalScreen> {
  int _selectedIndex = 1; // To store the selected tab index
  late ValueNotifier<DateTime> _selectedDay;
  late ValueNotifier<DateTime> _focusedDay;
  bool _isLocationClicked =
      false; // To track if the location container has been clicked

  @override
  void initState() {
    super.initState();
    _selectedDay = ValueNotifier(DateTime.now());
    _focusedDay = ValueNotifier(
      DateTime.now(),
    ); // Initially focused day is the current day
  }

  // Navigate to the form page when button is pressed
  void _navigateToForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormScreen(),
      ), // Navigate to FormScreen
    );
  }

  // Toggle the location container background color
  void _toggleLocationColor() {
    setState(() {
      _isLocationClicked = !_isLocationClicked; // Toggle the state
    });
  }

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
        // Stay on the current JadwalScreen (no need to navigate)
        break;
      case 2:
        // Navigate to RiwayatScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RiwayatScreen()),
        );
        break;
      case 3:
        // Navigate to ProfilScreen (you can implement this screen)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Center(child: Text("Profil")),
          ),
        );
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
        title: Text('Jadwal Pemeriksaan'),
      ),
      body: SingleChildScrollView(
        // Make the body scrollable
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
          children: [
            Text(
              'Jadwal Pemeriksaan',
              style: TextStyle(
                fontSize: 30, // Set the font size
                color: Colors.black, // Set the text color to black
                fontWeight: FontWeight.bold, // Make the text bold
              ),
            ),
            SizedBox(height: 20), // Add some space after the text
            // Container for the calendar with custom height and width
            Container(
              height: 350, // Set the height of the calendar (adjustable)
              width: double.infinity, // Set the width to match the screen width
              decoration: BoxDecoration(
                color: Colors.white, // Set the background color to white
                border: Border.all(
                  color: Colors.black,
                ), // Set the border color to black
                borderRadius: BorderRadius.circular(
                  15,
                ), // Slightly rounded corners
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 01, 01),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay.value,
                selectedDayPredicate: (day) {
                  // Use this function to mark a specific day as selected
                  return isSameDay(_selectedDay.value, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay.value = selectedDay;
                    _focusedDay.value = focusedDay;
                  });
                },
                onPageChanged: (focusedDay) {
                  // When the calendar page changes, update the focused day
                  _focusedDay.value = focusedDay;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ), // Add some space between calendar and the label
            // Make the "RS.A - Jln.A" container a clickable button
            GestureDetector(
              onTap: _toggleLocationColor, // Toggle the location color on tap
              child: Container(
                width:
                    double
                        .infinity, // Make the container width match the screen width
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color:
                      _isLocationClicked
                          ? Colors.green
                          : Colors.white, // Change color based on state
                  border: Border.all(
                    color: Colors.black,
                  ), // Set the border color to black
                  borderRadius: BorderRadius.circular(
                    15,
                  ), // Slightly rounded corners
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align to the left
                  children: [
                    // Text for RS.A - Jln.A in bold
                    Text(
                      'RS.A - Jln.A',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold, // Bold text
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8), // Add some space between the texts
                    // Row widget to display Dr.A - 8AM on the left and 1.2 km on the right
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween, // Align items on opposite ends
                      children: [
                        // Left side: Dr.A - 8AM (not bold)
                        Text(
                          'Dr.A - 8AM',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal, // Regular text
                            color: Colors.black,
                          ),
                        ),
                        // Right side: 1.2 km (regular text)
                        Text(
                          '1.2 km',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal, // Regular text
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20), // Add some space after container
            // Button to navigate to the form page
            GestureDetector(
              onTap: _navigateToForm, // Navigate to FormScreen on tap
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                ), // Adjust button height
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green, Colors.blue], // Gradient color
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                ),
                child: Text(
                  'Daftar Pemeriksaan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold, // Bold text
                    color: Colors.white, // White text color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Function to handle tab tapping
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
