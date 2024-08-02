//Ami block on screen

import 'package:flutter/material.dart';

class AMI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Tema renkleri
    Color backgroundColor = theme.cardColor;
    Color textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;
    Color iconColor = Color.fromARGB(255,58, 68, 200); 



    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("AMI:", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w700)),
          Row(
            children: [
              Icon(Icons.storage, color:iconColor),
              SizedBox(width: 5),
              Text("ami-0123456", style: TextStyle(color:textColor,fontSize:12, fontWeight: FontWeight.w700))
            ],
          ),
        ],
      ),
    );
  }
}
