import 'package:flutter/material.dart';
import 'package:login/models/splash.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Splash splashPage = Splash();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashPage.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splash"),
      ),
    );
  }
}