import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'madules/Login/a_Login.dart';
import 'madules/Login/d_Login.dart';
import 'madules/Login/p_Login.dart';
import 'madules/Register/register_assistant.dart';
import 'madules/Register/register_doctor.dart';
import 'madules/Register/register_patient.dart';
import 'madules/splash/estsrni.dart';
import 'madules/splash/f_splashScrean.dart';
import 'madules/splash/s_splashScreans.dart';
import 'madules/splash/th_splashScrean.dart';
import 'view/onboarding/onboarding.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        f_splashScrean.id: (context) => const f_splashScrean(),
        s_splashScrean.id: (context) => s_splashScrean(),
        th_splashScrean.id: (context) => const th_splashScrean(),
        OnBoarding.id: (context) => const OnBoarding(),
        r_assistant.id: (context) => const r_assistant(),
        r_doctor.id: (context) => const r_doctor(),
        r_patient.id: (context) => r_patient(),
        login.id: (context) => const login(),
        a_login.id: (context) => const a_login(),
        d_login.id: (context) => const d_login(),
      },
      initialRoute: f_splashScrean.id,
    );
  }
}
