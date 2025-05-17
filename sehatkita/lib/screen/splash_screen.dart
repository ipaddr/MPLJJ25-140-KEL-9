import 'package:flutter/material.dart';
import 'package:sehatkita/color.dart'; // Import color.dart to access AppColors
//import 'package:sehatkita/screens/register_screen.dart';
import 'login_screen.dart'; // Import login screen
import 'package:sehatkita/screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Wait for 3 seconds before navigating to RegisterScreen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });

    return Scaffold(
      backgroundColor:
          AppColors.primaryColor, // Use the primary color from AppColors
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the splash screen image
            Image.asset('assets/images/splash_screen.png'),
            SizedBox(height: 20),
            // Optionally add text or logo for the splash screen
          ],
        ),
      ),
    );
  }
}

class SplashScreenOld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Wait for 3 seconds before navigating to RegisterScreen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.green, // Fixing the background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display logo image for splash screen
            Image.asset('assets/images/logo.png'),
            SizedBox(height: 20),
            // Optionally add text for the splash screen
          ],
        ),
      ),
    );
  }
}
