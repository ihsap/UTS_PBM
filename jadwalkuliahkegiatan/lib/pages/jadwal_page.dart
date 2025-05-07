import 'package:flutter/material.dart';

class JadwalPage extends StatelessWidget {
  final List<Map<String, String>> jadwal = [
    {"hari": "Senin", "mataKuliah": "Pemrograman Berbasis Mobile - 08:00"},
    {"hari": "Selasa", "mataKuliah": "Metdologi penelitian - 11:20"},
    {"hari": "Rabu", "mataKuliah": "Manajemen Proyek - 09:40"},
    {"hari": "Kamis", "mataKuliah": "Computer Forensic - 10:30"},
    {"hari": "Jumat", "mataKuliah": "Geoinformatika - 08:00"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jadwal Kuliah")),
      body: ListView.builder(
        itemCount: jadwal.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.book),
              title: Text(jadwal[index]["hari"]!),
              subtitle: Text(jadwal[index]["mataKuliah"]!),
            ),
          );
        },
      ),
    );
  }
}
