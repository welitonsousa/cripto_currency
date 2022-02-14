import 'package:flutter/material.dart';
import 'package:mask/mask.dart';

class Formatters {
  static String money(double value) {
    final old = TextEditingValue(text: value.toStringAsFixed(2));
    final mask = Mask.money(decimal: ',', fracion: '.', moneySymbol: '\$')
        .formatEditUpdate(old, old);
    return mask.text;
  }
}
