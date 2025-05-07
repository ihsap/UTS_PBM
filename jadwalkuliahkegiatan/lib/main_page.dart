import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'pages/home_page.dart';
import 'pages/jadwal_page.dart';
import 'pages/akun_page.dart';

class MainPage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const MainPage({required this.isDarkMode, required this.onThemeToggle});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(),
      JadwalPage(),
      AkunPage(
        isDarkMode: widget.isDarkMode,
        onThemeToggle: widget.onThemeToggle,
      ),
    ];

    return AdaptiveLayout(
body: SlotLayout(
  config: <Breakpoint, SlotLayoutConfig>{
    Breakpoints.small: SlotLayout.from(
      key: const Key('small-body'),
      builder: (context) => Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (i) => setState(() => selectedIndex = i),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Jadwal'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
          ],
        ),
      ),
    ),
    Breakpoints.mediumAndUp: SlotLayout.from(
      key: const Key('medium-body'),
      builder: (context) => Scaffold(
        appBar: AppBar(title: Text("Planner Mahasiswa")),
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) =>
                  setState(() => selectedIndex = index),
              destinations: const [
                NavigationRailDestination(icon: Icon(Icons.home), label: Text("Home")),
                NavigationRailDestination(icon: Icon(Icons.schedule), label: Text("Jadwal")),
                NavigationRailDestination(icon: Icon(Icons.person), label: Text("Akun")),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: pages[selectedIndex]),
          ],
        ),
      ),
    ),
  },
),

    );
  }
}
