import 'dart:io';

String cekNilai(int nilai) {
  if (nilai > 70) {
    return "$nilai merupakan Nilai A";
  } else if (nilai > 40 && nilai <= 70) {
    return "$nilai merupakan Nilai B";
  } else if (nilai > 0 && nilai <= 40) {
    return "$nilai merupakan Nilai C";
  } else {
    return "";  // Jika tidak memenuhi kondisi di atas, return teks kosong
  }
}

void main() {
  // Input dari user
  stdout.write("Masukkan nilai: ");
  String? input = stdin.readLineSync(); // Membaca input sebagai string
  
  // Cek apakah input valid dan bisa diubah menjadi integer
  if (input != null) {
    int? nilai = int.tryParse(input); // Ubah input menjadi integer
    
    if (nilai != null) {
      String hasil = cekNilai(nilai);
      if (hasil.isNotEmpty) {
        print(hasil);
      } else {
        print("Nilai tidak valid");
      }
    } else {
      print("Masukkan angka yang valid.");
    }
  } else {
    print("Input tidak boleh kosong.");
  }
}
