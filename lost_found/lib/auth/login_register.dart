import 'package:flutter/material.dart';
import 'package:lost_found/loginpage/loginpage.dart';
import 'package:lost_found/loginpage/register.dart';
// import 'package:lost_found/loginpage/registerpage.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    }
    else{
      return Register(onTap: togglePages);
    }
  }
}
