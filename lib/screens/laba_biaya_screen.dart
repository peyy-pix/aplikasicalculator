import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../services/calculator_service.dart';

class LabaBiayaScreen extends StatefulWidget {
  const LabaBiayaScreen({super.key});

  @override
  State<LabaBiayaScreen> createState() => _LabaBiayaScreenState();
}

class _LabaBiayaScreenState extends State<LabaBiayaScreen> {
  final omset = TextEditingController();
  final modal = TextEditingController();
  final iklan = TextEditingController();
  final operasional = TextEditingController();

  double laba = 0;

  void hitung() {
    setState(() {
      laba = CalculatorService.laba(
        double.tryParse(omset.text) ?? 0,
        double.tryParse(modal.text) ?? 0,
        double.tryParse(iklan.text) ?? 0,
        double.tryParse(operasional.text) ?? 0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Laba & Biaya")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            InputField(controller: omset, label: "Omset"),

            InputField(controller: modal, label: "Modal"),

            InputField(controller: iklan, label: "Biaya Iklan"),

            InputField(controller: operasional, label: "Operasional"),

            ElevatedButton(onPressed: hitung, child: const Text("Analisa")),

            const SizedBox(height: 20),

            Text(
              "Laba Bersih : Rp ${laba.toStringAsFixed(0)}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
