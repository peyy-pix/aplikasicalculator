import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../services/calculator_service.dart';

class RoasScreen extends StatefulWidget {
  const RoasScreen({super.key});

  @override
  State<RoasScreen> createState() => _RoasScreenState();
}

class _RoasScreenState extends State<RoasScreen> {
  final revenue = TextEditingController();
  final ads = TextEditingController();

  double hasil = 0;

  void hitung() {
    setState(() {
      hasil = CalculatorService.roas(
        double.tryParse(revenue.text) ?? 0,
        double.tryParse(ads.text) ?? 1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kalkulator ROAS")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InputField(controller: revenue, label: "Revenue"),

            InputField(controller: ads, label: "Biaya Ads"),

            ElevatedButton(onPressed: hitung, child: const Text("Hitung ROAS")),

            const SizedBox(height: 20),

            Text(
              "ROAS : ${hasil.toStringAsFixed(2)}x",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
