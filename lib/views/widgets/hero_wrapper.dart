import 'package:flutter/material.dart';

/// Wraps widget in Hero if tag is provided
class HeroWrapper extends StatelessWidget {
  const HeroWrapper({super.key, required this.child, this.tag});

  final Widget child;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    if (tag == null) return child;
    return Hero(tag: tag!, child: child);
  }
}
