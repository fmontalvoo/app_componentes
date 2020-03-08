import 'package:flutter/material.dart';

final Map<String, IconData> _icons = {
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'tune': Icons.tune,
  'list': Icons.list,
};

Icon getIconByName(String name) {
  return Icon(
    _icons[name],
    color: Colors.blue,
  );
}
