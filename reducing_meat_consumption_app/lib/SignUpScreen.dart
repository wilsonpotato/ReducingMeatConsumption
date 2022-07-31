import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reducing_meat_consumption_app/MeatScreen.dart';

import 'main.dart';

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
        backgroundColor: Colors.pink[50],
        body: Align(
          alignment: Alignment.center,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Create Account',
                            style: TextStyle(
                                fontSize: 100, fontWeight: FontWeight.bold)),
                        Image.asset('images/meat.png', height: 100, width: 100)
                      ],
                    ),
                    SizedBox(
                      height: 100,
                      width: 50,
                      child: TextField(
                        controller: userNameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Username'),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: 50,
                      child: TextField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password'),
                        obscureText: true,
                      ),
                    ),
                    OutlinedButton(
                        onPressed: () {
                          try {
                            FirebaseFirestore.instance
                                .collection('users')
                                .doc(userNameController.text +
                                    passwordController.text)
                                .set({'meat': '300'});
                            showDialog(
                                context: context,
                                builder: ((BuildContext context) =>
                                    successDialog(context)));
                          } catch (e) {}
                          ;
                        },
                        child: const Text('Create Account',
                            style:
                                TextStyle(fontSize: 30, color: Colors.black)),
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.red)),
                  ],
                ),
              )),
        ));
  }

  Widget successDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Account Created!'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Now you can log in."),
        ],
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp()));
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
