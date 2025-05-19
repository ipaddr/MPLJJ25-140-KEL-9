import 'package:flutter/material.dart';
import 'package:sehatkita/color.dart';
import 'package:sehatkita/screen/hasil_input_petugas_screen.dart'; // Tambahkan baris ini

class InputDataPetugasScreen extends StatefulWidget {
  @override
  _InputDataPetugasScreenState createState() => _InputDataPetugasScreenState();
}

class _InputDataPetugasScreenState extends State<InputDataPetugasScreen> {
  // Controller untuk input field (opsional, bisa digunakan untuk mengambil nilai input)
  final TextEditingController tekananDarahController = TextEditingController();
  final TextEditingController gulaDarahController = TextEditingController();
  final TextEditingController catatanMedisController = TextEditingController();

  @override
  void dispose() {
    tekananDarahController.dispose();
    gulaDarahController.dispose();
    catatanMedisController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Pemeriksaan'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tekanan Darah',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: tekananDarahController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan tekanan darah',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Gula Darah',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: gulaDarahController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan gula darah',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Catatan Medis',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: catatanMedisController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Masukkan catatan medis',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Hasil Rontgen (Opsional)',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.upload_file, size: 40.0, color: Colors.grey),
                        SizedBox(height: 8.0),
                        Text(
                          'Upload gambar',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement save functionality
                      // Contoh: ambil data dari controller
                      String tekananDarah = tekananDarahController.text;
                      String gulaDarah = gulaDarahController.text;
                      String catatanMedis = catatanMedisController.text;
                      // Lakukan proses simpan data di sini

                      // Navigasi ke halaman hasil input setelah simpan
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HasilInputPetugasScreen(),
                        ),
                      );
                    },
                    child: Text('Simpan'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar dihapus sesuai permintaan
    );
  }
}