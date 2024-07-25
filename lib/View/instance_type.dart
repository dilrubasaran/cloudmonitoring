import 'package:flutter/material.dart';

class InstanceType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Tema renkleri
    Color backgroundColor = theme.cardColor;
    Color textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;
    Color iconColor = Colors.orange; 

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor, // Temadan gelen arka plan rengi
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Instance type:",
            style: TextStyle(color: textColor), // Temadan gelen yazı rengi
          ),
          Row(
            children: [
              Icon(Icons.memory, color: iconColor), // Sabit bir renk kullanıldı
              SizedBox(width: 5),
              Text(
                "t2.micro",
                style: TextStyle(color: textColor), // Temadan gelen yazı rengi
              ),
            ],
          ),
        ],
      ),
    );
  }
}
