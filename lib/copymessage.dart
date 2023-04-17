import 'package:flutter/material.dart';

const CopySnack = SnackBar(
    duration: Duration(milliseconds: 1300),
    showCloseIcon: true,
    shape:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
    content: Text(
      "Copied!",
    ));
