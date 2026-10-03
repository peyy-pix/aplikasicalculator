import 'package:flutter/material.dart';
import '../widgets/input_field.dart';

class ProfitScreen extends StatefulWidget {
  const ProfitScreen({super.key});

  @override
  State<ProfitScreen> createState() => _ProfitScreenState();
}

class _ProfitScreenState extends State<ProfitScreen> {
  final hargaJual = TextEditingController();
  final modalProduk = TextEditingController();

  double profitPersen = 0;

  void hitung() {
    double harga = double.tryParse(hargaJual.text) ?? 0;

    double modal = double.tryParse(modalProduk.text) ?? 0;

    if (modal > 0) {
      setState(() {
        profitPersen = ((harga - modal) / modal) * 100;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple Profit")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InputField(controller: hargaJual, label: "Harga Jual"),

            InputField(controller: modalProduk, label: "Modal Produk"),

            ElevatedButton(onPressed: hitung, child: const Text("Hitung")),

            const SizedBox(height: 20),

            Text(
              "Profit : ${profitPersen.toStringAsFixed(2)}%",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
