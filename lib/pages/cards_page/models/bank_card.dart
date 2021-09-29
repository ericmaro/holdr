import 'dart:math';

import 'package:flutter/material.dart';

class BankCard {
  String cardNumber;
  int cvv;
  String validDate;
  List tags;

  BankCard({required this.cardNumber, required this.cvv, required this.validDate, required this.tags});
}