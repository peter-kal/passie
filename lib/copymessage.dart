import 'package:flutter/material.dart';

const copySnack = SnackBar(
    duration: Duration(milliseconds: 600),
    showCloseIcon: true,
    shape:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
    content: Text(
      "Copied!",
    ));
