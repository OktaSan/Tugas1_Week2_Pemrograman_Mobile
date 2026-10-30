import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const HalamanProfil(),
    );
  }
}

/// Widget kartu mahasiswa (Stateless): nama, nim, prodi.
class KartuMahasiswa extends StatelessWidget {
  final String nama;
  final String nim;
  final String prodi;

  const KartuMahasiswa({
    super.key,
    required this.nama,
    required this.nim,
    required this.prodi,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.school)),
        title: Text(nama, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('NIM $nim\nProdi $prodi'),
        isThreeLine: true,
      ),
    );
  }
}

/// Halaman profil: foto (CircleAvatar), nama, satu baris ikon kontak
/// (Row + Container), lalu 3 KartuMahasiswa dalam Column.
class HalamanProfil extends StatelessWidget {
  const HalamanProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kartu profil utama
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Foto
                    CircleAvatar(
                      radius: 44,
                      backgroundColor: Colors.blue.shade100,
                      child: Icon(
                        Icons.person,
                        size: 48,
                        color: Colors.blue.shade700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Nama, NIM, prodi
                    const Text(
                      'Okta Putra Ramadhan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text('NIM 3012410006'),
                    const Text('Prodi Informatika'),
                    const SizedBox(height: 20),

                    // Nama kontak
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Kontak: Liora Yunara',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Satu baris ikon kontak (Row di dalam Container)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.email, color: Colors.blue.shade700),
                          Icon(Icons.phone, color: Colors.blue.shade700),
                          Icon(Icons.location_on, color: Colors.blue.shade700),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Daftar Mahasiswa',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // 3 kartu dalam Column
            const Column(
              children: [
                KartuMahasiswa(
                  nama: 'Okta Putra Ramadhan',
                  nim: '3012410006',
                  prodi: 'Informatika',
                ),
                KartuMahasiswa(
                  nama: 'Liora Yunara',
                  nim: '3012410007',
                  prodi: 'Informatika',
                ),
                KartuMahasiswa(
                  nama: 'Budi Santoso',
                  nim: '3012410008',
                  prodi: 'Informatika',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}