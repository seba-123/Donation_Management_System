import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

showCustomToaster(title) {
  return showToast(title,
      position: ToastPosition.bottom,
      backgroundColor: Colors.black54,
      radius: 5);
}
