import 'package:flutter/material.dart';
import '../models/user.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  HomeScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('/assets/fotoku.jpg'),
          ),
          SizedBox(height: 10),
          Text(
            user.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(user.description),
          TextButton(
            onPressed: () {
              // Kontak via WhatsApp
            },
            child: Text("Contact via WhatsApp"),
          ),
        ],
      ),
    );
  }
}
