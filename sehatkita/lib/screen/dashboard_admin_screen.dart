import 'package:flutter/material.dart';
import 'package:sehatkita/screen/add_rumah_sakit_screen.dart';
import 'package:sehatkita/screen/kelola_jadwal_screen.dart'; // Tambahkan import ini

class DashboardAdminScreen extends StatelessWidget {
  const DashboardAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800], // Dark background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'DASHBOARD',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Implement logout functionality
                    },
                    child: const Text(
                      'LOGOUT',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildInfoCard('Total Rumah sakit', '24'),
                  _buildInfoCard('Jadwal Hari Ini', '7'),
                  _buildInfoCard('Jumlah Petugas Aktif', '12'),
                  _buildInfoCard('Akun Menunggu Verifikasi', '1'),
                ],
              ),
              const SizedBox(height: 30),
              _buildManagementSection(
                context: context,
                title: 'Kelola Rumah sakit',
                columns: ['No', 'Nama RS', 'Alamat', 'Aksi'],
                data: [
                  ['1', 'RS A', 'Jl.Mawar', Row(children: [
                    TextButton(onPressed: () {}, child: Text('Edit', style: TextStyle(color: Colors.blue))),
                    TextButton(onPressed: () {}, child: Text('hapus', style: TextStyle(color: Colors.red))),
                  ])],
                ],
                // Tambahkan parameter plusOnPressed untuk navigasi ke AddRumahSakitScreen
                plusOnPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddRumahSakitScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              _buildManagementSection(
                context: context,
                title: 'Kelola Jadwal',
                columns: ['No', 'Hari & Tgl', 'Jam', 'Nama Petugas', 'RS', 'Aksi'],
                data: [
                  ['1', 'senin, 21 April 2025', '08.00', 'DR.A', 'RS A', Row(children: [
                    TextButton(onPressed: () {}, child: Text('Edit', style: TextStyle(color: Colors.blue))),
                    TextButton(onPressed: () {}, child: Text('hapus', style: TextStyle(color: Colors.red))),
                  ])],
                ],
                // Tambahkan parameter plusOnPressed untuk navigasi ke KelolaJadwalScreen
                plusOnPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KelolaJadwalScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              _buildManagementSection(
                title: 'Kelola Petugas',
                columns: ['No', 'Nama Petugas', 'Email', 'Status'],
                data: [
                  ['1', 'DR.A', 'ex@gmail.com', Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.brown[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text('Aktif', style: TextStyle(color: Colors.white)),
                  )],
                ],
              ),
              const SizedBox(height: 20),
              _buildManagementSection(
                title: 'Kelola Akun Verifikasi',
                columns: ['No', 'Nama', 'Email', 'Role', 'Satus Verifikasi', 'Aksi'],
                data: [
                  ['1', 'DR.A', 'ex@gmail.com', 'Petugas', 'Belum diverifikasi', Row(children: [
                    TextButton(onPressed: () {}, child: Text('Verifikasi', style: TextStyle(color: Colors.green))),
                    TextButton(onPressed: () {}, child: Text('Tolak', style: TextStyle(color: Colors.red))),
                  ])],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String count) {
    return Card(
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              count,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Tambahkan parameter plusOnPressed pada _buildManagementSection
  Widget _buildManagementSection({
    BuildContext? context,
    required String title,
    required List<String> columns,
    required List<List<dynamic>> data,
    VoidCallback? plusOnPressed,
  }) {
    return Card(
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: columns
                    .map((column) => DataColumn(label: Text(column)))
                    .toList(),
                rows: data
                    .map((rowData) => DataRow(
                          cells: rowData
                              .map((cellData) => DataCell(cellData is Widget ? cellData : Text(cellData.toString())))
                              .toList(),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(Icons.add_circle_outline, color: Colors.black),
                onPressed: plusOnPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}