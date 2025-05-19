import 'package:flutter/material.dart';

class HasilPemeriksaanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Menggunakan warna hijau
        title: Text('Hasil Pemeriksaan Kesehatan'),
      ),
      body: Center(
        child: Column(
          children: [
            // Teks di luar container, posisikan sedikit kebawah
            SizedBox(height: 30), // Jarak lebih ke bawah
            Align(
              alignment: Alignment.center,
              child: Text(
                'Hasil Pemeriksaan Kesehatan',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20), // Jarak antara teks dan container
            // Container besar yang sudah ada
            Container(
              width: 350, // Ukuran lebar container besar
              height: 650, // Mengatur tinggi container besar
              decoration: BoxDecoration(
                color: Colors.white, // Menambahkan warna latar belakang putih
                border: Border.all(
                  color: Colors.black, // Warna border hitam
                  width: 2, // Lebar border
                ),
                borderRadius: BorderRadius.circular(20), // Efek lengkungan
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Container kecil di dalam container besar
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 340, // Ukuran lebar container kecil
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black, // Menambahkan border hitam
                          width: 2, // Lebar border hitam
                        ),
                        borderRadius: BorderRadius.circular(
                          10,
                        ), // Efek lengkungan untuk container kecil
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Hi, Anonim2', // Teks bold
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Periksa Hasil pemeriksaanmu!', // Teks biasa
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20), // Jarak antar elemen dalam container
                    // Status Pemeriksaan
                    Text(
                      'Status Pemeriksaan:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Nama dan Anonim2 di sebelah kanan
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Nama', style: TextStyle(fontSize: 16)),
                        Text('Anonim2', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Tanggal Pemeriksaan dan 12-05-2025 di sebelah kanan
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tanggal Pemeriksaan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('12-05-2025', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Lokasi Rumah Sakit dan RS Andalas di sebelah kanan
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lokasi Rumah Sakit',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('RS Andalas', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Tekanan Darah Icon dan Kalimat
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.favorite, // Icon tekanan darah
                              color: Colors.green, // Warna hijau
                              size: 24, // Ukuran kecil
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Tekanan Darah', // Kalimat Tekanan Darah
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Text(
                          '120/80 mmHg', // Nilai tekanan darah
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Gula Darah Icon dan Kalimat
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.medical_services, // Icon gula darah
                              color: Colors.green, // Warna hijau
                              size: 24, // Ukuran kecil
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Gula Darah', // Kalimat Gula Darah
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '95 mg/dL', // Nilai gula darah
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Rontgen Icon dan Tombol untuk membuka file
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.camera_alt, // Icon rontgen
                              color: Colors.green, // Warna hijau
                              size: 24, // Ukuran kecil
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Rontgen', // Kalimat Rontgen
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Aksi untuk membuka file rontgen
                          },
                          child: Text('Buka File'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green, // Warna tombol hijau
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Status TBC
                    Text(
                      'Status: TBC Tidak Terindikasi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Container baru untuk Quick Tips
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Gambar di sebelah kiri
                          Image.asset(
                            'assets/images/senam.png', // Gambar senam
                            width: 80,
                            height: 80,
                          ),
                          SizedBox(width: 20),
                          // Teks Quick Tips dan keterangan
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Quick Tips', // Teks Quick Tips
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pertahankan pola makan',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'sehat dan seimbang', // Teks bawah Quick Tips
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Tombol Jadwalkan Ulang
                    ElevatedButton(
                      onPressed: () {
                        // Aksi untuk menjadwalkan ulang
                      },
                      child: Column(
                        children: [
                          Text(
                            'Jadwalkan Ulang',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Pemeriksaan',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Warna tombol hijau biru
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
