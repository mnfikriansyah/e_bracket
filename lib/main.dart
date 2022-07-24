// ignore_for_file: prefer_const_constructors

// import 'package:e_bracket/auth/main_page.dart';
import 'package:e_bracket/config/app_router.dart';
import 'package:e_bracket/config/theme.dart';
import 'package:e_bracket/pages/screens.dart';
// import 'package:e_bracket/pages/login_page.dart';
import 'package:e_bracket/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zero To Unicorn',
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomePage.routeName,
      home: HomePage(),
    ); // MaterialApp
  }
}
