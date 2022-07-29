import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

class LogMeatPage extends StatefulWidget {
  @override
  State<LogMeatPage> createState() => _LogMeatPage();
}

class _LogMeatPage extends State<LogMeatPage> {
  TextEditingController meatLogController = new TextEditingController();
  int meatLeft = Constants.meatConsumption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Your Meats!'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Text(meatLeft.toString()),
                    Image.asset('images/meat.png', height: 100, width: 100)
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 100,
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
                          });
                        },
                        child: const Text('Log!'))
                  ],
                ),
              )
            ],
          )),
    );
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
