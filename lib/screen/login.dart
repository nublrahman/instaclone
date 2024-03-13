// ignore_for_file: prefer_const_constructors, unused_import, sort_child_properties_last, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:insta_clone/screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadCredentials();
  }

  Future<void> saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', usernameController.text);
    await prefs.setString('password', passwordController.text);
    await prefs.setBool('isLoggedIN', true);
  }

  bool isValidCredentials() {
    return isValidUsername(usernameController.text) &&
        passwordController.text == 'Instagram123';
  }

  bool isValidUsername(String username) {
    return username.length >= 5;
  }

  Future<void> loadCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      usernameController.text = prefs.getString('username') ?? '';
      passwordController.text = prefs.getString('password') ?? '';
    });
  }

  Future<void> navigateToHome(BuildContext context) async {
    if (isValidCredentials()) {
      await saveCredentials();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('images/text.png'),
                  height: 200,
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Username',
                          hintText: 'Enter your username',
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Password',
                          hintText: 'Enter your password',
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          navigateToHome(context);
                        },
                        child: Text('Login'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 33, 197, 175),
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
