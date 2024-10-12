
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class FormatterUtils {
  static bool isValidEmail(String email) {
    // Expresión regular para validar formato de correo electrónico
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  static bool isValidPhone(String phone) {
    // Expresión regular para un número de teléfono de 10 dígitos
    final regex = RegExp(r'^\d{10}$');
    return regex.hasMatch(phone);
  }

  static DateTime onDateFormat({required String date}) {
    late DateTime dateTime;
    final DateFormat format = DateFormat('dd-MM-yyyy');


    if (date.isNotEmpty) {
      try {
        dateTime = format.parse(date);
      } catch (e) {
        dateTime = DateTime.now();
      }
      return dateTime;
    }
    return DateTime.now();
  }


}