import 'package:flutter/material.dart';
import 'package:sehatkita/color.dart'; // Assuming color.dart is in this path

class HasilInputPetugasScreen extends StatefulWidget {
  final Widget? previousScreenContent;
  final String btaResult;
  final String mantouxResult;
  final String catatanMedis;

  const HasilInputPetugasScreen({
    Key? key,
    this.previousScreenContent,
    required this.btaResult,
    required this.mantouxResult,
    required this.catatanMedis,
  }) : super(key: key);

  @override
  _HasilInputPetugasScreenState createState() =>
      _HasilInputPetugasScreenState();
}

class _HasilInputPetugasScreenState extends State<HasilInputPetugasScreen> {
  // Variabel untuk mengontrol apakah tombol "Kembali" muncul
  bool _isProsesClicked = false;

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
          // Background blur layer
          if (widget.previousScreenContent != null)
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.grey.withOpacity(0.5),
                BlendMode.saturation,
              ),
              child: widget.previousScreenContent!,
            ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.all(20.0),
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

                    // ✅ Tampilan data hasil input
                    Text("🔬 Hasil BTA: ${widget.btaResult}"),
                    Text("💉 Tes Mantoux: ${widget.mantouxResult}"),
                    Text("📝 Catatan Medis: ${widget.catatanMedis}"),

                    const SizedBox(height: 30.0),

                    // Tombol Proses
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isProsesClicked = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 15.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: const Text(
                        "Proses",
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ),

                    // Row untuk tombol Kembali dan Proses secara horizontal
                    if (_isProsesClicked) ...[
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Tombol Kembali
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey, // Warna abu-abu
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40.0,
                                vertical: 15.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            child: const Text(
                              "Kembali",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          // Tombol Cek/Proses
                          ElevatedButton(
                            onPressed: () {
                              // Aksi Proses / Cek
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.green,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40.0,
                                vertical: 15.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            child: const Text(
                              "Cek",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
