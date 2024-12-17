import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostController controller = Get.put(PostController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX HTTP Example'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (controller.posts.isEmpty) {
                return const Center(child: Text('Tekan tombol GET untuk mengambil data'));
              } else {
                return ListView.builder(
                  itemCount: controller.posts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: ListTile(
                        title: Text(controller.posts[index]['title']),
                        subtitle: Text(controller.posts[index]['body']),
                      ),
                    );
                  },
                );
              }
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: controller.fetchPosts,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text('GET', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: controller.createPost,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('POST', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => controller.updatePost(1),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('UPDATE', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => controller.deletePost(1),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('DELETE', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
