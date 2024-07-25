import 'dart:math';
import 'package:flutter/material.dart';

class HealthChart extends StatelessWidget {
  const HealthChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Küçük ekranlar için boyutları ayarla
        double size = min(constraints.maxWidth, constraints.maxHeight) * 0.5;
        double iconSize = size * 0.5;
        double fontSize = size * 0.2;

        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
          
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: iconSize,
              ),
              SizedBox(height: size * 0.1),
              Text(
                'Health',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
