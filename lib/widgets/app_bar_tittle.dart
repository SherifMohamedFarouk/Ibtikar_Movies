import 'package:flutter/material.dart';

Row appBarTittle() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Ibtikar"),
      Text(
        "Movies",
        style: TextStyle(color: Colors.black),
      )
    ],
  );}