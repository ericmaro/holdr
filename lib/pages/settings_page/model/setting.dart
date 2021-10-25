import 'dart:convert';
import 'package:flutter/material.dart';

class Setting {
  final String title;
  final String? subtitle;
  final bool isSwitch;
  final IconData? icon;
  Setting({
    required this.title,
    this.subtitle,
    required this.isSwitch,
    this.icon,
  });

  Setting copyWith({
    String? title,
    String? subtitle,
    bool? isSwitch,
    IconData? icon,
  }) {
    return Setting(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isSwitch: isSwitch ?? this.isSwitch,
      icon: icon ?? this.icon,
    );
  }

  @override
  String toString() {
    return 'Setting(title: $title, subtitle: $subtitle, isSwitch: $isSwitch, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Setting &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.isSwitch == isSwitch &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        subtitle.hashCode ^
        isSwitch.hashCode ^
        icon.hashCode;
  }
}
