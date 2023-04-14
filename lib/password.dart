import 'package:passie/home.dart';
import 'dart:math';

String Password(
  var hasNum,
  var hasSym,
  var hasUppLet,
  var hasSmllLet,
  var lenght,
) {
  HomePage hm = HomePage();
  final lenghthere = lenght;
  const LowerCase = 'abcdefghijklmnopqrstuvwxyz';
  const UpperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const Numbers = '0123456789';
  const Symbols = '@!#{}[]":%^&*()';

  String chars = '';
  if (hasUppLet) {
    chars += (hasUppLet ? UpperCase : '');
  }
  if (hasSmllLet) {
    chars += (hasSmllLet ? LowerCase : '');
  }
  if (hasNum) {
    chars += (hasNum ? Numbers : '');
  }
  if (hasSym) {
    chars += (hasSym ? Symbols : '');
  }

  var i = 0;
  var pass = "";

  //Create password
  while (i < lenghthere.round()) {
    //Get random int
    int randomInt = Random.secure().nextInt(chars.length);
    //Get random char and append it to the password
    pass += chars[randomInt];
    i++;
  }
  if (lenghthere == 0) {
    pass = "Zero means no password <3";
  }

  return pass;
}
