import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:high_chart/high_chart.dart';

import '../consts_box.dart';

class DiskSpaceChart extends StatefulWidget {
  const DiskSpaceChart({Key? key}) : super(key: key);

  @override
  _DiskSpaceChartState createState() => _DiskSpaceChartState();
}

class _DiskSpaceChartState extends State<DiskSpaceChart> {
  double diskSpace = 0.0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const duration = Duration(seconds: 2);
    timer = Timer.periodic(duration, (Timer t) {
      var random = Random();
      setState(() {
        diskSpace = 20 + random.nextDouble() * 15;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String chartData = '''
    {
      "chart": {
        "type": "solidgauge",
        "backgroundColor": "transparent",
        "plotShadow": false
      },
      "title": {
        "text": ""
      },
      "subtitle": {
        "text": "Disk Space",
        "verticalAlign": "middle",
        "y": 30, // Y ekseninde daha aşağıda konumlandırma
        "style": {
          "color": "#000",
          "font-size":"14px",
           "opacity":"0.4", 
          "text-alig": "center",
        }
      },
      "pane": {
        "center": ["50%", "50%"],
        "size": "80%",
        "startAngle": 0,
        "endAngle": 360,
        "background": {
          "backgroundColor": "transparent",
          "innerRadius": "80%",
          "outerRadius": "100%",
          "shape": "arc"
        }
      },
      "tooltip": {
        "enabled": false
      },
      "yAxis": {
        "min": 0,
        "max": 200,
        "lineWidth": 0,
        "tickPositions": []
      },
      "plotOptions": {
        "solidgauge": {
          "dataLabels": {
            "enabled": true,
            "borderWidth": 0,
            "useHTML": true,
            "format": "<div style='text-align:center'><span style='font-size:22px'>{y} GB </span></div>"
            },
            "linecap": "round",
          "innerRadius": "80%", 
          "outerRadius": "100%"
          
        },
      },
      "series": [{
        "name": "Memory Kullanımı",
        "data": [{
          "y": ${diskSpace.toStringAsFixed(2)},
          "color": "rgb(126, 189, 94)",
        }],
        "dataLabels": {
          "y": -30,
          "borderWidth": 0,
          "useHTML": true
        }
      }]
    }
    ''';

     return ConstsBox(
      child: HighCharts(
        data: chartData,
        size: Size.infinite, // Use responsive size from ResponsiveBox
      ),
    );
  }
}
  
