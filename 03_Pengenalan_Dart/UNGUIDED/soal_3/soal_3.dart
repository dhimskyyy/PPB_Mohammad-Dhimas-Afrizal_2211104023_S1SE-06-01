import 'dart:io';

bool cekPrima(int angka) {
  // Bilangan prima harus lebih dari 1
  if (angka <= 1) {
    return false;
  }

  // Cek apakah angka memiliki faktor selain 1 dan dirinya sendiri
  for (int i = 2; i <= angka ~/ 2; i++) {
    if (angka % i == 0) {
      return false; // Jika ada faktor lain, maka bukan bilangan prima
    }
  }

  return true; // Jika tidak ada faktor lain, maka bilangan prima
}

void main() {
  // Meminta input dari user
  stdout.write("Masukkan bilangan bulat: ");
  int? angka = int.tryParse(stdin.readLineSync()!);

  // Cek apakah input valid
  if (angka != null) {
    // Cek apakah bilangan prima atau bukan
    if (cekPrima(angka)) {
      print("$angka adalah bilangan prima.");
    } else {
      print("$angka bukan bilangan prima.");
    }
  } else {
    print("Masukkan bilangan bulat yang valid.");
  }
}
