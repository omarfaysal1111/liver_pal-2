import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4E1864),
      body: Center(child: SizedBox(child: Image.asset("assets/logo..png"))),
    );
  }
}
