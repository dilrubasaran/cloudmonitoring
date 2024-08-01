import 'package:flutter/material.dart';

class Zone extends StatelessWidget {
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
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Zone:", style: TextStyle(color:textColor,fontSize: 18, fontWeight: FontWeight.w700)),
          Row(
            children: [
              Icon(Icons.location_on, color: iconColor),
              SizedBox(width: 5),
              Text("eu-west-2b", style: TextStyle(color:textColor, fontSize:12, fontWeight: FontWeight.w700))
            ],
          ),
        ],
      ),
    );
  }
}
