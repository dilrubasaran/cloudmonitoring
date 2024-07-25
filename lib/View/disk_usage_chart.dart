import 'dart:async';
import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:high_chart/high_chart.dart';

import '../consts_box.dart';

class DiskUsageChart extends StatefulWidget {
  const DiskUsageChart({Key? key}) : super(key: key);

  @override
  _DiskUsageChartState createState() => _DiskUsageChartState();
}

class _DiskUsageChartState extends State<DiskUsageChart> {
  Map<String, int> diskData = {
    'MediaGB': 0,
    'RootGB': 0,
    'Documents': 0,
    'Downloads': 0,
  };
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
        diskData.update('MediaGB', (value) => random.nextInt(100)); //rgb(214, 214, 214)
        diskData.update('RootGB', (value) => random.nextInt(100));
        diskData.update('Documents', (value) => random.nextInt(100));
        diskData.update('Downloads', (value) => random.nextInt(100));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String chartData = jsonEncode({
      'chart': {
        'type': 'bar',
        'backgroundColor': 'transparent',
        "marginRight": 10,
      },
      'title': {
        'text': '',
      },
      'xAxis': {
        'categories': diskData.keys.toList(),
        'title': {
          'text': null,
        },
      },
      'yAxis': {
        'min': 0,
        'title': {
          'text': 'GB',
          'align': 'high',
        },
      },
      'series': [
        {
          'name': 'Kullanım',
          'data': diskData.values.toList(),
          'colorByPoint': true,
          'showInLegend': false,
        },
      ],
      'plotOptions': {
        'series': {
          'animation': {
            'duration': 2000,
          },
        },
      },
    });

     return ConstsBox(
      child: HighCharts(
        data: chartData,
        size: Size.infinite, // Use responsive size from ResponsiveBox
      ),
    );
  }
}
