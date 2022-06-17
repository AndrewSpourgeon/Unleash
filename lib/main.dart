import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:snap_book/screens/HomePage.dart';

import 'package:snap_book/screens/LoginPage.dart';

int? count;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  count = await prefs.getInt('count');
  await prefs.setInt('count', 1);
  runApp(SnapBook());
}

class SnapBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snap Book',
      home: count == 0 || count == null ? OnBoardingPage() : LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
