import 'package:belajarflutter/components/custom_button.dart';
import 'package:belajarflutter/components/custom_text.dart';
import 'package:belajarflutter/components/custom_textfield.dart';
import 'package:belajarflutter/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final CalculatorController controller = Get.put(CalculatorController());
  final TextEditingController txtangka1 = TextEditingController();
  final TextEditingController txtangka2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void hitung(String operasi) {
      final String input1 = txtangka1.text.trim();
      final String input2 = txtangka2.text.trim();

      void tampilkanWarning(String pesan) {
        controller.setPeringatan(pesan);

        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.warning_amber_rounded, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(child: Text(pesan)),
              ],
            ),
            backgroundColor: Colors.red.shade600,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 3),
          ),
        );

        try {
          Get.rawSnackbar(
            title: "Peringatan",
            message: pesan,
            backgroundColor: Colors.red.shade600,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3),
            margin: const EdgeInsets.all(12),
            borderRadius: 8,
          );
        } catch (_) {}
      }

      void tampilkanHasil(String operasi, double hasil) {
        final String hasilStr = hasil % 1 == 0
            ? hasil.toInt().toString()
            : hasil.toString();

        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle_outline, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Hasil $operasi: $hasilStr",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.green.shade600,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
          ),
        );

        try {
          Get.rawSnackbar(
            title: "Hasil Perhitungan",
            message: "Hasil $operasi: $hasilStr",
            backgroundColor: Colors.green.shade600,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2),
            margin: const EdgeInsets.all(12),
            borderRadius: 8,
          );
        } catch (_) {}
      }

      if (input1.isEmpty || input2.isEmpty) {
        tampilkanWarning("Input angka 1 dan angka 2 tidak boleh kosong!");
        return;
      }

      final double? a = double.tryParse(input1);
      final double? b = double.tryParse(input2);

      if (a == null || b == null) {
        tampilkanWarning("Input harus angka valid!");
        return;
      }

      if (b == 0) {
        tampilkanWarning("Input Angka 2 tidak boleh 0!");
        return;
      }

      if (operasi == "tambah") {
        controller.tambah(a, b);
      } else if (operasi == "kurang") {
        controller.kurang(a, b);
      } else if (operasi == "kali") {
        controller.kali(a, b);
      } else if (operasi == "bagi") {
        controller.bagi(a, b);
      }

      tampilkanHasil(operasi, controller.hasilHitung.value);
    }

    return Scaffold(
      appBar: AppBar(title: const Text("my kalkulator"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextfield(
              myHint: "input angka 1",
              txtController: txtangka1,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9.]*')),
              ],
            ),
            const SizedBox(height: 12),
            CustomTextfield(
              myHint: "input angka 2",
              txtController: txtangka2,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9.]*')),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CustomButton(
                      label: "tambah",
                      fontSize: 16,
                      onPressed: () => hitung("tambah"),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CustomButton(
                      label: "kurang",
                      fontSize: 16,
                      onPressed: () => hitung("kurang"),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CustomButton(
                      label: "kali",
                      fontSize: 16,
                      onPressed: () => hitung("kali"),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CustomButton(
                      label: "bagi",
                      fontSize: 16,
                      onPressed: () => hitung("bagi"),
                    ),
                  ),
                ),
              ],
            ),
            Obx(() {
              if (controller.pesanPeringatan.value.isNotEmpty) {
                return Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red.shade300),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.red.shade700,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          controller.pesanPeringatan.value,
                          style: TextStyle(
                            color: Colors.red.shade800,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
            const SizedBox(height: 24),
            Obx(
              () => CustomText(
                text: "hasil: ${controller.hasilHitung.value}",
                fontSize: 22,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Calculator extends CalculatorPage {
  Calculator({super.key});
}
