import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row and Column',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Row and Column'),
        ),
        body: Center(
          // 2. Gabungkan Row dan Column untuk membuat grid 2x2
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 1. Kotak biru dengan warna berbeda (shade 200 & 400)
                  KotakCustom(warnaKotak: Colors.purpleAccent, teks: 'Kotak 1'),
                  SizedBox(width: 20), // Jarak antar kotak
                  KotakCustom(warnaKotak: Colors.blue, teks: 'Kotak 2'),
                ],
              ),
              SizedBox(height: 20), // Jarak antar baris
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 1. Kotak biru dengan warna berbeda (shade 600 & 800)
                  KotakCustom(warnaKotak: Colors.black, teks: 'Kotak 3'),
                  SizedBox(width: 20),
                  KotakCustom(warnaKotak: Colors.green, teks: 'Kotak 4'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Mengubah KotakBiruJempol menjadi lebih dinamis agar bisa menerima parameter warna dan teks
class KotakCustom extends StatelessWidget {
  final Color warnaKotak;
  final String teks;

  KotakCustom({required this.warnaKotak, required this.teks});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: warnaKotak,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      // 4. Tambahkan Text di bawah setiap icon menggunakan widget Column
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 3. Ubah icon menjadi Icons.favorite dan atur warnanya merah
          Icon(
            Icons.favorite,
            color: Colors.red,
            size: 40,
          ),
          SizedBox(height: 8), // Memberi sedikit jarak antara Icon dan Text
          Text(
            teks,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}