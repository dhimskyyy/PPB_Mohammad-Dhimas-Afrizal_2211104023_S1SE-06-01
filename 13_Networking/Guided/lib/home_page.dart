import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view_model/counter_controller.dart';

class HomePage extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX State Management')),
      body: Center(
        child: Obx(() => Text(
          'Counter: ${controller.count}',
          style: TextStyle(fontSize: 25),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Details Page'),
      ),
    );
  }
}
