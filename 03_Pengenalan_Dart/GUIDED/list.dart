// Fixed Length List
void main() {
// Membuat fixed-length list dengan panjang 3
List<int> fixedList = List.filled(3, 0); // List dengan 3 elemen, diisi dengan 0
// Mengubah elemen dalam list
fixedList[0] = 10;
fixedList[1] = 20;
fixedList[2] = 30;
print(fixedList); // Output: [10, 20, 30]
// fixedList.add(40); //

// Growable List
// Membuat growable list (panjangnya bisa berubah)
List<int> growableList = [];
// Menambahkan elemen ke dalam list
growableList.add(10);
growableList.add(20);
growableList.add(30);
print(growableList); // Output: [10, 20, 30]
// Menambahkan lebih banyak elemen
growableList.add(40);
growableList.add(50);
print(growableList); // Output: [10, 20, 30, 40, 50]
// Menghapus elemen dari list
growableList.remove(20);
print(growableList); // Output: [10, 30, 40, 50]
}