import 'package:cloud_firestore/cloud_firestore.dart';
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
        body: Align(
          alignment: Alignment.center,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ListView(
                  children: [
                    const Text('Create Account',
                        style: TextStyle(
                            fontSize: 100, fontWeight: FontWeight.bold)),
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
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
