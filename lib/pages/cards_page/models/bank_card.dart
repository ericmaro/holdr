import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BankCard {
  String? id;
  String? cardHolder;
  String? cardNumber;
  String? cvv;
  String? validDate;
  List<String> tags;
  Color color;
  BankCard({
    this.id,
    required this.cardNumber,
    required this.cardHolder,
    required this.cvv,
    required this.validDate,
    required this.tags,
    required this.color,
  });

  BankCard copyWith({
    String? id,
    String? cardNumber,
    String? cardHolder,
    String? cvv,
    String? validDate,
    List<String>? tags,
    Color? color,
  }) {
    return BankCard(
      id: id ?? this.id,
      cardHolder: cardHolder ?? this.cardHolder,
      cardNumber: cardNumber ?? this.cardNumber,
      cvv: cvv ?? this.cvv,
      validDate: validDate ?? this.validDate,
      tags: tags ?? this.tags,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cardHolder': cardHolder,
      'cardNumber': cardNumber,
      'cvv': cvv,
      'validDate': validDate,
      'tags': tags,
      'color': color.value,
    };
  }

  factory BankCard.fromMap(Map<String, dynamic> map) {
    return BankCard(
      id: map['id'],
      cardNumber: map['cardNumber'],
      cardHolder: map['cardHolder'],
      cvv: map['cvv'],
      validDate: map['validDate'],
      tags: map['tags'] == null ? [] : List<String>.from(map['tags']),
      color: Color(map['color']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BankCard.fromJson(String source) =>
      BankCard.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BankCard(id: $id, cardNumber: $cardNumber, cardHolder: $cardHolder, cvv: $cvv, validDate: $validDate, tags: $tags, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BankCard &&
        other.id == id &&
        other.cardNumber == cardNumber &&
        other.cardHolder == cardHolder &&
        other.cvv == cvv &&
        other.validDate == validDate &&
        listEquals(other.tags, tags) &&
        other.color == color;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        cardNumber.hashCode ^
        cardHolder.hashCode ^
        cvv.hashCode ^
        validDate.hashCode ^
        tags.hashCode ^
        color.hashCode;
  }
}
