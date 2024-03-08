import 'dart:math';

String password(var hasNum, var hasSym, var hasUppLet, var hasSmllLet,
    var lenght, var symbols) {
  final lenghthere = lenght;
  const lowerCase = 'abcdefghijklmnopqrstuvwxyz';
  const upperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const numbers = '0123456789';
  var sym = symbols;

  String chars = '';
  if (hasUppLet) {
    chars += (hasUppLet ? upperCase : '');
  }
  if (hasSmllLet) {
    chars += (hasSmllLet ? lowerCase : '');
  }
  if (hasNum) {
    chars += (hasNum ? numbers : '');
  }
  if (hasSym) {
    chars += (hasSym ? sym : '');
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

  return pass;
}
