import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:reducing_meat_consumption_app/MeatScreen.dart';
import 'package:reducing_meat_consumption_app/SignUpScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Meat Tracker",
        home: Scaffold(
          appBar: AppBar(
              title: const Text("Meat Tracker"), backgroundColor: Colors.red),
          body: const MyHomePage(
            title: "Meat Tracker",
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            child: const Text('Login',
                style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold)),
          ),
          Container(
            alignment: Alignment.center,
            height: 100,
            width: 50,
            child: TextField(
              controller: userNameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Username'),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 100,
            width: 50,
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
            ),
          ),
          OutlinedButton(
              onPressed: () {},
              child: const Text('Sign in',
                  style: TextStyle(fontSize: 30, color: Colors.black)),
              style: TextButton.styleFrom(backgroundColor: Colors.red)),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: const Text(
                "Don't have a account?",
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
