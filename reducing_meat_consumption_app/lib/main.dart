import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:reducing_meat_consumption_app/MeatScreen.dart';
import 'package:reducing_meat_consumption_app/SignUpScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return Align(
      alignment: Alignment.center,
      child: Padding(
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
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Password'),
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(userNameController.text + passwordController.text)
                      .get()
                      .then((docSnapshot) => {
                            if (docSnapshot.exists)
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LogMeatPage(
                                            username: userNameController.text,
                                            password: passwordController.text)))
                              }
                            else
                              {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        failureDialog(context))
                              }
                          });
                },
                child: const Text('Sign in',
                    style: TextStyle(fontSize: 30, color: Colors.black)),
                style: TextButton.styleFrom(backgroundColor: Colors.red)),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()));
                },
                child: const Text(
                  "Don't have a account?",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }

  Widget failureDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text("Couldn't sign in"),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Try creating a account or remembering your credentials"),
        ],
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
