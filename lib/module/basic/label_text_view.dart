import 'package:flutter/material.dart';

Widget labelTextView(String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    child: Text(
      label,
      style: TextStyle(
          fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
    ),
  );
}
