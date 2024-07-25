import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:high_chart/high_chart.dart';
import 'package:cloudmonitoring/consts_box.dart';

class CpuChart extends StatefulWidget {
  const CpuChart({Key? key}) : super(key: key);

  @override
  _CpuChartState createState() => _CpuChartState();
}

class _CpuChartState extends State<CpuChart> {
  double cpuUsage = 0.0;
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
        cpuUsage = random.nextDouble() * 100; // 0-100 arası yüzdelik değer
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Tema renklerini al
    Color backgroundColor = theme.scaffoldBackgroundColor;
    Color blockColor = theme.cardColor;
    Color textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;

    // Renkleri hex formatına dönüştür
    String backgroundColorHex = _colorToHex(backgroundColor);
    String blockColorHex = _colorToHex(blockColor);
    String textColorHex = _colorToHex(textColor);

    String chartData = '''
    {
      "chart": {
        "type": "solidgauge",
        "backgroundColor": "$backgroundColorHex",
        "plotShadow": false
      },
      "title": {
        "text": ""
      },
      "subtitle": {
        "text": "CPU",
        "verticalAlign": "middle",
        "y": 30,
        "style": {
          "fontSize": "20px",
          "color": "$textColorHex"
        }
      },
      "pane": {
        "center": ["50%", "50%"],
        "size": "80%",
        "startAngle": 0,
        "endAngle": 360,
        "background": [{
          "backgroundColor": "$blockColorHex",
          "innerRadius": "60%",
          "outerRadius": "100%",
          "shape": "arc"
        }]
      },
      "tooltip": {
        "enabled": false
      },
      "yAxis": {
        "min": 0,
        "max": 100,
        "lineWidth": 0,
        "tickPositions": [],
        "stops": [
            [0.1, '#33A29D'], // green
            [0.5, '#DDDF0D'], // yellow
            [0.9, '#DF5353'], // red
        ],
      },
      "plotOptions": {
        "solidgauge": {
          "dataLabels": {
            "enabled": true,
            "borderWidth": 0,
            "useHTML": true,
            "format": "<div style='text-align:center'><span style='font-size:22px;'>{y}% </span></div>"
          },
          "linecap": "round",
          "innerRadius": "60%", // İç yarıçap
          "outerRadius": "100%"  // Dış yarıçap
        }
      },
      "series": [{
        "name": "CPU Kullanımı",
        "data": [{
          "y": ${cpuUsage.toStringAsFixed(2)},
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

  // Helper function to convert Color to hex code
  String _colorToHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }
}
