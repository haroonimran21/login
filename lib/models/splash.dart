import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login/pages/login_page.dart';

class Splash {
  void isLogin(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage())));
  }
}
