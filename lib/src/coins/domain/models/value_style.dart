import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ValueStyle extends Equatable {
  const ValueStyle({
    required this.icon,
    required this.color,
  });

  final IconData icon;
  final Color color;

  factory ValueStyle.negative() {
    return ValueStyle(icon: Icons.trending_down_rounded, color: Colors.red.shade400);
  }

  factory ValueStyle.positive() {
    return ValueStyle(icon: Icons.trending_up_rounded, color: Colors.green.shade400);
  }

  @override
  List<Object?> get props => [icon, color];
}
