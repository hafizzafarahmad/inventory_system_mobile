import 'package:flutter/material.dart';

class MenuModel {
  final String name;
  final String key;
  final String id;
  final IconData? icon;

  MenuModel({required this.id, required this.key,  required this.name, this.icon});
}