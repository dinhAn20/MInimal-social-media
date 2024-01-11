// Display message to user

import 'package:flutter/material.dart';

displayMessage(String text, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(text),
    ),
  );
}
