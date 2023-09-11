import 'package:flutter/material.dart';
import 'dart:math';
import 'listings_user.dart'; 
import 'example_strings.dart'; 

// This code defines the root MaterialApp that is responsible for setting the app's title
void main() {
  runApp(const MyApp());
}

// It defines the app's title, theme, and the initial home screen (SignupScreen in this
// case).
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
       debugShowCheckedModeBanner: false,
      title: 'Bathroom App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SignupScreen(),
    );
  }
}
// This widget represents the Signup screen of the app. It allows the user to
// enter their favorite bathroom, and the entered value is stored in the 'user'
// object.
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}
// This state class manages the state of the SignupScreen widget. It contains
// the part for initializing the text field with a random example bathroom
// string and updating the 'user' object when the user enters their favorite
// bathroom.
class _SignupScreenState extends State<SignupScreen> {
  final User user = User();
  final TextEditingController bathroomController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bathroomController.text = getRandomHintText();
  }

  String getRandomHintText() {
    final Random random = Random();
    return exampleBathrooms[random.nextInt(exampleBathrooms.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: bathroomController,
              decoration: const InputDecoration(
                labelText: 'Favorite Bathroom',
                hintText: 'What is your favorite bathroom you\'ve used?',
                
              ),
              onChanged: (text) {
                setState(() {
                  user.favoriteBathroom = text;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(user: user),
                  ),
                );
              },
              child:const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final User user;

  ProfileScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        
         title:const Text('Profile'),
         
      ),
      body: Padding(
        
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Favorite Bathroom: ${user.favoriteBathroom}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
