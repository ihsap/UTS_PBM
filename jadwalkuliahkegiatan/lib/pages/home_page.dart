import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> kegiatan = [
    {"nama": "Rapat UKM", "tanggal": "Senin, 5 Mei", "selesai": false},
    {"nama": "POMNAS", "tanggal": "Selasa, 6 Mei", "selesai": false},
    {"nama": "LKMM", "tanggal": "Rabu, 7 Mei", "selesai": false},
  ];

  final String quoteMotivasi =
      "“Setiap hari adalah kesempatan untuk belajar dan berkembang.”";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kegiatan Mahasiswa")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              quoteMotivasi,
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: kegiatan.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(kegiatan[index]['nama']),
                  subtitle: Text(kegiatan[index]['tanggal']),
                  value: kegiatan[index]['selesai'],
                  onChanged: (val) {
                    setState(() {
                      kegiatan[index]['selesai'] = val!;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
