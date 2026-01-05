import 'package:flutter/material.dart';

class AccentIcon extends StatelessWidget {
  final IconData icon;
  final bool useTertiary;
  final bool useSecondary;

  const AccentIcon({
    super.key,
    required this.icon,
    this.useTertiary = false,
    this.useSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    Color color;
    if (useTertiary) {
      color = colorScheme.tertiary;
    } else if (useSecondary) {
      color = colorScheme.secondary;
    } else {
      color = colorScheme.primary;
    }

    return Icon(icon, size: 80, color: color);
  }
}
