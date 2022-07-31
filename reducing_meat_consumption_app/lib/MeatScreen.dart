import 'dart:html';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reducing_meat_consumption_app/main.dart';
import 'constants.dart';

class LogMeatPage extends StatefulWidget {
  final String username;
  final String password;

  const LogMeatPage({Key? key, required this.username, required this.password})
      : super(key: key);

  @override
  State<LogMeatPage> createState() => _LogMeatPage();
}

class _LogMeatPage extends State<LogMeatPage> {
  TextEditingController meatLogController = new TextEditingController();
  int meatLeft = 0;

  @override
  Widget build(BuildContext context) {
    setMeats();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Your Meats!'),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.pink[50],
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      meatLeft.toString(),
                      style: TextStyle(fontSize: 120),
                    ),
                    Image.asset('images/meat.png', height: 120, width: 120)
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 350,
                      child: TextField(
                        controller: meatLogController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Amount of Meat You Consumed in Grams'),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          meatLeft -= int.parse(meatLogController.text);
                          if (meatLeft <= 0) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    popupDialog(context));
                          }
                          FirebaseFirestore.instance
                              .collection('users')
                              .doc(widget.username + widget.password)
                              .set({'meat': meatLeft.toString()});
                        });
                      },
                      child: const Text(
                        'Log!',
                        style: TextStyle(fontSize: 45),
                      ),
                      style: TextButton.styleFrom(backgroundColor: Colors.red),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    meatLeft = 300;
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(widget.username + widget.password)
                        .set({'meat': meatLeft.toString()});
                  });
                },
                child: const Text(
                  'Reset your meak intake!',
                  style: TextStyle(fontSize: 45),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.red),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const MyApp()));
                  },
                  child: const Text(
                    "Sign out",
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          )),
    );
  }

  void setMeats() async {
    var data;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.username + widget.password)
        .get()
        .then((docSnapshot) => {data = docSnapshot.data()});
    setState(() {
      meatLeft = int.parse(data['meat']);
    });
  }

  Widget popupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('You gone over your Meat Consumption Limit'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Try to eat more fruits or veggies!"),
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
