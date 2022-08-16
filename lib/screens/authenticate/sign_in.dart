import 'package:flutter/material.dart';
import 'package:kanglei_tourist_home/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        elevation: 0.0,
        title: const Text("Sign in to Tourist App"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: ElevatedButton(
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                ("error signing in");
              } else {
                ("signed in");
                (result.uid);
              }
            },
            child: const Text("Sign in")),
      ),
    );
  }
}
