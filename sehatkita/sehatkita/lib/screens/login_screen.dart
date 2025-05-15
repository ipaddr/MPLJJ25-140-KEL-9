import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sehatkita/services/auth_service.dart'; // Ganti 'your_project' dengan path yang benar

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Fungsi untuk handle login
  void login(BuildContext context) async {
    final authService = AuthService();
    final result = await authService.login(
      emailController.text,
      passwordController.text,
    );

    if (result['message'] == 'Login successful') {
      // Menyimpan token JWT di shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', result['token']);

      // Navigasi ke Dashboard
      Navigator.pushNamed(context, '/dashboard');
    } else {
      print(result['message']);
      // Anda bisa menambahkan dialog atau snackbar di sini untuk menampilkan pesan error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Input email
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email atau No Telp',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 15),
            // Input password
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 30),
            // Tombol login
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade800,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              onPressed: () => login(context), // Panggil fungsi login
              child: Text('Login'),
            ),
            SizedBox(height: 15),
            // Login with Google
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.login, color: Colors.green.shade800),
                SizedBox(width: 10),
                Text('Login with Google', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 20),
            // Tombol untuk registrasi jika belum punya akun
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Don\'t have an account? Please Register'),
            ),
          ],
        ),
      ),
    );
  }
}
