import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class CategoryModel {
  final String title;
  final String id;
  final Color color;

  CategoryModel({
    this.color = Colors.orange,
    required this.title,
    required this.id,
  });
}
