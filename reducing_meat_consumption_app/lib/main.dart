import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:reducing_meat_consumption_app/MeatScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Meat Tracker",
        home: Scaffold(
          appBar: AppBar(title: const Text("Meat Tracker")),
          body: MyHomePage(
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            child: const Text('Login', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold)),
          )
          
        ],
      ),
    );
  }
}
