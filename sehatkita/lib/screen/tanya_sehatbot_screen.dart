import 'package:flutter/material.dart';
import 'package:sehatkita/color.dart'; // Menggunakan warna dari AppColors

class TanyaSehatBotScreen extends StatefulWidget {
  @override
  _TanyaSehatBotScreenState createState() => _TanyaSehatBotScreenState();
}

class _TanyaSehatBotScreenState extends State<TanyaSehatBotScreen> {
  final _messageController = TextEditingController();
  final List<String> _messages = []; // Isi pesan-pesan yang dikirim

  @override
  void initState() {
    super.initState();
    // Kosongkan daftar pesan saat halaman dimuat
    _messages.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Tanya SehatBoT'),
      ),
      body: Column(
        children: [
          // Menambahkan gambar di tengah
          Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/bot.png', // Path gambar
                  width: 150, // Ukuran gambar sedang
                  height: 150, // Ukuran gambar sedang
                  fit:
                      BoxFit
                          .contain, // Menyesuaikan gambar agar tidak terdistorsi
                ),
                SizedBox(height: 10), // Memberi jarak antara gambar dan teks
                Text(
                  'Tanya SehatBot',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold, // Teks bold
                    color: Colors.black, // Warna teks
                  ),
                ),
                SizedBox(
                  height: 5,
                ), // Memberi jarak antara teks "Tanya SehatBot" dan kalimat berikutnya
                Text(
                  'Cerita apa yang kamu rasakan, biar sehatBot bantu cek',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal, // Teks biasa
                    color: Colors.grey, // Warna abu-abu
                  ),
                ),
                SizedBox(
                  height: 20,
                ), // Memberikan jarak lebih besar sebelum elemen berikutnya
                // Menambahkan ikon profil di sebelah kiri dan teks di sebelah kanan
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                  ), // Memberikan jarak ke kanan
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_circle, // Ikon profil
                        size: 40, // Ukuran ikon diperbesar sedikit
                        color: Colors.grey, // Warna ikon
                      ),
                      SizedBox(
                        width: 10,
                      ), // Memberikan jarak antara ikon dan teks
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Yudi Mubarok', // Nama
                            style: TextStyle(
                              fontSize: 18, // Ukuran teks nama lebih besar
                              fontWeight:
                                  FontWeight.bold, // Teks bold untuk nama
                              color: Colors.black, // Warna teks nama
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ), // Memberi jarak antara nama dan kalimat berikutnya
                          Text(
                            'Jam Gt', // Kalimat tambahan di bawah nama
                            style: TextStyle(
                              fontSize: 14, // Ukuran teks sedikit lebih kecil
                              fontWeight: FontWeight.normal, // Teks biasa
                              color: Colors.grey, // Warna abu-abu
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ), // Memberikan jarak lebih besar setelah elemen profil
                // Menambahkan Message Box yang hanya muncul setelah pesan dikirim
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          Colors.grey[100], // Warna latar belakang Message Box
                      borderRadius: BorderRadius.circular(
                        10,
                      ), // Sudut melengkung
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ), // Border abu-abu
                    ),
                    padding: EdgeInsets.all(8),
                    height: 60, // Menambahkan tinggi pada container
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            _messages.isEmpty
                                ? "" // Kosongkan jika tidak ada pesan
                                : _messages
                                    .last, // Menampilkan pesan terakhir yang dikirim
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(_messages[index]));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // Warna latar belakang container
                    borderRadius: BorderRadius.circular(
                      25,
                    ), // Membuat sudut container melengkung
                  ),
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.insert_emoticon,
                      ), // Menambahkan icon senyum
                      labelText: 'Tanya SehatBoT',
                      border:
                          InputBorder
                              .none, // Menghilangkan border default TextField
                    ),
                    onChanged: (text) {
                      setState(() {}); // Memperbarui tampilan saat mengetik
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ), // Menambahkan ruang antara TextField dan tombol
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Menambahkan pesan baru ke dalam daftar
                      if (_messageController.text.isNotEmpty) {
                        _messages.add(
                          _messageController.text,
                        ); // Tambahkan pesan yang baru
                        _messageController
                            .clear(); // Bersihkan input setelah kirim
                      }
                    });
                  },
                  child: Text('Kirim'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    minimumSize: Size(double.infinity, 50),
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
