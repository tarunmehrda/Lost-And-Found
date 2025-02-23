import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lost_found/textfield/button.dart';
import 'package:lost_found/textfield/textfield.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  bool isLoading = false;

  void signIn() async {
    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextController.text.trim(),
        password: passwordTextController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = "An unknown error occurred.";
      if (e.code == 'user-not-found') {
        errorMessage = "No user found with this email.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Incorrect password. Please try again.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "The email address is invalid.";
      } else {
        errorMessage = e.message ?? errorMessage;
      }
      showErrorDialog(errorMessage);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Login Error", style: TextStyle(color: Colors.white)),
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.grey[900],
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Dark background
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock,
                size: 100,
                color: Colors.white70, // Light icon color
              ),
              const SizedBox(height: 25),
              const Text(
                "Welcome to lost and found signin ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70, // Light text color
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: Textfield(
                  controller: emailTextController,
                  hintText: 'Email',
                  obscureText: false,
                  hintStyle: TextStyle(color: Colors.grey[500]), // Hint text color
                  textStyle: const TextStyle(color: Colors.white), // Input text color
                  fillColor: Colors.grey[800], // Text field background color
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Textfield(
                  controller: passwordTextController,
                  hintText: 'Password',
                  obscureText: true,
                  hintStyle: TextStyle(color: Colors.grey[500]), // Hint text color
                  textStyle: const TextStyle(color: Colors.white), // Input text color
                  fillColor: Colors.grey[800], // Text field background color
                ),
              ),
              const SizedBox(height: 20),
              isLoading
                  ? const CircularProgressIndicator(color: Colors.white) // Light loading indicator
                  : Padding(
                    padding: const EdgeInsets.only(right: 25 , left: 25),
                    child: Button(
                        text: 'Sign In',
                        onTap: signIn,
                        color: Colors.blue, // Button background color
                        textColor: Colors.white, // Button text color
                      ),
                  ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: widget.onTap,
                child: const Text(
                  "Don't have an account? Register here",
                  style: TextStyle(
                    color: Colors.blue, // Link color
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}