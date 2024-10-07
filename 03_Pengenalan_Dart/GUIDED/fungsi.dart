// Mendefenisikan Fungsi
int factorial(int n) {
  if (n <= 1) return 1;
  return n *factorial(n - 1);
}

// Memanggil Fungsi
void main() {
print(factorial(6));

// Memanggil sapaan
String pesan = sapaan("Dart");
print(pesan);

// Memanggil greet
greet("Alice", 25);
}

// Mengembalikan Nilai
String sapaan(String nama) {
return "Halo, $nama!";
}

// Menambahkan Parameter

void greet(String name, int age) {
print("Hello $name, you are $age years old.");
}