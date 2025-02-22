import 'package:flutter/material.dart';
import 'package:lost_found/homepage.dart'; // Import your homepage

class PostLoginSplashScreen extends StatefulWidget {
  const PostLoginSplashScreen({super.key});

  @override
  _PostLoginSplashScreenState createState() => _PostLoginSplashScreenState();
}

class _PostLoginSplashScreenState extends State<PostLoginSplashScreen> {
  @override
  void initState() {
    super.initState();
    _performPostLoginOperations();
  }

  void _performPostLoginOperations() async {
    // Simulate post-login operations (e.g., fetching user data)
    await Future.delayed(const Duration(seconds: 3));

    // Navigate to the homepage after operations are complete
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Homepage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Force dark background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Uploaded image
            Image.asset(
              'images/Lost.png', // Path to your image
              width: 150, // Adjust the width as needed
              height: 150, // Adjust the height as needed
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // White loading indicator
            ),
            const SizedBox(height: 20),
            Text(
              'Loading...',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white, // White text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}