//OS block on screen

import 'package:flutter/material.dart';

class OS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Tema renkleri
    Color backgroundColor = theme.cardColor;
    Color textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;
    Color iconColor = Color.fromARGB(255,62, 164, 141); 
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("OS:", style: TextStyle(color: textColor,fontSize: 18, fontWeight: FontWeight.w700)),
          Row(
            children: [
              Icon(Icons.laptop, color: iconColor),
              SizedBox(width: 5),
              Text("Amazon Linux", style: TextStyle(color: textColor,fontSize:12, fontWeight: FontWeight.w700))
            ],
          ),
        ],
      ),
    );
  }
}
