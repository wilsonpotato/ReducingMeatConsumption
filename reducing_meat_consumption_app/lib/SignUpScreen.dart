import 'package:flutter/material.dart';
import 'package:reducing_meat_consumption_app/MeatScreen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              title: const Text("Meat Tracker"), backgroundColor: Colors.red),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text('Create Account',
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
                child: const Text('Create Account',
                    style: TextStyle(fontSize: 30, color: Colors.black)),
                style: TextButton.styleFrom(backgroundColor: Colors.red)),
          ],
        ),
      ),
    );
  }
}
