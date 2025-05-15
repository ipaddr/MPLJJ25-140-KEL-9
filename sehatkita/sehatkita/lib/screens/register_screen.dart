import 'package:flutter/material.dart';
import 'package:sehatkita/services/auth_service.dart'; // Pastikan path sudah benar
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Fungsi untuk handle proses register
  void register(BuildContext context) async {
    print('Registering with: ${nameController.text}, ${emailController.text}');

    final authService = AuthService();
    final result = await authService.register(
      nameController.text,
      emailController.text,
      passwordController.text,
    );

    print('Register result: $result');

    // Jika registrasi sukses, lanjutkan ke halaman login
    if (result['message'] == 'User registered successfully') {
      Navigator.pushNamed(
        context,
        '/login',
      ); // Navigasi ke login setelah registrasi berhasil
    } else {
      // Jika gagal, tampilkan pesan error
      print('Registration failed: ${result['message']}');
      // Menampilkan error di snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${result['message']}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up to Sehat Kita',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Nama Lengkap
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 15),
            // Email
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 15),
            // Password
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
            // Tombol Daftar
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors
                        .green
                        .shade800, // Ganti 'primary' dengan 'backgroundColor'
                foregroundColor:
                    Colors.white, // Ganti 'onPrimary' dengan 'foregroundColor'
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              onPressed: () => register(context), // Panggil fungsi register
              child: Text('DAFTAR'),
            ),
          ],
        ),
      ),
    );
  }
}
