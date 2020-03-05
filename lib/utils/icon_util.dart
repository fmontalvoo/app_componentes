import 'package:flutter/material.dart';

final Map<String, IconData> _icons = {
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open
};

Icon getIconByName(String name) {
  return Icon(
    _icons[name],
    color: Colors.blue,
  );
}
