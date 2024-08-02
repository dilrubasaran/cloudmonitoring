//cpu utilization chart created with line chart 
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:high_chart/high_chart.dart';

import '../consts_box.dart';

class CpuUtilizationChart extends StatefulWidget {
  const CpuUtilizationChart({Key? key}) : super(key: key);

  @override
  _CpuUtilizationChartState createState() => _CpuUtilizationChartState();
}

class _CpuUtilizationChartState extends State<CpuUtilizationChart> {
  List<Map<String, dynamic>> cpuData = [];
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
      var currentTime = DateTime.now().millisecondsSinceEpoch;

      setState(() {
        cpuData.add({
          'x': currentTime,
          'y': random.nextInt(100),
        });

      
        if (cpuData.length > 20) {
          cpuData.removeAt(0);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String chartData = '''
    {
      "chart": {
        "type": "spline",
        "animation": true,
        "marginRight": 10
      },
      "title": {
        "text": "CPU Utilization"
      },
      "xAxis": {
        "type": "datetime",
        "tickPixelInterval": 150
      },
      "yAxis": {
        "title": {
          "text": "Percent"
        },
        "plotLines": [{
          "value": 0,
          "width": 1,
          "color": "#33a29d",
        }]
      },
      "tooltip": {
        "formatter": function() {
          return '<b>' + this.series.name + '</b><br/>' +
          Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
          Highcharts.numberFormat(this.y, 2);
        }
      },
      "legend": {
        "enabled": false
      },
      "exporting": {
        "enabled": false
      },
      "series": [{
        "name": "CPU Usage",
        "data": ${jsonEncode(cpuData)},
        'color': '#33a29d',
      }],
      "plotOptions": {
        "series": {
          "animation": {
            "duration": 2000
          }
        }
      }
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
