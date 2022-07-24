import 'package:e_bracket/auth/auth_page.dart';
import 'package:e_bracket/pages/login_page.dart';
<<<<<<< HEAD
import 'package:e_bracket/pages/home/home_page.dart';
=======
import 'package:e_bracket/pages/home_page.dart';
>>>>>>> origin/fikri
import 'package:e_bracket/pages/wrapper_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return WrapperPage();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
