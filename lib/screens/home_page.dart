import 'package:flutter/material.dart';
import 'roas_screen.dart';
import 'laba_biaya_screen.dart';
import 'profit_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final pages = const [RoasScreen(), LabaBiayaScreen(), ProfitScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "ROAS"),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: "Laba & Biaya",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: "Profit"),
        ],
      ),
    );
  }
}
