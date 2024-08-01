import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            style: TextStyle(color: textColor,fontSize: 18, fontWeight: FontWeight.w700),
          ),
          Row(
            children: [
              SvgPicture.network(
                'https://www.highcharts.com/samples/graphics/dashboards/cloud-monitoring/instance-ico.svg',
                color: iconColor, // SVG ikonu temadan gelen renk ile renklendirin
                height: 24.0, // İkonun boyutunu belirleyin
                width: 24.0,
              ),
              SizedBox(width: 5),
              Text(
                "t2.micro",
                style: TextStyle(color: textColor,fontSize:12, fontWeight: FontWeight.w700), 
              ),
            ],
          ),
        ],
      ),
    );
  }
}
