import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../main.dart';

class ToastUtils {
  static void show(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void showInfosSnackBar(String errorMessage) {
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 10),
        content: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.info, color: Colors.white, size: 30),
                const SizedBox(width: 10),
                Expanded(
                  child:
                      Text(errorMessage, style: const TextStyle(fontSize: 12)),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    rootScaffoldMessengerKey.currentState
                        ?.hideCurrentSnackBar();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: const Text(
                      "Fermer",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
