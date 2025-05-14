import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sehatkita/screens/splash_screen.dart';
import 'package:sehatkita/screens/login_screen.dart';
import 'package:sehatkita/screens/register_screen.dart';
import 'package:sehatkita/screens/home_screen.dart';

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
      initialRoute: '/', // Tentukan route pertama (Splash Screen)
      routes: {
        '/': (context) => SplashScreen(), // Halaman Splash Screen
        '/login': (context) => LoginScreen(), // Halaman Login
        '/register': (context) => RegisterScreen(), // Halaman Register
        '/home': (context) => HomeScreen(), // Halaman Home (Setelah login)
      },
    );
  }
}
