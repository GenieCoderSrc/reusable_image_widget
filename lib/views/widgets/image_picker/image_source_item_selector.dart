import 'package:flutter/material.dart';

class ItemSelector extends StatelessWidget {
  const ItemSelector({
    super.key,
    this.icon,
    required this.title,
    required this.onTap,
  });

  final VoidCallback onTap;

  final IconData? icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
  }
}
