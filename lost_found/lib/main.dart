import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lost_found/auth/auth.dart'; // Your existing auth page
import 'package:lost_found/firebase_options.dart';
import 'package:lost_found/homepage.dart';
import 'package:lost_found/post_login_splash_screen.dart';
// New post-login splash screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lost and Found',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/auth', // Set initial route to auth page
      routes: {
        '/auth': (context) => const AuthPage(), // Your existing auth page
        '/postLoginSplash': (context) =>  PostLoginSplashScreen(), // New splash screen
        '/home': (context) => const Homepage(), // Your home screen
      },
    );
  }
}