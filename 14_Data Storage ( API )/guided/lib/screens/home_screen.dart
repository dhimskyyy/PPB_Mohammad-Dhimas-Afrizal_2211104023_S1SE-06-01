import 'package:flutter/material.dart';
import 'package:percobaan3/services/api_service.dart'; // Pastikan file ApiService sudah ada dan di-import

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<dynamic> _posts = []; // Menyimpan list posts
  bool _isLoading = false; // Untuk indikator loading
  final ApiService _apiService = ApiService(); // Instance ApiService

  // Fungsi untuk menampilkan SnackBar
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // Fungsi untuk memanggil API dan menangani operasi
  Future<void> _handleApiOperation(
      Future<void> operation, String successMessage) async {
    setState(() {
      _isLoading = true;
    });
    try {
      await operation; // Menjalankan operasi API
      setState(() {
        _posts = _apiService.posts;
      });
      _showSnackBar(successMessage);
    } catch (e) {
      _showSnackBar('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Http Request Example"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Indikator Loading
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _posts.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Tekan tombol GET untuk mengambil data",
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: _posts.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: 12.0, left: 8.0, right: 8.0),
                            child: Card(
                              elevation: 4,
                              child: ListTile(
                                title: Text(
                                  _posts[index]['title'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                subtitle: Text(
                                  _posts[index]['body'],
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
          // Tombol GET, POST, UPDATE, DELETE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () => _handleApiOperation(
                      _apiService.fetchPosts(), 'Data berhasil diambil!'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                  ),
                  child: const Text(
                    'GET',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => _handleApiOperation(
                      _apiService.createPost(), 'Data berhasil ditambahkan!'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                  ),
                  child: const Text(
                    'POST',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => _handleApiOperation(
                      _apiService.updatePost(1), 'Data berhasil diperbarui!'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                  ),
                  child: const Text(
                    'UPDATE',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => _handleApiOperation(
                      _apiService.deletePost(1), 'Data berhasil dihapus!'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                  ),
                  child: const Text(
                    'DELETE',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}