import 'package:flutter/material.dart';
import 'package:sehatkita/color.dart'; // Import warna dari color.dart
import 'login_screen.dart'; // Import login screen

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _genderController = TextEditingController();
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
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.green,
                  ], // Gradient from white to green
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Centered form and buttons on top of the background
          Positioned(
            top: 200, // Adjust the position from the top for better centering
            left: 16,
            right:
                16, // Optional, to make it responsive (add some margin from both sides)
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centering form vertically
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Centering form horizontally
                  children: [
                    // Add the "Register" label outside the container to the left
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Register', // The "Register" text
                        style: TextStyle(
                          fontSize: 24, // Adjust the font size as needed
                          fontWeight: FontWeight.bold, // Bold text
                          color: Colors.green, // Green color
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ), // Add space between the label and form
                    // Padding for form and register button
                    Container(
                      padding: EdgeInsets.all(20), // Padding around the form
                      decoration: BoxDecoration(
                        color: Colors.white, // White background for the form
                        borderRadius: BorderRadius.circular(
                          8,
                        ), // Rounded corners
                        border: Border.all(
                          color: Colors.green, // Stroke color (border)
                          width: 2, // Stroke width
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26, // Shadow color
                            blurRadius: 15, // Shadow blur effect
                            offset: Offset(0, 6), // Shadow offset
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(
                              0.8,
                            ), // Light reflection for glossy effect
                            blurRadius: 15, // Light blur effect
                            offset: Offset(0, -6), // Reflection on top side
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Add the new text above the name field
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Silahkan isi data diri ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green, // Green text color
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ), // Add space between the two text lines
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'anda',
                              style: TextStyle(
                                fontSize:
                                    20, // Larger font size for "melanjutkan"
                                fontWeight: FontWeight.bold,
                                color: Colors.green, // Green text color
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 17,
                          ), // Add space between this text and name field
                          // Field for full name
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                          SizedBox(height: 17),
                          // Field for gender
                          TextField(
                            controller: _genderController,
                            decoration: InputDecoration(
                              labelText: 'Gender',
                              prefixIcon: Icon(Icons.accessibility),
                            ),
                          ),
                          SizedBox(height: 17),
                          // Field for email
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          SizedBox(height: 17),
                          // Field for password
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                            ),
                          ),
                          SizedBox(height: 20),
                          // Register button
                          ElevatedButton(
                            onPressed: () {
                              // After successful registration, navigate to LoginScreen
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            child: Text('Register'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.green, // Green button color
                              minimumSize: Size(double.infinity, 50),
                            ),
                          ),
                          SizedBox(height: 10),
                          // TextButton to navigate back to login screen
                          TextButton(
                            onPressed: () {
                              // Navigate to LoginScreen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            child: Text('Already have an account? Login'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
