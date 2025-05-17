import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Untuk menyimpan index tab yang dipilih

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update index tab yang dipilih
    });
  }

  final List<Widget> _screens = [
    // Gambar hati di kiri dan teks di kanan dalam satu baris
    SingleChildScrollView( // Menambahkan SingleChildScrollView untuk fitur scroll
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar hati dan teks SehatKita serta Hari ini, 22 April 2025 secara horizontal
            Row(
              children: [
                // Gambar hati di sebelah kiri
                Image.asset(
                  'assets/images/hati.png',  // Gambar hati
                  width: 57,  // Menambahkan ukuran gambar menjadi lebih besar
                  height: 57, // Menambahkan ukuran gambar menjadi lebih besar
                ),
                SizedBox(width: 16),  // Jarak antara gambar dan teks
                // Teks SehatKita dan Hari ini, 22 April 2025 di sebelah kanan gambar
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SehatKita',
                      style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold),  // Ukuran font menjadi 31
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Hari ini, 22 April 2025',
                      style: TextStyle(fontSize: 25), // Ukuran font menjadi 25
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),  // Memberikan jarak setelah gambar dan teks
            // Teks Selamat datang, Yudi! di bawah gambar hati secara vertikal
            SizedBox(height: 24),  // Menambahkan jarak lebih banyak untuk memindahkan teks ke bawah
            Text(
              'Selamat datang, Yudi!',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold), // Ukuran font menjadi 27
            ),
            SizedBox(height: 16),  // Memberikan jarak antara kalimat dan container

            // Container Jadwal Pemeriksaan
            Container(
              width: double.infinity,  // Mengatur lebar container agar memenuhi layar
              padding: EdgeInsets.all(16.0),  // Padding di dalam container
              decoration: BoxDecoration(
                color: Colors.green.shade100,  // Warna background container
                borderRadius: BorderRadius.circular(16.0),  // Menambahkan sudut melengkung
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Memisahkan gambar dan teks
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jadwal Pemeriksaan Terdekat',
                        style: TextStyle(fontSize: 20), // Font biasa (tanpa bold)
                      ),
                      SizedBox(height: 8),  // Jarak antara dua teks
                      Text(
                        '21 Apr - 08.00',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Font bold untuk waktu
                      ),
                    ],
                  ),
                  // Menambahkan gambar di sebelah kanan teks
                  Image.asset(
                    'assets/images/jadwal.png',  // Path ke gambar jadwal
                    width: 55,  // Ukuran gambar jadwal
                    height: 55, // Ukuran gambar jadwal
                  ),
                ],
              ),
            ),

            // Dua Container baru yang terpisah secara horizontal di bawah Jadwal Pemeriksaan
            SizedBox(height: 24),  // Memberikan jarak antara container jadwal dan dua container baru
            Builder(
              builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container pertama
                    Container(
                      width: (MediaQuery.of(context).size.width / 2) - 24,  // Lebar container 50% layar
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,  // Warna container putih
                        borderRadius: BorderRadius.circular(16.0),  // Sudut melengkung
                        border: Border.all(
                          color: Colors.black, // Warna border hitam
                          width: 2, // Ketebalan border
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/cek.png',  // Gambar cek
                            width: 56,
                            height: 56,
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Daftar',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Font bold
                              ),
                              Text(
                                'Pemeriksaan',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Font bold
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Container kedua
                    Container(
                      width: (MediaQuery.of(context).size.width / 2) - 24,  // Lebar container 50% layar
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,  // Warna container putih
                        borderRadius: BorderRadius.circular(16.0),  // Sudut melengkung
                        border: Border.all(
                          color: Colors.black, // Warna border hitam
                          width: 2, // Ketebalan border
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/bot.png',  // Gambar bot
                            width: 55,
                            height: 55,
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tanya',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Font bold
                              ),
                              Text(
                                'SehatBot',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Font bold
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),

            // Container baru dengan gambar di tengah
            SizedBox(height: 24),  // Memberikan jarak antara dua container dan container baru
            Container(
              width: double.infinity,  // Mengatur lebar container agar memenuhi layar
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.green.shade50,  // Warna background hijau muda terang
                borderRadius: BorderRadius.circular(16.0),  // Sudut melengkung
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/dok.png',  // Gambar dok
                  width: 140,  // Ukuran gambar agak besar, tapi tidak terlalu besar
                  height: 140, // Ukuran gambar
                ),
              ),
            ),

            // Container baru dengan gambar dan teks di sebelah kiri
            SizedBox(height: 24),  // Memberikan jarak antara gambar dok dan container baru
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,  // Warna container putih
                borderRadius: BorderRadius.circular(16.0),  // Sudut melengkung
                border: Border.all(
                  color: Colors.black, // Warna border hitam
                  width: 2, // Ketebalan border
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/error.png',  // Gambar error
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kamu belum melapor gejala',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Font bold
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Minggu ini',
                        style: TextStyle(fontSize: 18), // Font biasa
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    Center(child: Text('Jadwal')),   // Tampilan untuk Jadwal
    Center(child: Text('Riwayat')),  // Tampilan untuk Riwayat
    Center(child: Text('Profil')),   // Tampilan untuk Profil
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SehatKita'),
        backgroundColor: Colors.green, // Sesuaikan dengan warna tema
      ),
      backgroundColor: Colors.white, // Mengatur latar belakang menjadi putih terang
      body: _screens[_selectedIndex], // Menampilkan layar sesuai dengan index yang dipilih
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,  // Mengatur tab yang aktif
        onTap: _onItemTapped,  // Fungsi ketika tab ditekan
        iconSize: 30.0,  // Ukuran ikon diperbesar
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true, // Menampilkan label item yang tidak terpilih
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
