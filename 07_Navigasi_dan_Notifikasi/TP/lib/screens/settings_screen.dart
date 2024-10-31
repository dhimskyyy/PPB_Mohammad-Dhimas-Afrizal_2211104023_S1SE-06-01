import 'package:flutter/material.dart';
import '../models/user.dart';
import 'login_screen.dart';
import 'edit_profile_screen.dart';
import 'edit_portfolio_screen.dart';

class SettingsScreen extends StatelessWidget {
  final User user;

  SettingsScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text("Edit Profile"),
          onTap: () async {
            final updatedUser = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfileScreen(user: user),
              ),
            );
            if (updatedUser != null) {
              // Update data pengguna di sini
            }
          },
        ),
        ListTile(
          title: Text("Edit Portfolio"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditPortfolioScreen(),
              ),
            );
          },
        ),
        ListTile(
          title: Text("Logout"),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        ),
      ],
    );
  }
}
