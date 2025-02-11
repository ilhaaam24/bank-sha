import 'package:another_flushbar/flushbar.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

void showCustomSnackbar(BuildContext context, String message) {
  Flushbar(
    message: message,
    backgroundColor: redColor,
    flushbarPosition: FlushbarPosition.TOP,
    duration: const Duration(seconds: 2),
  ).show(context);
}

String formatCurrency(num number, {String symbol = 'Rp '}) {
  return NumberFormat.currency(symbol: symbol, decimalDigits: 0, locale: 'id')
      .format(number);
}

Future<XFile?> selectImage() async {
  XFile? selectedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  return selectedImage;
}
