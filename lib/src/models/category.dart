import 'package:flutter/material.dart';

class Category {
  final int id;
  final String name;
  final String image;
  final Color bgColor;
  final Color borderColor;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.bgColor,
    required this.borderColor,
  });
}
