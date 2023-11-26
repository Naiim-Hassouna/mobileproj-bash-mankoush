import 'package:flutter/material.dart';


Widget submitButton(String title) {
  return Container(
    height: 60,
    width: 200,
    decoration: BoxDecoration(
      color: Colors.brown,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
