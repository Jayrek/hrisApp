import 'package:flutter/material.dart';

class WidgetUtil {
  static Widget customDivider() => Divider(
        height: 1,
        color: Colors.grey.withOpacity(0.5),
      );

  static Widget dataHeaderLabel(String label) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
