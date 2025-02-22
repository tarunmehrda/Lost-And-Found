import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lost_found/auth/login_register.dart';
import 'package:lost_found/post_login_splash_screen.dart';
 // Add this import
// import 'package:lost_found/homepage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            // Redirect to the post-login splash screen
            return  PostLoginSplashScreen();
          } else {
            return const LoginRegister();
          }
        },
      ),
    );
  }
}