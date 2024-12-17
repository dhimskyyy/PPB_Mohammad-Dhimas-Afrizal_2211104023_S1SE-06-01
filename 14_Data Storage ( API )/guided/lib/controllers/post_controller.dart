import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  // Reactive list untuk menyimpan posts
  var posts = <dynamic>[].obs;
  var isLoading = false.obs;

  // Fungsi untuk GET data
  Future<void> fetchPosts() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('$baseUrl/posts'));
      if (response.statusCode == 200) {
        posts.value = json.decode(response.body);
        Get.snackbar('Success', 'Data berhasil diambil!');
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  // Fungsi untuk POST data
  Future<void> createPost() async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse('$baseUrl/posts'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': 'Flutter Post',
          'body': 'Ini contoh POST.',
          'userId': 1,
        }),
      );
      if (response.statusCode == 201) {
        posts.add(json.decode(response.body));
        Get.snackbar('Success', 'Data berhasil ditambahkan!');
      } else {
        throw Exception('Failed to create post');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  // Fungsi untuk UPDATE data
  Future<void> updatePost(int postId) async {
    try {
      isLoading(true);
      final response = await http.put(
        Uri.parse('$baseUrl/posts/$postId'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': 'Updated Title',
          'body': 'Updated Body',
          'userId': 1,
        }),
      );
      if (response.statusCode == 200) {
        int index = posts.indexWhere((post) => post['id'] == postId);
        if (index != -1) {
          posts[index] = json.decode(response.body);
        }
        Get.snackbar('Success', 'Data berhasil diperbarui!');
      } else {
        throw Exception('Failed to update post');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  // Fungsi untuk DELETE data
  Future<void> deletePost(int postId) async {
    try {
      isLoading(true);
      final response = await http.delete(Uri.parse('$baseUrl/posts/$postId'));
      if (response.statusCode == 200) {
        posts.removeWhere((post) => post['id'] == postId);
        Get.snackbar('Success', 'Data berhasil dihapus!');
      } else {
        throw Exception('Failed to delete post');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
