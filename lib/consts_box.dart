import 'package:flutter/material.dart';

class ConstsBox extends StatelessWidget {
  final Widget child;

  const ConstsBox({required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double padding = constraints.maxWidth < 600 ? 4 : 16; // Adjust padding for mobile and larger screens

        double availableWidth = constraints.maxWidth - 2 * padding; // Total available width for the block
        double boxWidth = constraints.maxWidth < 600
            ? (availableWidth / 2) // On mobile, fit 2 blocks per row
            : 300; // On larger screens, fixed width

        // If the boxWidth is too small, adjust it to avoid being too small
        boxWidth = boxWidth < 150 ? 150 : boxWidth;

        return Padding(
          padding: EdgeInsets.all(padding),
          child: Container(
            width: boxWidth,
            height: boxWidth,
            child: child,
          ),
        );
      },
    );
  }
}
