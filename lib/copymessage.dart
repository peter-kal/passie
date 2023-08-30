import 'package:flutter/material.dart';

const copySnack = SnackBar(
    elevation: 20,
    duration: Duration(milliseconds: 600),
    showCloseIcon: true,
    shape:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
    content: Row(
      children: [
        Icon(
          Icons.done,
          color: Colors.green,
        ),
        Text(
          "Copied to Clipboard!",
        ),
      ],
    ));
