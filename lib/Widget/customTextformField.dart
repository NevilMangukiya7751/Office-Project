import 'package:flutter/material.dart';

textFormField(String hintText, TextEditingController controller) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2), // Shadow color
          spreadRadius: 2, // Spread radius
          blurRadius: 1, // Blur radius
          offset: const Offset(1, 2), // Offset for shadow (x, y)
        ),
      ],
      borderRadius:
          BorderRadius.circular(40), // Match the border radius of TextFormField
    ),
    child: TextFormField(
      controller: controller,
      cursorColor: Colors.grey.withOpacity(0.5),
      decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(40),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14)),
    ),
  );
}
