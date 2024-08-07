import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iti_project/screens/introduction_screen.dart';
import 'package:iti_project/screens/signin_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

bool showPage = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  showPage = prefs.getBool("IntroScreen") ?? true;
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      
      home: showPage ? const IntroScreen() : const SignInScreen(),
    );
  }
}
