import 'package:flutter/material.dart';
import 'package:insta_clone/screen/home_screen.dart';
import 'package:insta_clone/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIN = prefs.getBool('isLoggedIN') ?? false;
  runApp(MyApp(isLoggedIN: isLoggedIN));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIN;
  const MyApp({Key? key, required this.isLoggedIN}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIN ? HomeScreen() : LoginScreen(),
    );
  }
}
