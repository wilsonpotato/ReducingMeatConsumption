import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//contains constant 
class Constants{
  static const int meatConsumption = 300; 

  static int getMeatData(String username, String password) {
    int meat = 0;
    var data;
    FirebaseFirestore.instance
        .collection('users')
        .doc(username + password)
        .get()
        .then((docSnapshot) => {data = docSnapshot.data()});
    meat = int.parse(data['meat']);
    return meat;
  }
}