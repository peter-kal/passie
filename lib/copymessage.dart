import 'package:flutter/material.dart';
import 'package:yaru_icons/yaru_icons.dart';

const copySnack = SnackBar(
    elevation: 20,
    duration: Duration(milliseconds: 600),
    showCloseIcon: true,
    shape:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
    content: Row(
      children: [
        Icon(
          YaruIcons.ok_simple,
          color: Colors.green,
        ),
        Text(
          "Copied to Clipboard!",
        ),
      ],
    ));
