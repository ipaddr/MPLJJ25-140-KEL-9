import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            Colors.transparent, // Makes the button background transparent
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25), // Rounded corners
        ),
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 40.0,
        ), // Uniform padding
        elevation: 0, // No shadow
      ).copyWith(
        side: MaterialStateProperty.all(
          BorderSide.none,
        ), // Removes the default border
      ),
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.green], // Gradient colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(
            25,
          ), // Rounded corners for the gradient background
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 40.0,
          ), // Uniform padding
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Text color
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Green background container behind all the other widgets
          Positioned.fill(
            child: Container(
              color: Colors.green, // Green background
            ),
          ),
          // Centered form and buttons on top of the green box
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Padding for form and login button
                    Container(
                      padding: EdgeInsets.all(20), // Padding around the form
                      decoration: BoxDecoration(
                        color: Colors.white, // White background for the form
                        borderRadius: BorderRadius.circular(
                          8,
                        ), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26, // Shadow color
                            blurRadius: 10, // Shadow blur effect
                            offset: Offset(0, 4), // Shadow offset
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email atau No Telp',
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 17),
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),
                          CustomButton(
                            // Use the custom button here with same style
                            text: 'Login',
                            onPressed: () {
                              // Logika login akan ditempatkan di sini
                            },
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              // Arahkan ke RegisterScreen (jika perlu)
                            },
                            child: Text(
                              'Don\'t have an account? Please Register',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Welcome text outside the Padding
          Positioned(
            top: 210, // Adjust the top position as needed
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang di',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White text color
                  ),
                ),
                SizedBox(height: 1), // Space between the lines
                Text(
                  'SehatKita',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent, // White text color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
