import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sehatkita/color.dart'; // Assuming color.dart contains the green color
import 'package:sehatkita/screen/hasil_input_petugas_screen.dart';
import 'package:sehatkita/screen/hasil_pemeriksaan_screen.dart';
import 'package:sehatkita/screen/dashboard_petugas.dart'; // Import OfficerDashboardScreen

class InputDataPetugasScreen extends StatefulWidget {
  final String? namaPasien;
  final String? tanggalPeriksa;
  final String? gejalaPasien;
  final String? detailTambahan;

  InputDataPetugasScreen({
    this.namaPasien,
    this.tanggalPeriksa,
    this.gejalaPasien,
    this.detailTambahan,
    Key? key,
  }) : super(key: key);

  @override
  _InputDataPetugasScreenState createState() => _InputDataPetugasScreenState();
}

class _InputDataPetugasScreenState extends State<InputDataPetugasScreen> {
  bool isBtaPositive = true; // Default value untuk BTA
  String mantouxLevel = 'Ringan'; // Default value untuk Mantoux
  String diagnosisAkhir = 'TBC Paru Aktif';

  bool isCompleted = false; // Variabel untuk menyimpan status tombol

  // Fungsi untuk menyimpan data ke Firestore
  void simpanData() async {
    String hasilBTA = isBtaPositive ? 'Positif' : 'Negatif';
    String hasilMantoux = mantouxLevel;

    // Menyimpan data ke Firestore
    CollectionReference hasilPemeriksaan = FirebaseFirestore.instance
        .collection('HasilPemeriksaan');

    await hasilPemeriksaan.add({
      'namaPasien': widget.namaPasien ?? '',
      'tanggalPeriksa': widget.tanggalPeriksa ?? '',
      'gejalaPasien': widget.gejalaPasien ?? '',
      'detailTambahan': widget.detailTambahan ?? '',
      'hasilBTA': hasilBTA,
      'hasilMantoux': hasilMantoux,
      'diagnosisAkhir': diagnosisAkhir,
      'status': 'Selesai', // Statusnya sudah selesai setelah disimpan
      'createdAt': FieldValue.serverTimestamp(),
    });

    // Mengubah status tombol
    setState(() {
      isCompleted = true; // Tombol diubah menjadi 'Cek' setelah disimpan
    });

    // Memberikan pesan jika data berhasil disimpan
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Data berhasil disimpan!')));
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
          child: Center(
            // agar konten rata tengah secara horizontal
            child: Container(
              width: 400, // agar tidak terlalu melebar di layar besar
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.center, // konten rata tengah horizontal
                children: [
                  // Data pasien
                  Text(
                    'Nama Pasien: ${widget.namaPasien ?? "-"}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Tanggal Periksa: ${widget.tanggalPeriksa ?? "-"}',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Gejala: ${widget.gejalaPasien ?? "-"}',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Detail Tambahan: ${widget.detailTambahan ?? "-"}',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),

                  Text(
                    '🔬 Hasil Tes Dahak (BTA):',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: ChoiceChip(
                          label: Text('🟢 Positif (+)'),
                          selected: isBtaPositive,
                          onSelected: (selected) {
                            setState(() {
                              isBtaPositive = true;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ChoiceChip(
                          label: Text('⚪️ Negatif (–)'),
                          selected: !isBtaPositive,
                          onSelected: (selected) {
                            setState(() {
                              isBtaPositive = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '💉 Tes Mantoux (Tuberkulin):',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Wrap(
                    spacing: 8.0,
                    children:
                        ['Ringan', 'Sedang', 'Berat'].map((level) {
                          return ChoiceChip(
                            label: Text('🟡 Reaktif $level'),
                            selected: mantouxLevel == level,
                            onSelected: (_) {
                              setState(() {
                                mantouxLevel = level;
                              });
                            },
                          );
                        }).toList(),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Hasil Rontgen (Opsional)',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
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
                          Icon(
                            Icons.upload_file,
                            size: 40.0,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Upload gambar',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),

                  // Diagnosis Akhir Dokter
                  Text(
                    'Diagnosis Akhir Dokter',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),

                  // Toggle pilihan vertical
                  Column(
                    children: [
                      RadioListTile<String>(
                        title: Text('TBC Paru Aktif'),
                        value: 'TBC Paru Aktif',
                        groupValue: diagnosisAkhir,
                        onChanged: (value) {
                          setState(() {
                            diagnosisAkhir = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: Text('Tidak Terindikasi TBC'),
                        value: 'Tidak Terindikasi TBC',
                        groupValue: diagnosisAkhir,
                        onChanged: (value) {
                          setState(() {
                            diagnosisAkhir = value!;
                          });
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 24.0),

                  // Tombol kembali dan proses
                  if (isCompleted)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Tombol Kembali
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        OfficerDashboardScreen(), // Arahkan ke OfficerDashboardScreen
                              ),
                            );
                          },
                          child: Text('Kembali'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey, // Warna abu-abu
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            textStyle: TextStyle(fontSize: 16),
                          ),
                        ),

                        // Tombol Cek
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HasilPemeriksaanScreen(),
                              ),
                            );
                          },
                          child: Text('Cek'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green, // Warna hijau
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            textStyle: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    )
                  else
                    // Tombol Proses
                    ElevatedButton(
                      onPressed: simpanData, // Jika belum selesai, simpan data
                      child: Text('Proses'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // Warna oranye
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
