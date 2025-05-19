import 'package:flutter/material.dart';
import 'package:sehatkita/color.dart'; // Menggunakan warna dari AppColors

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  String selectedDate = "21 Apr 2024"; // Default selected date

  bool _isCheckedDemam = false;
  bool _isCheckedBatuk = false;
  bool _isCheckedNyeriOtot = false;
  bool _isCheckedSesakNapas = false;
  bool _isCheckedKelelahan = false;

  // Fungsi untuk menampilkan dialog pop-up
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 50),
              SizedBox(height: 20),
              Text(
                'DATA FORM PEMERIKSAAN TELAH TERKIRIM',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Menutup dialog
                },
                child: Text('Kembali'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background putih
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        // Menambahkan SingleChildScrollView untuk scroll
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menambahkan kalimat "FORM PEMERIKSAAN GRATIS" di dalam body
            Center(
              child: Text(
                'FORM PEMERIKSAAN GRATIS',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20), // Jarak antara judul dan input form
            // Label Nama dengan tulisan bold
            Text(
              'NAMA',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            // TextField untuk input Nama
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Masukkan nama lengkap',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.black), // Stroke hitam
                ),
              ),
            ),
            SizedBox(height: 20), // Jarak antara Nama dan Tanggal
            // Label Tanggal dengan tulisan bold
            Text(
              'TANGGAL',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            // Container untuk memilih tanggal (ringkas seperti di JadwalScreen)
            GestureDetector(
              onTap: () {
                // Tanggal akan diubah saat tapped
                setState(() {
                  selectedDate = "22 Apr 2024"; // Contoh tanggal yang dipilih
                });
              },
              child: Container(
                width:
                    double
                        .infinity, // Same width as the TextField for consistency
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  selectedDate, // Tanggal yang dipilih ditampilkan di sini
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 30), // Jarak antara Tanggal dan Gejala
            // Membungkus Gejala dan checkbox dengan Row untuk gambar di samping
            Row(
              children: [
                // Container untuk checkbox Gejala
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'GEJALA',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        // Checkbox Gejala
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: _isCheckedDemam,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isCheckedDemam = value!;
                                    });
                                  },
                                ),
                                Text("Demam"),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: _isCheckedBatuk,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isCheckedBatuk = value!;
                                    });
                                  },
                                ),
                                Text("Batuk"),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: _isCheckedNyeriOtot,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isCheckedNyeriOtot = value!;
                                    });
                                  },
                                ),
                                Text("Nyeri Otot"),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: _isCheckedSesakNapas,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isCheckedSesakNapas = value!;
                                    });
                                  },
                                ),
                                Text("Sesak Napas"),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: _isCheckedKelelahan,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isCheckedKelelahan = value!;
                                    });
                                  },
                                ),
                                Text("Kelelahan"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Gambar di sebelah kanan Gejala
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset(
                    'assets/images/doctor1.png', // Gambar ditambahkan di sini
                    width: 200, // Ukuran gambar bisa disesuaikan
                    height: 300,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30), // Jarak antara Gejala dan Detail Tambahan
            // Label Detail Tambahan dengan tulisan bold
            Text(
              'DETAIL TAMBAHAN',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            // TextField untuk Detail Tambahan
            TextField(
              decoration: InputDecoration(
                hintText: 'Tuliskan detail tambahan di sini',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.black), // Stroke hitam
                ),
              ),
            ),
            SizedBox(height: 30), // Jarak antara Detail dan Tombol Kirim
            // Tombol Kirim yang diletakkan tidak terlalu bawah
            ElevatedButton(
              onPressed: () {
                // Memanggil dialog setelah tombol Kirim ditekan
                _showConfirmationDialog();
              },
              child: Text('Kirim'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
