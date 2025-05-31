import 'package:flutter/material.dart';
import 'package:sehatkita/color.dart'; // Menggunakan warna dari AppColors
import 'package:cloud_firestore/cloud_firestore.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _nameController = TextEditingController();
  final _detailController = TextEditingController();
  String selectedDate = "21 Apr 2024"; // Default selected date

  bool _isCheckedDemam = false;
  bool _isCheckedBatuk = false;
  bool _isCheckedNyeriOtot = false;
  bool _isCheckedSesakNapas = false;
  bool _isCheckedKelelahan = false;

  List<Map<String, dynamic>> _patientHistory =
      []; // List to store patient history

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

  // Fungsi untuk gabungkan gejala yg dicek
  String _getSelectedSymptoms() {
    List<String> symptoms = [];
    if (_isCheckedDemam) symptoms.add('Demam');
    if (_isCheckedBatuk) symptoms.add('Batuk');
    if (_isCheckedNyeriOtot) symptoms.add('Nyeri Otot');
    if (_isCheckedSesakNapas) symptoms.add('Sesak Napas');
    if (_isCheckedKelelahan) symptoms.add('Kelelahan');
    return symptoms.join(', ');
  }

  // Fungsi simpan data ke Firestore
  void _submitForm() async {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Nama tidak boleh kosong')));
      return;
    }
    try {
      await FirebaseFirestore.instance.collection('pemeriksaan').add({
        'nama': _nameController.text.trim(),
        'tanggal': selectedDate,
        'gejala': _getSelectedSymptoms(),
        'detailTambahan': _detailController.text.trim(),
        'status': 'Proses', // Status set to "Proses" initially
        'createdAt': FieldValue.serverTimestamp(),
      });

      _showConfirmationDialog();

      // Optionally, reset form setelah submit:
      _nameController.clear();
      _detailController.clear();
      setState(() {
        _isCheckedDemam = false;
        _isCheckedBatuk = false;
        _isCheckedNyeriOtot = false;
        _isCheckedSesakNapas = false;
        _isCheckedKelelahan = false;
        selectedDate = "21 Apr 2024";
      });

      // Simulate the addition of the patient data to the history
      setState(() {
        _patientHistory.add({
          'nama': _nameController.text.trim(),
          'status': 'Proses',
          'tanggal': selectedDate,
        });
      });
    } catch (e) {
      print('Gagal simpan data pemeriksaan: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Gagal mengirim data, coba lagi')));
    }
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            SizedBox(height: 20),

            Text(
              'NAMA',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Masukkan nama lengkap',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 20),

            Text(
              'TANGGAL',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedDate =
                      "22 Apr 2024"; // Contoh tanggal, kamu bisa buat DatePicker
                });
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  selectedDate,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 30),

            Row(
              children: [
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: _isCheckedDemam,
                                  onChanged:
                                      (val) => setState(
                                        () => _isCheckedDemam = val!,
                                      ),
                                ),
                                Text("Demam"),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: _isCheckedBatuk,
                                  onChanged:
                                      (val) => setState(
                                        () => _isCheckedBatuk = val!,
                                      ),
                                ),
                                Text("Batuk"),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: _isCheckedNyeriOtot,
                                  onChanged:
                                      (val) => setState(
                                        () => _isCheckedNyeriOtot = val!,
                                      ),
                                ),
                                Text("Nyeri Otot"),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: _isCheckedSesakNapas,
                                  onChanged:
                                      (val) => setState(
                                        () => _isCheckedSesakNapas = val!,
                                      ),
                                ),
                                Text("Sesak Napas"),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: _isCheckedKelelahan,
                                  onChanged:
                                      (val) => setState(
                                        () => _isCheckedKelelahan = val!,
                                      ),
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
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset(
                    'assets/images/doctor1.png',
                    width: 200,
                    height: 300,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            Text(
              'DETAIL TAMBAHAN',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _detailController,
              decoration: InputDecoration(
                hintText: 'Tuliskan detail tambahan di sini',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 30),

            ElevatedButton(
              onPressed: _submitForm,
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
