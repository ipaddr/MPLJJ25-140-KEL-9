import 'package:flutter/material.dart';
import 'package:sehatkita/color.dart'; // Assuming color.dart is in this path

class HasilInputPetugasScreen extends StatelessWidget {
  // You might want to pass the previous screen's content here if needed
  final Widget? previousScreenContent;

  const HasilInputPetugasScreen({Key? key, this.previousScreenContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Input Pemeriksaan"),
      ),
      body: Stack(
        children: [
          // Display previous screen content greyed out
          if (previousScreenContent != null)
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.grey.withOpacity(0.5),
                BlendMode.saturation,
              ),
              child: previousScreenContent!,
            ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "DATA INPUT PEMERIKSAAN TERSIMPAN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Icon(
                    Icons.check_circle,
                    color: AppColors.green,
                    size: 80.0,
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate back or to another screen
                      Navigator.pop(context); // Example: pop back
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: const Text(
                      "Kembali",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar removed
    );
  }
}