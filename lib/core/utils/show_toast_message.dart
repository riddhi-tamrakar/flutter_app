import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../style/colors.dart';

Future showToastMessage(String msg) {
  return Fluttertoast.showToast(
      timeInSecForIosWeb: 0,
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
      backgroundColor: boxItemColor,
      fontSize: 16.0);
}
