import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:login/pages/login_pages.dart';
// import 'package:login/pages/login_page.dart';
import 'package:login/pages/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) => print(value));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const SplashPage(),
    );
  }
}
