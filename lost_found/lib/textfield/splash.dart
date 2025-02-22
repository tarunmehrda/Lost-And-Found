import 'package:flutter/material.dart';
import 'package:lost_found/post_login_splash_screen.dart';
 

class LoginScreen extends StatelessWidget {
  void _loginUser(BuildContext context) async {
    // Simulate a login process
    await Future.delayed(Duration(seconds: 2));

    // Navigate to the post-login splash screen after successful login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => PostLoginSplashScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _loginUser(context),
          child: Text('Login'),
        ),
      ),
    );
  }
}