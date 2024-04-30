// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../../shared/componente.dart';
import 'f_splashScrean.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const f_splashScrean(),
        ),
      );
    });

    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      color: defultColor2,
      child: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const SizedBox(height: 16.0), Center(child: logo)],
          ),
        ),
      ),
    ));
  }
}
