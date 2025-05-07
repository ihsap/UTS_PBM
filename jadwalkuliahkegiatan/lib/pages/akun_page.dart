import 'package:flutter/material.dart';

class AkunPage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  AkunPage({required this.isDarkMode, required this.onThemeToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profil Pengguna")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama: Ihsan Adi Putra", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("NPM: 4522210085", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Email: ihsan@example.com", style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Row(
              children: [
                Text("Mode Gelap: ", style: TextStyle(fontSize: 16)),
                Switch(value: isDarkMode, onChanged: (_) => onThemeToggle()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
