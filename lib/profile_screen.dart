import 'package:flutter/material.dart';
import 'listings_user.dart'; // Import the User class
// This widget represents the user's profile screen. It displays the user's
// favorite bathroom, which is passed as a parameter ('user') to this widget.
class ProfileScreen extends StatelessWidget {
  final User user;

  ProfileScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Favorite Bathroom: ${user.favoriteBathroom}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
