import 'dart:io';

void main() {
  // Meminta input dari user
  stdout.write("Masukkan panjang piramida: ");
  int? panjang = int.tryParse(stdin.readLineSync()!);

  // Cek apakah input valid atau tidak
  if (panjang != null && panjang > 0) {
    // Looping untuk setiap baris piramida
    for (int i = 1; i <= panjang; i++) {
      // Mencetak spasi untuk membuat piramida sejajar di tengah
      for (int j = 0; j < panjang - i; j++) {
        stdout.write(' ');
      }
      // Mencetak bintang sesuai urutan baris
      for (int k = 0; k < 2 * i - 1; k++) {
        stdout.write('*');
      }
      // Pindah ke baris berikutnya
      print('');
    }
  } else {
    print("Masukkan angka yang valid dan lebih besar dari 0.");
  }
}
