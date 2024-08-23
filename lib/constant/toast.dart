import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../network/apiService.dart';

class ToastUtils {
  static showToast(String message, FToast fToast) {
    logger.i("I Am Here");
    /* Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
    )*/
    fToast.showToast(
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(5)),
          child: Text(
            message,
            style: const TextStyle(
                fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white),
          ),
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
