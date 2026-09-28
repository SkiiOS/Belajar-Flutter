import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var hasilHitung = 0.0.obs; //obs untuk update ui
  var pesanPeringatan = "".obs; //obs untuk menampilkan warning

  void setPeringatan(String pesan) {
    pesanPeringatan.value = pesan;
  }

  //method
  void tambah(double angka1, double angka2) {
    pesanPeringatan.value = "";
    double hasiltambah = angka1 + angka2;
    hasilHitung.value = hasiltambah;
  }

  void kurang(double angka1, double angka2) {
    pesanPeringatan.value = "";
    double hasilkurang = angka1 - angka2;
    hasilHitung.value = hasilkurang;
  }

  void kali(double angka1, double angka2) {
    pesanPeringatan.value = "";
    double hasilkali = angka1 * angka2;
    hasilHitung.value = hasilkali;
  }

  void bagi(double angka1, double angka2) {
    if (angka2 != 0) {
      pesanPeringatan.value = "";
      double hasilbagi = angka1 / angka2;
      hasilHitung.value = hasilbagi;
    } else {
      pesanPeringatan.value = "Input Angka 2 tidak boleh 0!";
      hasilHitung.value = 0.0;
    }
  }
}
